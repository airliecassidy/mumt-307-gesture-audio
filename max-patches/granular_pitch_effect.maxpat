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
        "rect": [ 100.0, 100.0, 950.0, 750.0 ],
        "title": "Granular Pitch Shift Effect",
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14.0,
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 10.0, 450.0, 22.0 ],
                    "text": "GRANULAR PITCH SHIFT "
                }
            },
            {
                "box": {
                    "id": "obj-in-l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 70.0, 120.0, 22.0 ],
                    "text": "receive~ audio_in_l"
                }
            },
            {
                "box": {
                    "id": "obj-in-r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 400.0, 70.0, 120.0, 22.0 ],
                    "text": "receive~ audio_in_r"
                }
            },
            {
                "box": {
                    "id": "obj-depth-recv",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 650.0, 70.0, 131.0, 22.0 ],
                    "text": "receive granular_depth"
                }
            },
            {
                "box": {
                    "id": "obj-active-recv",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 650.0, 150.0, 133.0, 22.0 ],
                    "text": "receive granular_active"
                }
            },
            {
                "box": {
                    "id": "obj-rate-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 650.0, 100.0, 120.0, 22.0 ],
                    "text": "scale 0. 1. 0.5 2."
                }
            },
            {
                "box": {
                    "id": "obj-rate-line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 650.0, 130.0, 80.0, 22.0 ],
                    "text": "line~ 1. 50"
                }
            },
            {
                "box": {
                    "id": "obj-active-line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 650.0, 180.0, 80.0, 22.0 ],
                    "text": "line~ 0. 20"
                }
            },
            {
                "box": {
                    "id": "obj-buf-l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 40.0, 110.0, 130.0, 22.0 ],
                    "text": "buffer~ granbuf_l 2000"
                }
            },
            {
                "box": {
                    "id": "obj-buf-r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 400.0, 110.0, 131.0, 22.0 ],
                    "text": "buffer~ granbuf_r 2000"
                }
            },
            {
                "box": {
                    "id": "obj-rec-l",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 150.0, 110.0, 22.0 ],
                    "text": "record~ granbuf_l"
                }
            },
            {
                "box": {
                    "id": "obj-rec-r",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 400.0, 150.0, 110.0, 22.0 ],
                    "text": "record~ granbuf_r"
                }
            },
            {
                "box": {
                    "id": "obj-loadbang",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 200.0, 110.0, 60.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-rec-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 140.0, 30.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-groove-l",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 40.0, 240.0, 120.0, 22.0 ],
                    "text": "groove~ granbuf_l"
                }
            },
            {
                "box": {
                    "id": "obj-groove-r",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 400.0, 240.0, 120.0, 22.0 ],
                    "text": "groove~ granbuf_r"
                }
            },
            {
                "box": {
                    "id": "obj-loop-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 200.0, 45.0, 22.0 ],
                    "text": "loop 1"
                }
            },
            {
                "box": {
                    "id": "obj-start-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 260.0, 200.0, 30.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-gain-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 290.0, 55.0, 22.0 ],
                    "text": "*~ 0.7"
                }
            },
            {
                "box": {
                    "id": "obj-gain-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 400.0, 290.0, 55.0, 22.0 ],
                    "text": "*~ 0.7"
                }
            },
            {
                "box": {
                    "id": "obj-depth-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 340.0, 40.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-depth-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 400.0, 340.0, 40.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-active-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 390.0, 40.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-active-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 400.0, 390.0, 40.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-out-l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 440.0, 100.0, 22.0 ],
                    "text": "send~ fx_wet_l"
                }
            },
            {
                "box": {
                    "id": "obj-out-r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 440.0, 100.0, 22.0 ],
                    "text": "send~ fx_wet_r"
                }
            },
            {
                "box": {
                    "id": "obj-depth-wet-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 650.0, 220.0, 100.0, 22.0 ],
                    "text": "scale 0. 1. 0. 1."
                }
            },
            {
                "box": {
                    "id": "obj-depth-wet-line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 650.0, 250.0, 80.0, 22.0 ],
                    "text": "line~ 0.5 30"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-out-l", 0 ],
                    "source": [ "obj-active-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-active-l", 1 ],
                    "order": 1,
                    "source": [ "obj-active-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-active-r", 1 ],
                    "order": 0,
                    "source": [ "obj-active-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-out-r", 0 ],
                    "source": [ "obj-active-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-active-line", 0 ],
                    "source": [ "obj-active-recv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-active-l", 0 ],
                    "source": [ "obj-depth-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-active-r", 0 ],
                    "source": [ "obj-depth-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-depth-wet-scale", 0 ],
                    "order": 0,
                    "source": [ "obj-depth-recv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rate-scale", 0 ],
                    "order": 1,
                    "source": [ "obj-depth-recv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-depth-l", 1 ],
                    "order": 1,
                    "source": [ "obj-depth-wet-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-depth-r", 1 ],
                    "order": 0,
                    "source": [ "obj-depth-wet-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-depth-wet-line", 0 ],
                    "source": [ "obj-depth-wet-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-depth-l", 0 ],
                    "source": [ "obj-gain-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-depth-r", 0 ],
                    "source": [ "obj-gain-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-l", 0 ],
                    "source": [ "obj-groove-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain-r", 0 ],
                    "source": [ "obj-groove-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rec-l", 0 ],
                    "source": [ "obj-in-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rec-r", 0 ],
                    "source": [ "obj-in-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-loop-msg", 0 ],
                    "order": 1,
                    "source": [ "obj-loadbang", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rec-msg", 0 ],
                    "order": 2,
                    "source": [ "obj-loadbang", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-start-msg", 0 ],
                    "order": 0,
                    "source": [ "obj-loadbang", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-groove-l", 0 ],
                    "order": 1,
                    "source": [ "obj-loop-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-groove-r", 0 ],
                    "order": 0,
                    "source": [ "obj-loop-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-groove-l", 0 ],
                    "order": 1,
                    "source": [ "obj-rate-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-groove-r", 0 ],
                    "order": 0,
                    "source": [ "obj-rate-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rate-line", 0 ],
                    "source": [ "obj-rate-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rec-l", 0 ],
                    "order": 1,
                    "source": [ "obj-rec-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-rec-r", 0 ],
                    "order": 0,
                    "source": [ "obj-rec-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-groove-l", 0 ],
                    "order": 1,
                    "source": [ "obj-start-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-groove-r", 0 ],
                    "order": 0,
                    "source": [ "obj-start-msg", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}