# Real-Time Gesture-Controlled Audio Effects

This project implements a real-time system that enables msuicians to control audio effects through hand gestures captured by a standard webcame. By integrating MediaPipe's hand landmark detection with custon gesture classification and Max/MSP digital signal processing, the system creates an intuitive, touchless interface for audio manipulation. The right hand controls discrete effect activation through recognized gestures (fist, palm, peace sign, thumbs-up, single finger), while the left hand provides continuous parameter modulation through pinch distance measuremnet. Five audio-effects - distortion, reverb, echo, chorus and pitch-shifting - can be toggled independently and layered simultaneously, with gesture controlled depth parameters affecting the intensity of each active effect. The system communications via Open Sound Control (OSC) protocol,bridging the browser-based computer vision with Max/MSP's audio engine through a Node.js WebSocket-to-UDP bridge. 

## Motivation & Objectives 
The primary motivation for this project emerged from a practical challenge encountered during guitar recording sessions. When tracking guitar parts, the need to adjust effect parameters - adding reverb during a sustained chord, or engaging a delay - typically requires interrupting the performacne to manipulate physical controls. 
I envisioned a system where these adjustmnets could be made through natural hand-gestures, allowing continuous playing while dramatically shaping the sound. The main objectives I had for this project were: 
>**1. Hands-free effect control:** Enable toggling of audio effects without touching equipment.
>
>**2. Continuous parameter modulation:** Providing smooth, real-time control over effect depth/intensity.
>
>**3. Low latency:** Achiee response times suitable for live musical performace.
>
>**4. Accessibility:** Require only a laptop, rather than specialized sensors.
>

The system uses a toggle-based interaction model, where gestures act as an on/off switch, rather than requiring sustaining poses. This allows the performer to make a gesture, return their hand to the instrumnet and have the effect remain active until explicitly toggled off - this mirrors the behaviour of traditional stomp-box effect pedals. 




## Methodology 
### Hand Tracking and Gesture Recognition 
MediaPipe Hands employs a two-stage detection pipeline optimized for real-time performance. The first stage uses a lightweight palm detector to locate hands within the frame, reducing hte search space for the subsequent landmark model. The second  stage predicts 21 three-dmensional landmarks per detected hand, representing key anatomical points from the wrist through each fingertip. 

<img width="878" height="424" alt="image" src="https://github.com/user-attachments/assets/6d794dcc-b1d1-4cb5-991d-5d0749d3f265" />
*Figure 1: MediaPipe hand landmark indices. The model outputs 21 keypoints with x,y,z coordinates.*


The JavaScript implementation initializes MediaPipe Hands with the following configuration: 

<img width="674" height="285" alt="Screenshot 2025-12-10 at 11 59 14 AM" src="https://github.com/user-attachments/assets/eaaefd9b-01b0-4eef-8cf4-af1767efbcf7" />

### Gesture recognition 
Gesture recognition is implemented through geometric analysis of landmark positions. Rather than training a separate machine learning classifier (which would require collecting and labeling training data), I developed rule-based detection functions that analyze finger extension patterns, relative distances, and spatial relationships.

The fundamental building block is determining whether each finger is extended or curled. This is achieved by comparing the distance from the fingertip to the wrist against the distance from the finger's metacarpophalangeal (MCP) joint to the wrist:

<img width="479" height="258" alt="Screenshot 2025-12-10 at 12 05 35 PM" src="https://github.com/user-attachments/assets/881767e6-0250-4e61-9f40-0c95edcef339" />

Five distinct gestures are recognized, each mapped to an audio effect:

Fist - Distortion 
Palm - Chrous
Peace - Reverb
Thumbs Up - Pitch Shift
One Finger - Echo/Delay 

  Example implementation of the peace sign detection:

  <img width="473" height="183" alt="Screenshot 2025-12-10 at 12 07 10 PM"   src="https://github.com/user-attachments/assets/ed37df42-d022-4489-85e7-e36cfa35ddd3" />

To prevent accidental triggers from transient hand positions, gestures must be held for a minimum duration before activation. Additionally, a cooldown period prevents rapid repeated toggles:

<img width="739" height="604" alt="Screenshot 2025-12-10 at 12 09 00 PM" src="https://github.com/user-attachments/assets/dfb0590b-8eca-4856-9719-cc4755f56518" />

The left hand provides continuous control through pinch distance measurement—the Euclidean distance between thumb tip (landmark 4) and index tip (landmark 8):

<img width="455" height="209" alt="Screenshot 2025-12-10 at 12 09 52 PM" src="https://github.com/user-attachments/assets/38e3327e-f2cd-4a3a-82fe-fbb708b81a15" />

A moving average filter smooths the raw pinch values to prevent jittery parameter changes:

<img width="661" height="414" alt="Screenshot 2025-12-10 at 12 11 11 PM" src="https://github.com/user-attachments/assets/60b00f39-f427-4986-87b5-8db2c01b93a8" />


### OSC Communication Protocol 
Browser security restrictions prevent direct UDP socket access, necessitating a WebSocket-to-UDP bridge architecture. The browser client connects to a Node.js server via WebSocket, which then forwards OSC messages as UDP packets to Max/MSP.

The Node.js bridge server uses the osc-js library with its BridgePlugin to handle protocol translation:


### Audio Effects Implementation 
All audio effects are implemented in Max/MSP using a consistent architecure. 



## High-Level Features 

## System Architecture & Design

## Methodology & Implementation 

# Future Work & Possible Improvements 
1. Daw Integration
2. Custom Gesture Training
3. Multi-Parameter Control
4. Gesture Confidence Visualization

   

## References & Citations
## Libraries and Frameworks
MediaPipe Hands
Lugaresi, C., Tang, J., Nash, H., McClanahan, C., Uboweja, E., Hays, M., Zhang, F., Chang, C., Yong, M. G., Lee, J., Chang, W., Hua, W., Georg, M., & Grundmann, M. (2019). MediaPipe: A Framework for Building Perception Pipelines. arXiv preprint arXiv:1906.08172.
https://google.github.io/mediapipe/solutions/hands.html

OSC.js
Open Sound Control implementation for JavaScript/Node.js.
https://github.com/adzialocha/osc-js

Max/MSP
Cycling '74. Max 9 [Computer software].
https://cycling74.com/products/max

## Inspirational Projects 
jweb-mediapipe
Rich, R. MediaPipe integration for Max/MSP via jweb.
https://github.com/robtherich/jweb-mediapipe

Handmate-OSC / Handmate-MIDI
Browser-based hand tracking with OSC/MIDI output.
https://github.com/lysdexic-audio/jweb-hands-gesture-recognizer

Gesture Volume Control
Bhatnagar, P. MediaPipe-based volume control implementation.
https://github.com/pratham-bhatnagar/Gesture-Volume-Control

## Reference Materials

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







