# Hand Audio FX

Control audio effects with hand gestures using MediaPipe hand tracking.

**Flow:** Browser (audio + hands) → OSC → Max/MSP (effects) → Audio out

## Requirements

- Node.js (v16+)
- Max/MSP 8 with **CNMAT odot externals** installed
  - Download from: https://cnmat.berkeley.edu/downloads
  - Required objects: `o.route`
- Chrome or Firefox (not Safari)
- Webcam

## Quick Start

### 1. Install & Start Bridge
```bash
cd hand-audio-fx
npm install
node bridge.js
```

You should see:
```
==========================================
Hand Audio FX - OSC Bridge
==========================================
WebSocket (browser):  ws://localhost:8080
UDP to Max:           localhost:9129
UDP from Max:         localhost:9130
==========================================
```

### 2. Open Max Patch
- Open `max-patches/HandAudioFX.maxpat`
- Click the **ezdac~** speaker to enable audio
- You should see "OSC" printed in Max console when messages arrive

### 3. Open Browser
- Use VS Code Live Server or `python -m http.server 5500`
- Go to `http://127.0.0.1:5500/index.html`
- Allow camera access
- Wait for OSC status to show **"Connected"** (green)

### 4. Load & Play Audio
- Click **"Choose File"** and select an audio file
- Click **Play**
- Audio plays in browser AND streams to Max for effects

### 5. Use Hand Gestures
**Right hand** - toggle effects:
| Gesture | Effect |
|---------|--------|
|  Peace (V sign) | Reverb |
|  Fist | Distortion |
|  One finger | Echo |
|  Open palm | Chorus |
|  Thumbs up | Pitch |

**Left hand** - control depth:
- Pinch thumb + index together = 0%
- Spread apart = 100%

Hold gesture for ~0.4 seconds to activate.

## OSC Messages

**Browser → Max (port 9129):**
- `/fx/reverb/active 1` or `0`
- `/fx/reverb/depth 0.0` to `1.0`
- `/fx/distortion/active`, `/depth`
- `/fx/echo/active`, `/depth`
- `/fx/chorus/active`, `/depth`
- `/fx/pitch/active`, `/depth`
- `/fx/kill 1`
- `/audio/left [samples...]`
- `/audio/right [samples...]`

## Troubleshooting

**"o.route" object not found in Max:**
- Install CNMAT odot externals from https://cnmat.berkeley.edu/downloads

**OSC not connecting:**
- Make sure `node bridge.js` is running FIRST
- Check that port 8080 is not in use

**No audio:**
- Click ezdac~ in Max
- Make sure you loaded an audio file in browser
- Check Max audio settings (Options → Audio Status)

**Gestures not detecting:**
- Good lighting helps
- Keep hand clearly in frame
- For fist: tuck thumb against palm

