# mumt-307-gesture-audio

This project implements a real-time system that enables msuicians to control audio effects through hand gestures captured by a standard webcame. By integrating MediaPipe's hand landmark detection with custon gesture classification and Max/MSP digital signal processing, the system creates an intuitive, touchless interface for audio manipulation. The right hand controls discrete effect activation through recognized gestures (fist, palm, peace sign, thumbs-up, single finger), while the left hand provides continuous parameter modulation through pinch distance measuremnet. Five audio-effects - distortion, reverb, echo, chorus and pitch-shifting - can be toggled independently and layered simultaneously, with gesture controlled depth parameters affecting the intensity of each active effect. The system communications via Open Sound Control (OSC) protocol,bridging the browser-based computer vision with Max/MSP's audio engine through a Node.js WebSocket-to-UDP bridge. 

## Motivation & Objectives 
The primary motivation for this project emerged from a practical challenge encountered during guitar recording sessions. When tracking guitar parts, the need to adjust effect parameters - adding reverb during a sustained chord, or engaging a delay - typically requires interrupting the performacne to manipulate physical controls. 
I envisioned a system where these adjustmnets could be made through natural hand-gestures, allowing continuous playing while dramatically shaping the sound. The main objectives I had for this project were: 
>1. Hands-free effect control: Enable toggling of audio effects without touching equipment.
2. Continuous parameter modulation: Providing smooth, real-time control over effect depth/intensity. 
3. Low latency: Achiee response times suitable for live musical performace. 
4. Accessibility: Require only a laptop, rather than specialized sensors.

The system uses a toggle-based interaction model, where gestures act as an on/off switch, rather than requiring sustaining poses. This allows the performer to make a gesture, return their hand to the instrumnet and have the effect remain active until explicitly toggled off - this mirrors the behaviour of traditional stomp-box effect pedals. 




## Methodology 
### Hand Tracking and Gesture Recognition 
MediaPipe Hands employs a two-stage detection pipeline optimized for real-time performance. The first stage uses a lightweight palm detector to locate hands within the frame, reducing hte search space for the subsequent landmark model. The second  stage predicts 21 three-dmensional landmarks per detected hand, representing key anatomical points from the wrist through each fingertip. 

<img width="878" height="424" alt="image" src="https://github.com/user-attachments/assets/6d794dcc-b1d1-4cb5-991d-5d0749d3f265" />
*Figure 1: MediaPipe hand landmark indices. The model outputs 21 keypoints with x,y,z coordinates.*


The JavaScript implementation initializes MediaPipe Hands with the following configuration: 

<img width="674" height="285" alt="Screenshot 2025-12-10 at 11 59 14 AM" src="https://github.com/user-attachments/assets/eaaefd9b-01b0-4eef-8cf4-af1767efbcf7" />


### OSC Communication Protocol 
### Audio Effects Implementation 
All audio effects are implemented in Max/MSP using a consistent architecure. 



## High-Level Features 

## System Architecture & Design

## Methodology & Implementation 

# Future Work & Possible Improvements 


# References

