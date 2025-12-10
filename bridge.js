const OSC = require("osc-js");

// Configuration:
// Browser connects via WebSocket on port 8080
// Send to Max on UDP port 9129
// Receive from Max on UDP port 9130 (send back to browser)

const config = {
  udpClient: {
    host: "127.0.0.1",
    port: 9129
  },
  udpServer: {
    host: "127.0.0.1",
    port: 9130
  }
};

try {
  const osc = new OSC({ plugin: new OSC.BridgePlugin(config) });

  osc.open();

  console.log("");
  console.log("==========================================");
  console.log("Hand Audio FX - OSC Bridge");
  console.log("==========================================");
  console.log("WebSocket (browser):  ws://localhost:8080");
  console.log("UDP to Max:           localhost:9129");
  console.log("UDP from Max:         localhost:9130");
  console.log("");
  console.log("Ready. Open index.html in browser.");
  console.log("==========================================");
  console.log("");

} catch (err) {
  console.log("OSC bridge error:", err);
}
