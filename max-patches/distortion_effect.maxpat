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
        "rect": [ 100.0, 100.0, 900.0, 700.0 ],
        "title": "Distortion Effect - Resonance Generator Style",
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14.0,
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 10.0, 400.0, 22.0 ],
                    "text": "DISTORTION EFFECT -"
                }
            },
            {
                "box": {
                    "id": "obj-desc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 32.0, 500.0, 20.0 ],
                    "text": "Pre-filter → Waveshaping (tanh~) → Resonant filter "
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
                    "patching_rect": [ 600.0, 70.0, 136.0, 22.0 ],
                    "text": "receive distortion_depth"
                }
            },
            {
                "box": {
                    "id": "obj-active-recv",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 750.0, 70.0, 137.0, 22.0 ],
                    "text": "receive distortion_active"
                }
            },
            {
                "box": {
                    "id": "obj-depth-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 600.0, 100.0, 120.0, 22.0 ],
                    "text": "scale 0. 1. 1. 20."
                }
            },
            {
                "box": {
                    "id": "obj-depth-line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 600.0, 130.0, 80.0, 22.0 ],
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
                    "patching_rect": [ 750.0, 130.0, 80.0, 22.0 ],
                    "text": "line~ 0. 20"
                }
            },
            {
                "box": {
                    "id": "obj-res-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 600.0, 170.0, 130.0, 22.0 ],
                    "text": "scale 0. 1. 500. 3000."
                }
            },
            {
                "box": {
                    "id": "obj-res-line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 600.0, 200.0, 84.0, 22.0 ],
                    "text": "line~ 1000. 20"
                }
            },
            {
                "box": {
                    "id": "obj-drive-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 130.0, 40.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-drive-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 400.0, 130.0, 40.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-hp-l",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 4,
                    "outlettype": [ "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 40.0, 170.0, 100.0, 22.0 ],
                    "text": "svf~ 80. 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-hp-r",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 4,
                    "outlettype": [ "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 400.0, 170.0, 100.0, 22.0 ],
                    "text": "svf~ 80. 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-tanh-l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 220.0, 50.0, 22.0 ],
                    "text": "tanh~"
                }
            },
            {
                "box": {
                    "id": "obj-tanh-r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 400.0, 220.0, 50.0, 22.0 ],
                    "text": "tanh~"
                }
            },
            {
                "box": {
                    "id": "obj-res-filter-l",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 270.0, 110.0, 22.0 ],
                    "text": "lores~ 2000. 0.7"
                }
            },
            {
                "box": {
                    "id": "obj-res-filter-r",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 400.0, 270.0, 110.0, 22.0 ],
                    "text": "lores~ 2000. 0.7"
                }
            },
            {
                "box": {
                    "id": "obj-post-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 320.0, 55.0, 22.0 ],
                    "text": "*~ 0.4"
                }
            },
            {
                "box": {
                    "id": "obj-post-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 400.0, 320.0, 55.0, 22.0 ],
                    "text": "*~ 0.4"
                }
            },
            {
                "box": {
                    "id": "obj-wet-depth-l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 370.0, 40.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-wet-depth-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 400.0, 370.0, 40.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-wet-active-l",
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
                    "id": "obj-wet-active-r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 400.0, 420.0, 40.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-out-l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 470.0, 100.0, 22.0 ],
                    "text": "send~ fx_wet_l"
                }
            },
            {
                "box": {
                    "id": "obj-out-r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 470.0, 100.0, 22.0 ],
                    "text": "send~ fx_wet_r"
                }
            },
            {
                "box": {
                    "id": "obj-sig-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 600.0, 240.0, 40.0, 22.0 ],
                    "text": "sig~"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-wet-active-l", 1 ],
                    "order": 1,
                    "source": [ "obj-active-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-wet-active-r", 1 ],
                    "order": 0,
                    "source": [ "obj-active-line", 0 ]
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
                    "destination": [ "obj-drive-l", 1 ],
                    "order": 3,
                    "source": [ "obj-depth-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-drive-r", 1 ],
                    "order": 1,
                    "source": [ "obj-depth-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-wet-depth-l", 1 ],
                    "order": 2,
                    "source": [ "obj-depth-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-wet-depth-r", 1 ],
                    "order": 0,
                    "source": [ "obj-depth-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-depth-scale", 0 ],
                    "order": 1,
                    "source": [ "obj-depth-recv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-res-scale", 0 ],
                    "order": 0,
                    "source": [ "obj-depth-recv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-depth-line", 0 ],
                    "source": [ "obj-depth-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-hp-l", 0 ],
                    "source": [ "obj-drive-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-hp-r", 0 ],
                    "source": [ "obj-drive-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tanh-l", 0 ],
                    "source": [ "obj-hp-l", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tanh-r", 0 ],
                    "source": [ "obj-hp-r", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-drive-l", 0 ],
                    "source": [ "obj-in-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-drive-r", 0 ],
                    "source": [ "obj-in-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-wet-depth-l", 0 ],
                    "source": [ "obj-post-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-wet-depth-r", 0 ],
                    "source": [ "obj-post-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-post-l", 0 ],
                    "source": [ "obj-res-filter-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-post-r", 0 ],
                    "source": [ "obj-res-filter-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sig-1", 0 ],
                    "source": [ "obj-res-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-res-line", 0 ],
                    "source": [ "obj-res-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-res-filter-l", 1 ],
                    "order": 1,
                    "source": [ "obj-sig-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-res-filter-r", 1 ],
                    "order": 0,
                    "source": [ "obj-sig-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-res-filter-l", 0 ],
                    "source": [ "obj-tanh-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-res-filter-r", 0 ],
                    "source": [ "obj-tanh-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-out-l", 0 ],
                    "source": [ "obj-wet-active-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-out-r", 0 ],
                    "source": [ "obj-wet-active-r", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-wet-active-l", 0 ],
                    "source": [ "obj-wet-depth-l", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-wet-active-r", 0 ],
                    "source": [ "obj-wet-depth-r", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}