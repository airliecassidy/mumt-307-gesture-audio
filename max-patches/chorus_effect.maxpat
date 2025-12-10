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
        "title": "Chorus Effect - Multi-tap with Modulation",
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
                    "text": "CHORUS EFFECT "
                }
            },
            {
                "box": {
                    "id": "obj-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 32.0, 550.0, 20.0 ],
                    "text": "tapin~/tapout~ with rand~ modulated delays (17ms, 23ms) + feedback for rich chorus"
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
                    "patching_rect": [ 450.0, 70.0, 120.0, 22.0 ],
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
                    "patching_rect": [ 700.0, 70.0, 123.0, 22.0 ],
                    "text": "receive chorus_depth"
                }
            },
            {
                "box": {
                    "id": "obj-active-recv",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 700.0, 130.0, 125.0, 22.0 ],
                    "text": "receive chorus_active"
                }
            },
            {
                "box": {
                    "id": "obj-mod-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 700.0, 100.0, 110.0, 22.0 ],
                    "text": "scale 0. 1. 0.5 4."
                }
            },
            {
                "box": {
                    "id": "obj-mod-line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 700.0, 190.0, 80.0, 22.0 ],
                    "text": "line~ 1. 20"
                }
            },
            {
                "box": {
                    "id": "obj-active-line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 700.0, 160.0, 80.0, 22.0 ],
                    "text": "line~ 0. 20"
                }
            },
            {
                "box": {
                    "id": "obj-rand1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 180.0, 130.0, 60.0, 22.0 ],
                    "text": "rand~ 8"
                }
            },
            {
                "box": {
                    "id": "obj-rand2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 260.0, 130.0, 60.0, 22.0 ],
                    "text": "rand~ 6"
                }
            },
            {
                "box": {
                    "id": "obj-mod-mult1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 180.0, 170.0, 40.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-mod-mult2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 260.0, 170.0, 40.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-base1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 180.0, 210.0, 60.0, 22.0 ],
                    "text": "+~ 17."
                }
            },
            {
                "box": {
                    "id": "obj-base2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 260.0, 210.0, 60.0, 22.0 ],
                    "text": "+~ 23."
                }
            },
            {
                "box": {
                    "id": "obj-fb-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 120.0, 370.0, 55.0, 22.0 ],
                    "text": "*~ 0.3"
                }
            },
            {
                "box": {
                    "id": "obj-fb-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 530.0, 370.0, 55.0, 22.0 ],
                    "text": "*~ 0.3"
                }
            },
            {
                "box": {
                    "id": "obj-mix-in-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 110.0, 35.0, 22.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-mix-in-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 450.0, 110.0, 35.0, 22.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-tapin-l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "tapconnect" ],
                    "patching_rect": [ 40.0, 250.0, 80.0, 22.0 ],
                    "text": "tapin~ 100"
                }
            },
            {
                "box": {
                    "id": "obj-tapin-r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "tapconnect" ],
                    "patching_rect": [ 450.0, 250.0, 80.0, 22.0 ],
                    "text": "tapin~ 100"
                }
            },
            {
                "box": {
                    "id": "obj-tapout-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 40.0, 290.0, 150.0, 22.0 ],
                    "text": "tapout~ 17 23"
                }
            },
            {
                "box": {
                    "id": "obj-tapout-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 450.0, 290.0, 150.0, 22.0 ],
                    "text": "tapout~ 17 23"
                }
            },
            {
                "box": {
                    "id": "obj-tap-mix-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 330.0, 35.0, 22.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-tap-mix-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 450.0, 330.0, 35.0, 22.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-tap-scale-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 370.0, 55.0, 22.0 ],
                    "text": "*~ 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-tap-scale-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 450.0, 370.0, 55.0, 22.0 ],
                    "text": "*~ 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-depth-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 420.0, 40.0, 22.0 ],
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
                    "patching_rect": [ 450.0, 420.0, 40.0, 22.0 ],
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
                    "patching_rect": [ 40.0, 460.0, 40.0, 22.0 ],
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
                    "patching_rect": [ 450.0, 460.0, 40.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-out-l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 510.0, 100.0, 22.0 ],
                    "text": "send~ fx_wet_l"
                }
            },
            {
                "box": {
                    "id": "obj-out-r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 510.0, 100.0, 22.0 ],
                    "text": "send~ fx_wet_r"
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
                    "destination": [ "obj-tapout-l", 1 ],
                    "order": 1,
                    "source": [ "obj-base1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tapout-r", 1 ],
                    "order": 0,
                    "source": [ "obj-base1", 0 ]
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
                    "destination": [ "obj-mod-scale", 0 ],
                    "source": [ "obj-depth-recv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mix-in-l", 1 ],
                    "source": [ "obj-fb-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mix-in-r", 1 ],
                    "source": [ "obj-fb-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mix-in-l", 0 ],
                    "source": [ "obj-in-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mix-in-r", 0 ],
                    "source": [ "obj-in-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tapin-l", 0 ],
                    "source": [ "obj-mix-in-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tapin-r", 0 ],
                    "source": [ "obj-mix-in-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-depth-l", 1 ],
                    "order": 3,
                    "source": [ "obj-mod-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-depth-r", 1 ],
                    "order": 0,
                    "source": [ "obj-mod-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mod-mult1", 1 ],
                    "order": 2,
                    "source": [ "obj-mod-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mod-mult2", 1 ],
                    "order": 1,
                    "source": [ "obj-mod-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-base1", 0 ],
                    "source": [ "obj-mod-mult1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-base2", 0 ],
                    "source": [ "obj-mod-mult2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mod-line", 0 ],
                    "source": [ "obj-mod-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mod-mult1", 0 ],
                    "source": [ "obj-rand1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mod-mult2", 0 ],
                    "source": [ "obj-rand2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-fb-l", 0 ],
                    "order": 0,
                    "source": [ "obj-tap-mix-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tap-scale-l", 0 ],
                    "order": 1,
                    "source": [ "obj-tap-mix-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-fb-r", 0 ],
                    "order": 0,
                    "source": [ "obj-tap-mix-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tap-scale-r", 0 ],
                    "order": 1,
                    "source": [ "obj-tap-mix-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-depth-l", 0 ],
                    "source": [ "obj-tap-scale-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-depth-r", 0 ],
                    "source": [ "obj-tap-scale-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tapout-l", 0 ],
                    "source": [ "obj-tapin-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tapout-r", 0 ],
                    "source": [ "obj-tapin-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tap-mix-l", 1 ],
                    "source": [ "obj-tapout-l", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tap-mix-l", 0 ],
                    "source": [ "obj-tapout-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tap-mix-r", 1 ],
                    "source": [ "obj-tapout-r", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tap-mix-r", 0 ],
                    "source": [ "obj-tapout-r", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}