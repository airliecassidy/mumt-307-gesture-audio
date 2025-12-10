// OSC Connection


var osc = new OSC();
osc.open(); // connect to ws://localhost:8080

var oscConnected = false;

osc.on('open', function() {
  oscConnected = true;
  document.getElementById('oscStatus').textContent = 'Connected';
  document.getElementById('oscStatus').style.color = 'green';
  console.log('OSC connected');
});

osc.on('close', function() {
  oscConnected = false;
  document.getElementById('oscStatus').textContent = 'Disconnected';
  document.getElementById('oscStatus').style.color = 'red';
  console.log('OSC disconnected');
});

osc.on('error', function(err) {
  document.getElementById('oscStatus').textContent = 'Error';
  document.getElementById('oscStatus').style.color = 'red';
  console.log('OSC error:', err);
});

// Listen for processed audio from Max
osc.on('/audio/processed', function(message) {
  // Handle processed audio coming back from Max
  console.log('Received processed audio from Max');
});

// Send OSC message
function sendOSC(address, ...args) {
  if (oscConnected) {
    var message = new OSC.Message(address, ...args);
    osc.send(message);
  }
}

// Audio Context and Processing
let audioContext = null;
let sourceNode = null;
let audioBuffer = null;
let isPlaying = false;
let scriptProcessor = null;

const BUFFER_SIZE = 2048;
const SAMPLE_RATE = 44100;

// Initialize audio context
function initAudio() {
  if (!audioContext) {
    audioContext = new (window.AudioContext || window.webkitAudioContext)({
      sampleRate: SAMPLE_RATE
    });
  }
  return audioContext;
}

// Load audio file
document.getElementById('audioFile').addEventListener('change', function(e) {
  const file = e.target.files[0];
  if (!file) return;
  
  document.getElementById('audioStatus').textContent = 'Loading...';
  
  const reader = new FileReader();
  reader.onload = function(event) {
    initAudio();
    audioContext.decodeAudioData(event.target.result, function(buffer) {
      audioBuffer = buffer;
      document.getElementById('audioStatus').textContent = 
        file.name + ' (' + buffer.duration.toFixed(1) + 's)';
      console.log('Audio loaded:', file.name, buffer.duration + 's', buffer.sampleRate + 'Hz');
    }, function(err) {
      document.getElementById('audioStatus').textContent = 'Error loading file';
      console.error('Decode error:', err);
    });
  };
  reader.readAsArrayBuffer(file);
});

// Play audio and stream to Max
function playAudio() {
  if (!audioBuffer) {
    alert('Please load an audio file first');
    return;
  }
  
  if (isPlaying) {
    stopAudio();
  }
  
  initAudio();
  if (audioContext.state === 'suspended') {
    audioContext.resume();
  }
  
  // Create source
  sourceNode = audioContext.createBufferSource();
  sourceNode.buffer = audioBuffer;
  sourceNode.loop = document.getElementById('loopAudio').checked;
  
  // Create script processor to capture audio data
  scriptProcessor = audioContext.createScriptProcessor(BUFFER_SIZE, 2, 2);
  
  let frameCount = 0;
  scriptProcessor.onaudioprocess = function(e) {
    const leftIn = e.inputBuffer.getChannelData(0);
    const rightIn = e.inputBuffer.getChannelData(1);
    const leftOut = e.outputBuffer.getChannelData(0);
    const rightOut = e.outputBuffer.getChannelData(1);
    
    // Pass through audio (you'll hear original while Max processes)
    for (let i = 0; i < BUFFER_SIZE; i++) {
      leftOut[i] = leftIn[i];
      rightOut[i] = rightIn[i];
    }
    
    // Send audio samples to Max (downsampled for OSC bandwidth)
    // Send every 8th frame to reduce bandwidth
    frameCount++;
    if (frameCount % 8 === 0 && oscConnected) {
      // Convert to array of floats and downsample
      const downsampleFactor = 16;
      const samples = Math.floor(BUFFER_SIZE / downsampleFactor);
      const leftSamples = [];
      const rightSamples = [];
      
      for (let i = 0; i < samples; i++) {
        leftSamples.push(leftIn[i * downsampleFactor]);
        rightSamples.push(rightIn[i * downsampleFactor]);
      }
      
      // Send as OSC bundle
      sendOSC('/audio/left', ...leftSamples);
      sendOSC('/audio/right', ...rightSamples);
    }
  };
  
  // Connect: source -> scriptProcessor -> destination
  sourceNode.connect(scriptProcessor);
  scriptProcessor.connect(audioContext.destination);
  
  sourceNode.start(0);
  isPlaying = true;
  
  // Send play message to Max
  sendOSC('/transport', 1);
  
  sourceNode.onended = function() {
    if (!sourceNode.loop) {
      stopAudio();
    }
  };
  
  console.log('Audio playing, streaming to Max...');
}

function stopAudio() {
  if (sourceNode) {
    try {
      sourceNode.stop();
    } catch(e) {}
    sourceNode.disconnect();
    sourceNode = null;
  }
  if (scriptProcessor) {
    scriptProcessor.disconnect();
    scriptProcessor = null;
  }
  isPlaying = false;
  sendOSC('/transport', 0);
  console.log('Audio stopped');
}

// HTML Elements
const videoElement = document.getElementsByClassName("input_video")[0];
const videoSelect = document.querySelector("select#videoSource");
const canvasElement = document.getElementsByClassName("output_canvas")[0];
const canvasCtx = canvasElement.getContext("2d");
const showTracking = document.getElementById("showTracking");
const selfieCheckbox = document.getElementById("selfie");
const fpsOutput = document.getElementById("fps");
const pinchValueDisplay = document.getElementById("pinchValue");
const currentGestureDisplay = document.getElementById("currentGesture");

// Effect elements
const effectUI = {
  reverb: { active: document.getElementById("reverbActive"), depth: document.getElementById("reverbDepth") },
  distortion: { active: document.getElementById("distortionActive"), depth: document.getElementById("distortionDepth") },
  echo: { active: document.getElementById("echoActive"), depth: document.getElementById("echoDepth") },
  chorus: { active: document.getElementById("chorusActive"), depth: document.getElementById("chorusDepth") },
  pitch: { active: document.getElementById("pitchActive"), depth: document.getElementById("pitchDepth") }
};


// State
const effects = {
  reverb: { active: false, depth: 0 },
  distortion: { active: false, depth: 0 },
  echo: { active: false, depth: 0 },
  chorus: { active: false, depth: 0 },
  pitch: { active: false, depth: 0 }
};

// Gesture detection state
let currentGesture = null;
let gestureStartTime = 0;
let gestureConfirmed = false;
let lastGestureTime = 0;
const HOLD_TIME = 400;
const COOLDOWN = 700;

// effect depth smoothing
let depthHistory = [];
const SMOOTH_FRAMES = 5;

// FPS counter
let fpsCounter = 0;
let fpsTime = Date.now();

// control panel toggle
function toggleControl() {
  let controlPanel = document.getElementsByClassName("control-panel")[0];
  let controlButton = document.getElementById("controlButton");
  if (controlPanel.style.display === "none") {
    controlPanel.style.display = "block";
    controlButton.innerHTML = "Hide controls";
  } else {
    controlPanel.style.display = "none";
    controlButton.innerHTML = "Show controls";
  }
}

// Camera Selection
function gotDevices(deviceInfos) {
  while (videoSelect.firstChild) {
    videoSelect.removeChild(videoSelect.firstChild);
  }
  for (let i = 0; i < deviceInfos.length; i++) {
    const deviceInfo = deviceInfos[i];
    if (deviceInfo.kind === "videoinput") {
      const option = document.createElement("option");
      option.value = deviceInfo.deviceId;
      option.text = deviceInfo.label || `Camera ${videoSelect.length + 1}`;
      videoSelect.appendChild(option);
    }
  }
}

function gotStream(stream) {
  window.stream = stream;
  videoElement.srcObject = stream;
  return navigator.mediaDevices.enumerateDevices();
}

function handleError(error) {
  console.log("Camera error:", error.message, error.name);
}

navigator.mediaDevices.enumerateDevices().then(gotDevices).catch(handleError);

function start() {
  const videoSource = videoSelect.value;
  const constraints = {
    video: { deviceId: videoSource ? { exact: videoSource } : undefined }
  };
  navigator.mediaDevices
    .getUserMedia(constraints)
    .then(gotStream)
    .then(gotDevices)
    .catch(handleError);
}

videoSelect.onchange = start;

// Gesture Detection
function dist(a, b) {
  return Math.sqrt(Math.pow(a.x - b.x, 2) + Math.pow(a.y - b.y, 2));
}

function fingerExtended(landmarks, tip, mcp) {
  const tipDist = dist(landmarks[tip], landmarks[0]);
  const mcpDist = dist(landmarks[mcp], landmarks[0]);
  return tipDist > mcpDist * 1.1;
}

function fingerCurled(landmarks, tip, mcp) {
  const tipDist = dist(landmarks[tip], landmarks[0]);
  const mcpDist = dist(landmarks[mcp], landmarks[0]);
  return tipDist < mcpDist * 1.05;
}

// peace sign detection
function detectPeace(lm) {
  const indexUp = fingerExtended(lm, 8, 5);
  const middleUp = fingerExtended(lm, 12, 9);
  const ringDown = fingerCurled(lm, 16, 13);
  const pinkyDown = fingerCurled(lm, 20, 17);
  return indexUp && middleUp && ringDown && pinkyDown;
}

// Fist - all fingers curled, thumb tucked
function detectFist(lm) {
  const indexDown = fingerCurled(lm, 8, 5);
  const middleDown = fingerCurled(lm, 12, 9);
  const ringDown = fingerCurled(lm, 16, 13);
  const pinkyDown = fingerCurled(lm, 20, 17);
  
  // Check thumb is tucked - tip near palm/index base
  const thumbTip = lm[4];
  const indexBase = lm[5];
  const palmCenter = lm[9];
  const thumbNearPalm = dist(thumbTip, indexBase) < 0.1 || dist(thumbTip, palmCenter) < 0.12;
  
  return indexDown && middleDown && ringDown && pinkyDown && thumbNearPalm;
}

// One finger - only index up
function detectOne(lm) {
  const indexUp = fingerExtended(lm, 8, 5);
  const middleDown = fingerCurled(lm, 12, 9);
  const ringDown = fingerCurled(lm, 16, 13);
  const pinkyDown = fingerCurled(lm, 20, 17);
  return indexUp && middleDown && ringDown && pinkyDown;
}

// Palm - all fingers extended
function detectPalm(lm) {
  const indexUp = fingerExtended(lm, 8, 5);
  const middleUp = fingerExtended(lm, 12, 9);
  const ringUp = fingerExtended(lm, 16, 13);
  const pinkyUp = fingerExtended(lm, 20, 17);
  
  // Palm facing camera - fingers pointing up
  const avgTipY = (lm[8].y + lm[12].y + lm[16].y + lm[20].y) / 4;
  const avgMcpY = (lm[5].y + lm[9].y + lm[13].y + lm[17].y) / 4;
  const tipsAbove = avgTipY < avgMcpY;
  
  return indexUp && middleUp && ringUp && pinkyUp && tipsAbove;
}

// Thumbs up - thumb pointing up, fingers curled
function detectThumbsUp(lm) {
  const indexDown = fingerCurled(lm, 8, 5);
  const middleDown = fingerCurled(lm, 12, 9);
  const ringDown = fingerCurled(lm, 16, 13);
  const pinkyDown = fingerCurled(lm, 20, 17);
  
  // Thumb pointing up
  const thumbTip = lm[4];
  const thumbBase = lm[2];
  const wrist = lm[0];
  const thumbUp = thumbTip.y < thumbBase.y && thumbTip.y < wrist.y - 0.05;
  
  return indexDown && middleDown && ringDown && pinkyDown && thumbUp;
}

// Back of hand - fingers extended, back facing camera
function detectBackOfHand(lm) {
  const indexUp = fingerExtended(lm, 8, 5);
  const middleUp = fingerExtended(lm, 12, 9);
  const ringUp = fingerExtended(lm, 16, 13);
  const pinkyUp = fingerExtended(lm, 20, 17);
  
  // Check z-depth: knuckles further from camera than wrist
  const avgKnuckleZ = (lm[5].z + lm[9].z + lm[13].z + lm[17].z) / 4;
  const backFacing = avgKnuckleZ > lm[0].z + 0.02;
  
  return indexUp && middleUp && ringUp && pinkyUp && backFacing;
}

function detectGesture(lm) {
  if (detectThumbsUp(lm)) return "thumbsup";
  if (detectPeace(lm)) return "peace";
  if (detectOne(lm)) return "one";
  if (detectFist(lm)) return "fist";
  if (detectBackOfHand(lm)) return "back";
  if (detectPalm(lm)) return "palm";
  return null;
}

const GESTURE_MAP = {
  "peace": "reverb",
  "fist": "distortion",
  "one": "echo",
  "palm": "chorus",
  "thumbsup": "pitch"
};

function processGesture(gesture) {
  const now = Date.now();
  
  if (now - lastGestureTime < COOLDOWN) {
    return;
  }
  
  if (gesture === currentGesture && gesture !== null) {
    if (!gestureConfirmed && now - gestureStartTime >= HOLD_TIME) {
      gestureConfirmed = true;
      lastGestureTime = now;
      
      if (gesture === "back") {
        killAllEffects();
        currentGestureDisplay.textContent = "KILL ALL";
      } else if (GESTURE_MAP[gesture]) {
        toggleEffect(GESTURE_MAP[gesture]);
        currentGestureDisplay.textContent = gesture + " → " + GESTURE_MAP[gesture];
      }
    }
  } else {
    currentGesture = gesture;
    gestureStartTime = now;
    gestureConfirmed = false;
    currentGestureDisplay.textContent = gesture ? gesture + "..." : "None";
  }
}

// Effect Control
function toggleEffect(name) {
  effects[name].active = !effects[name].active;
  const val = effects[name].active ? 1 : 0;
  
  sendOSC("/fx/" + name + "/active", val);
  effectUI[name].active.checked = effects[name].active;
  
  console.log(name, "=", effects[name].active);
}

function killAllEffects() {
  for (const name in effects) {
    effects[name].active = false;
    effects[name].depth = 0;
    sendOSC("/fx/" + name + "/active", 0);
    sendOSC("/fx/" + name + "/depth", 0);
    effectUI[name].active.checked = false;
    effectUI[name].depth.textContent = "0";
  }
  sendOSC("/fx/kill", 1);
  console.log("All effects killed");
}

function updateDepth(value) {
  depthHistory.push(value);
  if (depthHistory.length > SMOOTH_FRAMES) {
    depthHistory.shift();
  }
  const smoothed = depthHistory.reduce((a, b) => a + b, 0) / depthHistory.length;
  const pct = Math.round(smoothed * 100);
  
  pinchValueDisplay.textContent = pct;
  
  for (const name in effects) {
    if (effects[name].active) {
      effects[name].depth = pct;
      sendOSC("/fx/" + name + "/depth", smoothed);
      effectUI[name].depth.textContent = pct;
    }
  }
}

//pinch distance
function calcPinch(lm) {
  const thumbTip = lm[4];
  const indexTip = lm[8];
  const d = Math.sqrt(
    Math.pow(thumbTip.x - indexTip.x, 2) +
    Math.pow(thumbTip.y - indexTip.y, 2)
  );
  return Math.max(0, Math.min(1, (d - 0.03) / 0.22));
}

// MediaPipe Results Handler
function onResults(results) {
  fpsCounter++;
  const now = Date.now();
  if (now - fpsTime >= 1000) {
    fpsOutput.textContent = fpsCounter;
    fpsCounter = 0;
    fpsTime = now;
  }
  
  canvasCtx.save();
  canvasCtx.clearRect(0, 0, canvasElement.width, canvasElement.height);
  canvasCtx.drawImage(results.image, 0, 0, canvasElement.width, canvasElement.height);
  
  let leftHand = null;
  let rightHand = null;
  
  if (results.multiHandLandmarks && results.multiHandedness) {
    for (let index = 0; index < results.multiHandLandmarks.length; index++) {
      const classification = results.multiHandedness[index];
      const isRightHand = classification.label === "Right";
      const landmarks = results.multiHandLandmarks[index];
      
      if (showTracking.checked) {
        drawConnectors(canvasCtx, landmarks, HAND_CONNECTIONS, {
          color: isRightHand ? "#fff" : "#056df5"
        });
        drawLandmarks(canvasCtx, landmarks, {
          color: isRightHand ? "#fff" : "#056df5",
          fillColor: isRightHand ? "#056df5" : "#fff",
          radius: (x) => lerp(x.from.z, -0.15, 0.1, 10, 1)
        });
      }
      
      if (isRightHand) {
        rightHand = landmarks;
      } else {
        leftHand = landmarks;
      }
    }
  }
  
  if (rightHand) {
    const g = detectGesture(rightHand);
    processGesture(g);
  } else {
    processGesture(null);
  }
  
  if (leftHand) {
    const pinch = calcPinch(leftHand);
    updateDepth(pinch);
  }
  
  canvasCtx.restore();
}

// Selfie Toggle
selfieCheckbox.addEventListener("change", function() {
  hands.setOptions({ selfieMode: this.checked });
});

// Initialization of MediaPipe Hands
const hands = new Hands({
  locateFile: (file) => {
    return `https://cdn.jsdelivr.net/npm/@mediapipe/hands@0.4/${file}`;
  }
});

hands.setOptions({
  selfieMode: true,
  maxNumHands: 2,
  modelComplexity: 1,
  minDetectionConfidence: 0.5,
  minTrackingConfidence: 0.5
});

hands.onResults(onResults);

// Initialize Camera
const camera = new Camera(videoElement, {
  onFrame: async () => {
    await hands.send({ image: videoElement });
  },
  width: 1280,
  height: 720
});
camera.start();
