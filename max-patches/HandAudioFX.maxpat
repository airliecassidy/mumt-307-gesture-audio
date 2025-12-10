{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 1,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 483.0, 138.0, 900.0, 700.0 ],
        "openinpresentation": 1,
        "description": "Hand Audio FX - CNMAT OSC",
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 15.0, 300.0, 42.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 15.0, 300.0, 42.0 ],
                    "text": "Hand Audio FX Controller\n"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-portinfo",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 60.0, 250.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 60.0, 250.0, 18.0 ],
                    "text": "OSC In: UDP 9129 | OSC Out: UDP 9130"
                }
            },
            {
                "box": {
                    "id": "obj-ezdac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 750.0, 15.0, 45.0, 45.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 350.0, 15.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-udpreceive",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 30.0, 100.0, 107.0, 22.0 ],
                    "text": "udpreceive 9129"
                }
            },
            {
                "box": {
                    "id": "obj-print",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 150.0, 100.0, 61.0, 22.0 ],
                    "text": "print OSC"
                }
            },
            {
                "box": {
                    "id": "obj-oroute-main",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "FullPacket" ],
                    "patching_rect": [ 30.0, 140.0, 200.0, 22.0 ],
                    "text": "o.route /fx /audio /transport"
                }
            },
            {
                "box": {
                    "id": "obj-oroute-fx",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 7,
                    "outlettype": [ "", "", "", "", "", "", "FullPacket" ],
                    "patching_rect": [ 30.0, 180.0, 400.0, 22.0 ],
                    "text": "o.route /reverb /distortion /echo /chorus /pitch /kill"
                }
            },
            {
                "box": {
                    "id": "obj-oroute-reverb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "FullPacket" ],
                    "patching_rect": [ 30.0, 220.0, 130.0, 22.0 ],
                    "text": "o.route /active /depth"
                }
            },
            {
                "box": {
                    "id": "obj-reverb-tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 260.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 100.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-reverb-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 263.0, 50.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 45.0, 102.0, 50.0, 20.0 ],
                    "text": "Reverb"
                }
            },
            {
                "box": {
                    "id": "obj-reverb-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 120.0, 220.0, 97.0, 22.0 ],
                    "text": "scale 0. 1. 0 100"
                }
            },
            {
                "box": {
                    "id": "obj-reverb-slider",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 120.0, 260.0, 100.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 100.0, 102.0, 100.0, 20.0 ],
                    "size": 101.0
                }
            },
            {
                "box": {
                    "id": "obj-reverb-num",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 225.0, 260.0, 45.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 205.0, 100.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-oroute-dist",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "FullPacket" ],
                    "patching_rect": [ 30.0, 300.0, 130.0, 22.0 ],
                    "text": "o.route /active /depth"
                }
            },
            {
                "box": {
                    "id": "obj-dist-tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 340.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 130.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-dist-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 343.0, 59.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 45.0, 132.0, 59.0, 20.0 ],
                    "text": "Distortion"
                }
            },
            {
                "box": {
                    "id": "obj-dist-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 120.0, 300.0, 97.0, 22.0 ],
                    "text": "scale 0. 1. 0 100"
                }
            },
            {
                "box": {
                    "id": "obj-dist-slider",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 120.0, 340.0, 100.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 100.0, 132.0, 100.0, 20.0 ],
                    "size": 101.0
                }
            },
            {
                "box": {
                    "id": "obj-dist-num",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 225.0, 340.0, 45.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 205.0, 130.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-oroute-echo",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "FullPacket" ],
                    "patching_rect": [ 30.0, 380.0, 130.0, 22.0 ],
                    "text": "o.route /active /depth"
                }
            },
            {
                "box": {
                    "id": "obj-echo-tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 420.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 160.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-echo-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 423.0, 40.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 45.0, 162.0, 40.0, 20.0 ],
                    "text": "Echo"
                }
            },
            {
                "box": {
                    "id": "obj-echo-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 120.0, 380.0, 97.0, 22.0 ],
                    "text": "scale 0. 1. 0 100"
                }
            },
            {
                "box": {
                    "id": "obj-echo-slider",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 120.0, 420.0, 100.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 100.0, 162.0, 100.0, 20.0 ],
                    "size": 101.0
                }
            },
            {
                "box": {
                    "id": "obj-echo-num",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 225.0, 420.0, 45.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 205.0, 160.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-oroute-chorus",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "FullPacket" ],
                    "patching_rect": [ 30.0, 460.0, 130.0, 22.0 ],
                    "text": "o.route /active /depth"
                }
            },
            {
                "box": {
                    "id": "obj-chorus-tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 500.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 190.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-chorus-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 503.0, 47.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 45.0, 192.0, 47.0, 20.0 ],
                    "text": "Chorus"
                }
            },
            {
                "box": {
                    "id": "obj-chorus-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 120.0, 460.0, 97.0, 22.0 ],
                    "text": "scale 0. 1. 0 100"
                }
            },
            {
                "box": {
                    "id": "obj-chorus-slider",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 120.0, 500.0, 100.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 100.0, 192.0, 100.0, 20.0 ],
                    "size": 101.0
                }
            },
            {
                "box": {
                    "id": "obj-chorus-num",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 225.0, 500.0, 45.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 205.0, 190.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-oroute-pitch",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "FullPacket" ],
                    "patching_rect": [ 30.0, 540.0, 130.0, 22.0 ],
                    "text": "o.route /active /depth"
                }
            },
            {
                "box": {
                    "id": "obj-pitch-tog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 580.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 220.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-pitch-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 583.0, 35.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 45.0, 222.0, 35.0, 20.0 ],
                    "text": "Pitch"
                }
            },
            {
                "box": {
                    "id": "obj-pitch-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 120.0, 540.0, 97.0, 22.0 ],
                    "text": "scale 0. 1. 0 100"
                }
            },
            {
                "box": {
                    "id": "obj-pitch-slider",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 120.0, 580.0, 100.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 100.0, 222.0, 100.0, 20.0 ],
                    "size": 101.0
                }
            },
            {
                "box": {
                    "id": "obj-pitch-num",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 225.0, 580.0, 45.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 205.0, 220.0, 45.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-kill-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 360.0, 180.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 270.0, 100.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-kill-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 390.0, 183.0, 50.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 300.0, 102.0, 50.0, 20.0 ],
                    "text": "Kill All"
                }
            },
            {
                "box": {
                    "id": "obj-kill-zero",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 360.0, 210.0, 30.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "obj-oroute-audio",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "FullPacket" ],
                    "patching_rect": [ 500.0, 140.0, 120.0, 22.0 ],
                    "text": "o.route /left /right"
                }
            },
            {
                "box": {
                    "id": "obj-audio-left-iter",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 180.0, 45.0, 22.0 ],
                    "text": "iter"
                }
            },
            {
                "box": {
                    "id": "obj-audio-right-iter",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 580.0, 180.0, 45.0, 22.0 ],
                    "text": "iter"
                }
            },
            {
                "box": {
                    "id": "obj-audio-left-sig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 500.0, 220.0, 40.0, 22.0 ],
                    "text": "sig~"
                }
            },
            {
                "box": {
                    "id": "obj-audio-right-sig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 580.0, 220.0, 40.0, 22.0 ],
                    "text": "sig~"
                }
            },
            {
                "box": {
                    "id": "obj-verb-wet-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 260.0, 100.0, 22.0 ],
                    "text": "scale 0 100 0. 1."
                }
            },
            {
                "box": {
                    "id": "obj-verb-wet-line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 500.0, 290.0, 64.0, 22.0 ],
                    "text": "line~ 0. 50"
                }
            },
            {
                "box": {
                    "id": "obj-freeverb-l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 680.0, 260.0, 106.0, 22.0 ],
                    "text": "freeverb~ 0.85 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-freeverb-r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 790.0, 260.0, 106.0, 22.0 ],
                    "text": "freeverb~ 0.85 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-verb-mult-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 680.0, 320.0, 35.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-verb-mult-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 790.0, 320.0, 35.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-mix-verb-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 500.0, 360.0, 35.0, 22.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-mix-verb-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 580.0, 360.0, 35.0, 22.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-dist-amt-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 400.0, 110.0, 22.0 ],
                    "text": "scale 0 100 1. 50."
                }
            },
            {
                "box": {
                    "id": "obj-dist-amt-line",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 500.0, 430.0, 60.0, 22.0 ],
                    "text": "line 1. 50"
                }
            },
            {
                "box": {
                    "id": "obj-overdrive-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 500.0, 470.0, 80.0, 22.0 ],
                    "text": "overdrive~ 1"
                }
            },
            {
                "box": {
                    "id": "obj-overdrive-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 620.0, 470.0, 80.0, 22.0 ],
                    "text": "overdrive~ 1"
                }
            },
            {
                "box": {
                    "id": "obj-echo-fb-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 500.0, 510.0, 110.0, 22.0 ],
                    "text": "scale 0 100 0. 0.7"
                }
            },
            {
                "box": {
                    "id": "obj-echo-fb-line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 500.0, 540.0, 64.0, 22.0 ],
                    "text": "line~ 0. 50"
                }
            },
            {
                "box": {
                    "id": "obj-delay-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 680.0, 510.0, 117.0, 22.0 ],
                    "text": "delay~ 22050 11025"
                }
            },
            {
                "box": {
                    "id": "obj-delay-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 780.0, 510.0, 118.0, 22.0 ],
                    "text": "delay~ 22050 16538"
                }
            },
            {
                "box": {
                    "id": "obj-delay-fb-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 680.0, 550.0, 35.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-delay-fb-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 780.0, 550.0, 35.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-mix-echo-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 500.0, 590.0, 35.0, 22.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-mix-echo-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 620.0, 590.0, 35.0, 22.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-gain-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 500.0, 630.0, 55.0, 22.0 ],
                    "text": "*~ 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-gain-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 620.0, 630.0, 55.0, 22.0 ],
                    "text": "*~ 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-dac-l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 500.0, 670.0, 45.0, 22.0 ],
                    "text": "dac~ 1"
                }
            },
            {
                "box": {
                    "id": "obj-dac-r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 620.0, 670.0, 45.0, 22.0 ],
                    "text": "dac~ 2"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-audio-left-sig", 0 ],
                    "source": [ "obj-audio-left-iter", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-freeverb-l", 0 ],
                    "order": 0,
                    "source": [ "obj-audio-left-sig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mix-verb-l", 0 ],
                    "order": 1,
                    "source": [ "obj-audio-left-sig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-audio-right-sig", 0 ],
                    "source": [ "obj-audio-right-iter", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-freeverb-r", 0 ],
                    "order": 0,
                    "source": [ "obj-audio-right-sig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mix-verb-r", 0 ],
                    "order": 1,
                    "source": [ "obj-audio-right-sig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-chorus-slider", 0 ],
                    "source": [ "obj-chorus-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-chorus-num", 0 ],
                    "source": [ "obj-chorus-slider", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mix-echo-l", 1 ],
                    "source": [ "obj-delay-fb-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mix-echo-r", 1 ],
                    "source": [ "obj-delay-fb-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-delay-fb-l", 0 ],
                    "source": [ "obj-delay-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-delay-fb-r", 0 ],
                    "source": [ "obj-delay-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-overdrive-l", 1 ],
                    "order": 1,
                    "source": [ "obj-dist-amt-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-overdrive-r", 1 ],
                    "order": 0,
                    "source": [ "obj-dist-amt-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dist-amt-line", 0 ],
                    "source": [ "obj-dist-amt-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dist-amt-scale", 0 ],
                    "order": 0,
                    "source": [ "obj-dist-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dist-slider", 0 ],
                    "order": 1,
                    "source": [ "obj-dist-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dist-num", 0 ],
                    "source": [ "obj-dist-slider", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-delay-fb-l", 1 ],
                    "order": 1,
                    "source": [ "obj-echo-fb-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-delay-fb-r", 1 ],
                    "order": 0,
                    "source": [ "obj-echo-fb-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-echo-fb-line", 0 ],
                    "source": [ "obj-echo-fb-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-echo-fb-scale", 0 ],
                    "order": 0,
                    "source": [ "obj-echo-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-echo-slider", 0 ],
                    "order": 1,
                    "source": [ "obj-echo-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-echo-num", 0 ],
                    "source": [ "obj-echo-slider", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-verb-mult-l", 0 ],
                    "source": [ "obj-freeverb-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-verb-mult-r", 0 ],
                    "source": [ "obj-freeverb-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dac-l", 0 ],
                    "source": [ "obj-gain-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dac-r", 0 ],
                    "source": [ "obj-gain-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-kill-zero", 0 ],
                    "source": [ "obj-kill-btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-chorus-tog", 0 ],
                    "order": 1,
                    "source": [ "obj-kill-zero", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dist-tog", 0 ],
                    "order": 3,
                    "source": [ "obj-kill-zero", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-echo-tog", 0 ],
                    "order": 2,
                    "source": [ "obj-kill-zero", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pitch-tog", 0 ],
                    "order": 0,
                    "source": [ "obj-kill-zero", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-reverb-tog", 0 ],
                    "order": 4,
                    "source": [ "obj-kill-zero", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-l", 0 ],
                    "source": [ "obj-mix-echo-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-r", 0 ],
                    "source": [ "obj-mix-echo-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-overdrive-l", 0 ],
                    "source": [ "obj-mix-verb-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-overdrive-r", 0 ],
                    "source": [ "obj-mix-verb-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-audio-left-iter", 0 ],
                    "source": [ "obj-oroute-audio", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-audio-right-iter", 0 ],
                    "source": [ "obj-oroute-audio", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-chorus-scale", 0 ],
                    "source": [ "obj-oroute-chorus", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-chorus-tog", 0 ],
                    "source": [ "obj-oroute-chorus", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dist-scale", 0 ],
                    "source": [ "obj-oroute-dist", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dist-tog", 0 ],
                    "source": [ "obj-oroute-dist", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-echo-scale", 0 ],
                    "source": [ "obj-oroute-echo", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-echo-tog", 0 ],
                    "source": [ "obj-oroute-echo", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-kill-btn", 0 ],
                    "source": [ "obj-oroute-fx", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-oroute-chorus", 0 ],
                    "source": [ "obj-oroute-fx", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-oroute-dist", 0 ],
                    "source": [ "obj-oroute-fx", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-oroute-echo", 0 ],
                    "source": [ "obj-oroute-fx", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-oroute-pitch", 0 ],
                    "source": [ "obj-oroute-fx", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-oroute-reverb", 0 ],
                    "source": [ "obj-oroute-fx", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-oroute-audio", 0 ],
                    "source": [ "obj-oroute-main", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-oroute-fx", 0 ],
                    "source": [ "obj-oroute-main", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pitch-scale", 0 ],
                    "source": [ "obj-oroute-pitch", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pitch-tog", 0 ],
                    "source": [ "obj-oroute-pitch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-reverb-scale", 0 ],
                    "source": [ "obj-oroute-reverb", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-reverb-tog", 0 ],
                    "source": [ "obj-oroute-reverb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-delay-l", 0 ],
                    "order": 0,
                    "source": [ "obj-overdrive-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mix-echo-l", 0 ],
                    "order": 1,
                    "source": [ "obj-overdrive-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-delay-r", 0 ],
                    "order": 0,
                    "source": [ "obj-overdrive-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mix-echo-r", 0 ],
                    "order": 1,
                    "source": [ "obj-overdrive-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pitch-slider", 0 ],
                    "source": [ "obj-pitch-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pitch-num", 0 ],
                    "source": [ "obj-pitch-slider", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-reverb-slider", 0 ],
                    "order": 1,
                    "source": [ "obj-reverb-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-verb-wet-scale", 0 ],
                    "order": 0,
                    "source": [ "obj-reverb-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-reverb-num", 0 ],
                    "source": [ "obj-reverb-slider", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-oroute-main", 0 ],
                    "order": 1,
                    "source": [ "obj-udpreceive", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print", 0 ],
                    "order": 0,
                    "source": [ "obj-udpreceive", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mix-verb-l", 1 ],
                    "source": [ "obj-verb-mult-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mix-verb-r", 1 ],
                    "source": [ "obj-verb-mult-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-verb-mult-l", 1 ],
                    "order": 1,
                    "source": [ "obj-verb-wet-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-verb-mult-r", 1 ],
                    "order": 0,
                    "source": [ "obj-verb-wet-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-verb-wet-line", 0 ],
                    "source": [ "obj-verb-wet-scale", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}