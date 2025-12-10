# Hand Gesture Control for Real-Time Audio Effects

## 1. Abstract
This project implements a real-time system that enables musicians to control audio effects through hand gestures captured by a standard webcame. By integrating Google's MediaPipe Hands framework for computer vision with Max/MSP for digital signal processing, the system enables musicians and producers to manipulate audio parameters without physical contact with equipment. Users load an audio file into the browser interface, which streams the audio to Max/MSP for processing while gesture data controls the effects in real-time. The right hand controls discrete effect activation through recognized gestures (fist, palm, peace sign, thumbs-up, single finger), while the left hand provides continuous parameter modulation through pinch distance measuremnet. Five audio-effects - distortion, reverb, echo, chorus and pitch-shifting - can be toggled independently and layered simultaneously, with gesture controlled depth parameters affecting the intensity of each active effect. Communication between the browser-based vision system and Max/MSP is achieved through Open Sound Control (OSC) protocol via a WebSocket-to-UDP bridge server. The system performs reliably on standard laptop webcams under typical indoor lighting conditions, achieving approximately 30 frames per second gesture recognition with latency suitable for interactive audio manipulation.

## 2. Motivation & Objectives 
The primary motivation for this project emerged from a desire to create a more expressive, embodied way of manipulating audio effects during music production and sound design. Traditional DAW workflows require precise mouse movements or memorized keyboard shortcuts to adjust effect parameters—interactions that feel disconnected from the physical, gestural nature of musical performance.
I envisioned a system where these adjustments could be made through natural hand-gestures, allowing continuous playing while dramatically shaping the sound. The main objectives I had for this project were: 
>**1. Hands-free effect control:** Enable toggling of audio effects without touching equipment.
>
>**2. Continuous parameter modulation:** Provide smooth, real-time control over effect depth/intensity. 
>
>**3. Low latency:** Achiee response times suitable for live musical performace.
>
>**4. Accessibility:** Require only a laptop, rather than specialized sensors.
>

The system uses a toggle-based interaction model, where gestures act as an on/off switch, rather than requiring sustaining poses. This allows the performer to make a gesture, return their hand to a neutral position, and have the effect remain active until explicitly toggled off—mirroring the behavior of traditional stomp-box effect pedals.

## 3. Background & Related Works 

### 3.1 Hand Tracking in Computer Vision 
Real-time hand tracking has progressed significantly with the advent of deep learning approaches. Traditional methods relied on color-based segmentation (requiring controlled backgrounds) or depth sensors (requiring specialized hardware like the Kinect). Modern solutions such as MediaPipe Hands (Lugaresi et al., 2019) achieve robust tracking from monocular RGB input through a two-stage neural network pipeline: a palm detector followed by a hand landmark model that predicts 21 3D keypoints per hand.

### 3.2 Gesture-Based Musical Interfaces
The concept of gestural control in music has historical precedent in instruments like the theremin (1920) and more recently in commercial products like the Leap Motion controller. Academic research has explored hand gestures for controlling synthesis parameters (Fels & Hinton, 1993), triggering samples (Weinberg & Driscoll, 2006), and conducting virtual orchestras (Lee et al., 2004). This project builds on these foundations while prioritizing accessibility through browser-based implementation and commodity webcams.

## 4. System Architecture & Design
The system comprises four interconnected layers, each responsible for a distict aspect of the gesture-to-audio pipeline: 



## 5. Methodology 
### 5.1 Hand Tracking with MediaPipe
MediaPipe Hands employs a two-stage detection pipeline optimized for real-time performance. The first stage uses a lightweight palm detector to locate hands within the frame, reducing the search space for the subsequent landmark model. The second  stage predicts 21 three-dmensional landmarks per detected hand, representing key anatomical points from the wrist through each fingertip. 

<img width="878" height="424" alt="image" src="https://github.com/user-attachments/assets/6d794dcc-b1d1-4cb5-991d-5d0749d3f265" />

Figure 1: MediaPipe hand landmark indices. The model outputs 21 keypoints with x,y,z coordinates.


The JavaScript implementation initializes MediaPipe Hands with the following configuration: 

<img width="674" height="285" alt="Screenshot 2025-12-10 at 11 59 14 AM" src="https://github.com/user-attachments/assets/eaaefd9b-01b0-4eef-8cf4-af1767efbcf7" />

### 5.2 Gesture recognition 
Gesture recognition is implemented through geometric analysis of landmark positions. Rather than training a separate machine learning classifier (which would require collecting and labeling training data), I developed rule-based detection functions that analyze finger extension patterns, relative distances, and spatial relationships.

The fundamental building block is determining whether each finger is extended or curled. This is achieved by comparing the distance from the fingertip to the wrist against the distance from the finger's metacarpophalangeal (MCP) joint to the wrist:

<img width="479" height="258" alt="Screenshot 2025-12-10 at 12 05 35 PM" src="https://github.com/user-attachments/assets/881767e6-0250-4e61-9f40-0c95edcef339" />

Five distinct gestures are recognized, each mapped to an audio effect:

> Fist - Distortion
> 
> Palm - Chrous
> 
> Peace - Reverb
> 
> Thumbs Up - Pitch Shift
> 
> One Finger - Echo/Delay
> 

  Example implementation of the peace sign detection:

  <img width="473" height="183" alt="Screenshot 2025-12-10 at 12 07 10 PM"   src="https://github.com/user-attachments/assets/ed37df42-d022-4489-85e7-e36cfa35ddd3" />

To prevent accidental triggers from transient hand positions, gestures must be held for a minimum duration before activation. Additionally, a cooldown period prevents rapid repeated toggles:

<img width="739" height="604" alt="Screenshot 2025-12-10 at 12 09 00 PM" src="https://github.com/user-attachments/assets/dfb0590b-8eca-4856-9719-cc4755f56518" />

The left hand provides continuous control through pinch distance measurement—the Euclidean distance between thumb tip (landmark 4) and index tip (landmark 8):

<img width="455" height="209" alt="Screenshot 2025-12-10 at 12 09 52 PM" src="https://github.com/user-attachments/assets/38e3327e-f2cd-4a3a-82fe-fbb708b81a15" />

A moving average filter smooths the raw pinch values to prevent jittery parameter changes:

<img width="661" height="414" alt="Screenshot 2025-12-10 at 12 11 11 PM" src="https://github.com/user-attachments/assets/60b00f39-f427-4986-87b5-8db2c01b93a8" />


### 5.3 OSC Communication Protocol 
Browser security restrictions prevent direct UDP socket access, necessitating a WebSocket-to-UDP bridge architecture. The browser client connects to a Node.js server via WebSocket, which then forwards OSC messages as UDP packets to Max/MSP.

The Node.js bridge server uses the osc-js library with its BridgePlugin to handle protocol translation:
<img width="529" height="348" alt="Screenshot 2025-12-10 at 1 26 07 PM" src="https://github.com/user-attachments/assets/a98ff551-7dcb-4d2a-9569-061f2274750f" />


### 5.4 Audio Effects Implementation in Max/MSP
All audio effects are implemented in Max/MSP using a consistent architecure. The Max/MSP audio engine receives OSC messages via *[udpreceive 8000]* and routes them to individual effect modules. Each effect is implemented as a separate patch that receives audio via *[receive~ audio_in_l/r]* and outputs processed signal via *[send~ fx_wet_l/r].* A key architectural decision across all effects is the separation of two control envelopes: depth (controlling effect intensity) and active (controlling wet signal presence). This makes each effect feel like a pressure-sensitive control rather than a binary on/off stompbox.

### 5.4.1 Reverb Effect
The reverb effect is implemented using a custom delay-network reverb design based on the Schroeder reverb. This classic algorithm combines diffusion stages followed by parallel feedback comb filters to simulate spatial reverberation.

The incoming audio first passes through multiple allpass diffusion stages implemented using short delay lines. These spread the impulse response in time without coloring the frequency spectrum, creating the initial "smear" of early reflections. After diffusion, the signal is fed into several parallel feedback comb filters, each with a slightly different delay length (chosen to be mutually prime to avoid metallic resonances) and feedback coefficient. Together, these generate a dense late reverb tail that decays naturally.

<img width="761" height="242" alt="Screenshot 2025-12-10 at 12 47 42 PM" src="https://github.com/user-attachments/assets/28150c03-dc49-476f-942a-b8fb3c0fa349" />
Fig. Schroeder reverberator. 

Gesture control is applied after the acoustic structure of the reverb has already been generated. The reverb_depth parameter controls the wet signal amplitude rather than altering the internal feedback network directly—this is an important design decision that avoids instability. Modifying feedback coefficients in real-time can cause runaway oscillation or abrupt tonal changes; controlling output level is much safer.

The reverb_active parameter enables or disables the output using a smoothed gain envelope (100ms fade time for reverb, longer than other effects to avoid truncating the tail), ensuring clicks and discontinuities do not occur. The right-hand peace gesture toggles reverb on and off.


### 5.4.2 Distortion Effect
The distortion patches trats the audio signal with a nonlinear transfer function to produce harmonics and saturation. I use a waveshaping approach, rather than hard clipping, specifically employing *[tanh~]* which provides smooth soft-clipping characteristics that are more musically pleasing than abrupt digital clipping. 

Inside the patch, the incoming audio is first scaled by a pre-gain factor driven by *distortion_depth*. A low depth value keeps the signal mostly in the linear region of the transfer function, while higher depths push it into saturation, increasing harmonic content. After shaping, I apply a post-gain (*~ 0.4) to normalize the level so the effect doesn't simply sound louder. 

The signal chain includes a high-pass filter *([svf~ 80. 0.5])* before the waveshaper to remove low-frequency content that would otherwise produce muddy intermodulation distortion. After waveshaping, a resonant low-pass filter ([lores~]) with cutoff frequency mapped to depth (500Hz–3000Hz) adds dynamic tonal character—higher distortion settings open up the filter for a brighter, more aggressive tone.

The right hand first gesture triggers *distortion_active*, which fades the entire effect in or out via a smoothed gain envelope. This separation of depth and active controls allows the performer to "set" a distortion intensity with the left hand, then punch it in and out with the right hand gesture.

### 5.4.3 Chorus Effect
The chorus patch is built using a short modulated delay line. Inside Max I use a *[tapin~ 100] / [tapout~ 17 23]* pair for the delay memory. Two delay taps at prime-number intervals (17ms and 23ms) are chosen to avoid reinforcement patterns that would color the sound.

A low-frequency random signal *([rand~ 8] and [rand~ 6])* modulates the delay times. When this modulated delay signal is mixed back with the dry signal, small changes in delay time produce sligh pitch deviations due to the Doppler effect. At subtle depths (0.5 - 1ms modulation swing), this is percieved as a classic chorus. At higher depths (up to 4ms per swing), it moves towards a flanger effect. 

A feedback path *(*~ 0.3)* recirculates 30% of the output back to the input, adding density without risking instability. The right-hand open palm gesture sets *chorus_active*, and the left-hand pinch controls *chorus_depth*. All control changes are smoothed with *[line~]* to avoid zipper noise when the LFO parameters are being driven by noisy hand tracking data.

### 5.4.4 Resonant Low-Pass Filter
The filter effect uses a resonant low-pass filter where the cutoff frequency is mapped directly from the pinch depth. This creates a classic synthesizer-style "wah" effect that responds to continuous hand gestures.

The primary control parameter is cutoff frequency, mapped from the continuous pinch distance (0–1) to a frequency range of 200Hz to 8000Hz. This range was chosen to span from a dark, muffled tone to bright and open, covering the musically useful spectrum for filtering guitar and voice signals.

The resonance (Q factor) is set at 0.8—high enough to add emphasis at the cutoff frequency without self-oscillation. This creates an expressive sweep that highlights the frequency being controlled by the hand position.

### 5.4.5 Granular Pitch Shifting
The granular pitch effect uses a time-domain approach rather than FFT-based processing. The patch writes the incoming audio into a circular buffer using [record~] and then reads it back using [groove~] at variable playback speeds.

When the playback rate is greater than 1, the audio is read faster and the perceived pitch rises; when it's less than 1, the pitch drops. The granular_depth parameter, controlled by the left-hand gesture, is mapped to this playback rate over a range from 0.5× to 2× (one octave down to one octave up).

Because this is a time-domain approach, the effect has a slightly grainy, time-stretch texture, but it responds with low latency and works well with continuous gestural control. The right-hand one-finger gesture toggles granular_active, which crossfades the wet output in and out. This makes it possible to treat pitch shifting as a momentary gesture—for instance, a quick glissando or dive-bomb—rather than a permanent processing state.

### 5.4.6 Parameter Smoothing Strategy 
Parameter smoothing using *[line~]* is particularly important in gesture-based systems. Without smoothing, small tracking errors or rapid hand motion would produce zipper noise (audible stepping artifacts) and unstable effect behavior. All effect parameters are smoothed with ramp times chosen based on the parameter's perceptual sensitivity:

|Parameter Type|Ramp Time|Rationale|
|--------------|---------|---------|
|Gain/Amplitude| 20ms    ||
|Filter Cutoff | 20ms    | |
|Pitch/Rate    | 50ms    | |
|Reverb Wet    | 50-100ms| |
|Active on/off | 20-100ms| |

## 6. Challenges & Solutions
### 6.1 Thumb Detection Reliability
> **Problem:** The thumbs-up gesture proved unreliable because MediaPipe's z-coordinate estimation (depth from monocular camera) is less accurate than x/y positioning. The thumb's position relative to the camera
>

**Solution:** Changed the detection logic to rely on y-coordinate comparison (thumb tip above wrist in screen space) rather than z-depth. This sacrificed some angle tolerance but significantly improved reliability for front-facing camera positions.

### 6.2
> **Problem:** Transitional hand positions between gestures (e.g., moving from fist to palm) triggered unintended effect changes when the hand passed through configurations that momentarily matched other gestures.
>
**Solution:** Implemented a hold-time requirement (400ms) and gesture confirmation state machine. A gesture is only considered valid if it is maintained consistently for the full duration. Combined with a 700ms cooldown between triggers, this eliminated nearly all false positives during typical use.

### 6.3 Max/MSP Stability and OSC Overload
> **Problem:** Max/MSP crashes frequently during extended use. Gesture data updates at video frame rate (~30 FPS), which can overwhelm Max when parameters are changed too frequently. Each frame potentially sends multiple OSC messages for position, depth, and gesture state—resulting in a continuous stream of parameter updates that Max struggles to process smoothly.
>
**Solution:** Several mitigation strategies were implemented:
1. Parameter smoothing: All incoming OSC values are processed through [line~] objects with appropriate ramp times, reducing the effective rate of parameter changes reaching the DSP chain.
2. Conservative gain staging: Effect output levels are carefully managed to prevent clipping and feedback loops that could compound instability.
3. Message throttling: The browser only sends depth updates every few frames rather than every frame

However, this challenge highlighted a fundamental limitation of real-time OSC-driven control at video frame rates. The architecture works for demonstration and experimentation, but a production system would likely require tighter integration—perhaps using Max's native [jit.grab] and JavaScript within Max for hand tracking, eliminating the browser-to-Max communication overhead entirely.

### 6.4 What Was Rewarding
Despite the technical challenges-particularly the Max stability issues that remained only partially resolved-this project provided valuable learning experiences:
> Key Takeaways:
> + **Real-time hand tracking:** Gaining hands-on experience with MediaPipe's landmark detection system and understanding its capabilities and limitations in practice.
> + **Multi-environment system architecture:** Learning how to bridge multiple software environments (browser JavaScript, Node.js, Max/MSP) and programming languages together into a cohesive system.
> + **Communication protocols:** Working through the challenges of OSC, WebSocket-to-UDP bridging, and understanding why certain architectural decisions matter for latency and reliability.
> + **Interactive audio systems:** Deepening understanding of how interactive audio systems are structured in practice—the separation of control rate vs. audio rate, the importance of parameter smoothing, and the tradeoffs between responsiveness and stability.
>
Working through these challenges provided insight into why commercial gesture-control systems (like Leap Motion integrations) often use tightly coupled, single-environment implementations rather than distributed architectures. The project served as an effective learning exercise in the complexities of real-time, multi-modal system design.

## 7. Future Work & Possible Improvements 
### 7.1 Live Audio Input Support
The current system processes pre-recorded audio files. A valuable extension would be supporting live microphone input directly in Max/MSP via *[adc~]*, allowing real-time gesture control during live performance or recording. This would require rearchitecting the audio routing so that gesture data alone (not audio) flows through OSC, while Max/MSP handles audio I/O natively for lower latency. 


### 7.2 Daw Integration
The current system operates as a standalone application. A natural extension would be integration with DAWs such as Ableton Live via Max for Live, or as a VST/AU plugin. This would allow gesture control to be applied to any track within a production environment and enable recording automation data for later editing.

### 7.3 Custom Gesture Training
The rule-based gesture detection, while functional, limits users to predefined gestures. Implementing a user-trainable classifier (using the HAGRID dataset methodology outlined in the repository) would allow performers to define their own gesture vocabulary. This would involve capturing example frames, extracting landmark features, and training a k-NN or neural network classifier.

### 7.4 Multi-Parameter Control
Currently, the left hand controls a single "depth" parameter applied uniformly to all active effects. Future versions could map different finger distances to independent parameters—for example, thumb-to-index for reverb wet/dry, thumb-to-middle for distortion drive, and thumb-to-ring for delay feedback.


## 8. Conclusion 
This projects success demonstrates the feasibility of hand gesture control for real-time audio effects using only commodity hardware. By combining MediaPipe's robust hand tracking with Max/MSP's flexible audio processing capabilities, the system achieves its primary goal: enabling hands-free manipulation of audio effects during musical performance. 

The toggle-based interaction model, inspired by traditional stomp-box pedals, proves intuitive for musicians accustomed to physical effect switching. The addition of continuous parameter control via pinch distance provides expressive depth beyond simple on/off functionality.

While challenges around gesture ambiguity and latency required careful engineering solutions, the resulting system performs reliably under typical conditions. The modular architecture—separating vision, communication, and audio processing into distinct components—facilitates future extension and integration with other tools.

This work contributes a practical, accessible implementation of gesture-based audio control that can be replicated by other musicians and researchers using the open-source code provided. It represents a step toward more natural, embodied interfaces for music technology that preserve the physical expressiveness of traditional instrumental performance.


## 9. References & Citations
### Libraries and Frameworks
MediaPipe Hands
Lugaresi, C., Tang, J., Nash, H., McClanahan, C., Uboweja, E., Hays, M., Zhang, F., Chang, C., Yong, M. G., Lee, J., Chang, W., Hua, W., Georg, M., & Grundmann, M. (2019). MediaPipe: A Framework for Building Perception Pipelines. arXiv preprint arXiv:1906.08172.
https://google.github.io/mediapipe/solutions/hands.html

OSC.js
Open Sound Control implementation for JavaScript/Node.js.
https://github.com/adzialocha/osc-js

Max/MSP
Cycling '74. Max 9 [Computer software].
https://cycling74.com/products/max

### Inspirational Projects 
jweb-mediapipe
Rich, R. MediaPipe integration for Max/MSP via jweb.
https://github.com/robtherich/jweb-mediapipe

Handmate-OSC / Handmate-MIDI
Browser-based hand tracking with OSC/MIDI output.
https://github.com/lysdexic-audio/jweb-hands-gesture-recognizer

Gesture Volume Control
Bhatnagar, P. MediaPipe-based volume control implementation.
https://github.com/pratham-bhatnagar/Gesture-Volume-Control

### Reference Materials

Stanford CS231N Hand Tracking Report
https://cs231n.stanford.edu/2025/papers/

“AI-Powered Hand Gesture Audio Control with MediaPipe on Raspberry Pi.” DigiKey, 2024, www.digikey.ca/en/maker/tutorials/2024/ai-powered-hand-gesture-audio-control-with-mediapipe-on-raspberry-pi. Accessed 27 Nov. 2025.

DigiKey Tutorial: AI-Powered Hand Gesture Audio Control
https://www.digikey.ca/en/maker/tutorials/2024/ai-powered-hand-gesture-audio-control-with-mediapipe-on-raspberry-pi

Open Sound Control Specification
Wright, M. (2005). Open Sound Control: an enabling technology for musical networking. Organised Sound, 10(3), 193-200.

Hearing Glass | Umut Eldem. “Distortion Basics | Max/MSP Tutorial.” YouTube, 20 July 2024, www.youtube.com/watch?v=-D1Llg6L55A.

Samuel Pearce-Davies. “Distortion Resonance Generator – Max/MSP.” YouTube, 7 Mar. 2018, www.youtube.com/watch?v=1MxY0ZfHCDE. Accessed 27 Nov. 2025.

Tarcar, Gayatridevi, et al. CustomFX: A Lightweight Hand Tracking Model for Musical Instruments.
tune4media. “Max | Designing Your Own Reverb (with Gen~) [Full Lesson].” YouTube, 18 Aug. 2019, www.youtube.com/watch?v=F_FhvxT5mLA.







