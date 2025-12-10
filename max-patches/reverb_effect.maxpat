{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 8,
      "minor": 6,
      "revision": 0,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [50.0, 50.0, 900.0, 700.0],
    "bglocked": 0,
    "openinpresentation": 0,
    "default_fontsize": 12.0,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 0,
    "gridsize": [15.0, 15.0],
    "gridsnaponopen": 0,
    "toolbarvisible": 1,
    "boxanimatetime": 200,
    "title": "reverb_effect (Schroeder)",
    "boxes": [
      {
        "box": {
          "id": "obj-title",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [20.0, 10.0, 400.0, 20.0],
          "text": "Schroeder Reverb - 4 Comb Filters + 2 Allpass Filters",
          "fontsize": 14.0,
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-info",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [20.0, 30.0, 500.0, 20.0],
          "text": "Based on Curtis Roads / Schroeder algorithm",
          "fontsize": 10.0
        }
      },
      {
        "box": {
          "id": "rl",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [40.0, 60.0, 120.0, 22.0],
          "text": "receive~ audio_in_l"
        }
      },
      {
        "box": {
          "id": "rr",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [450.0, 60.0, 120.0, 22.0],
          "text": "receive~ audio_in_r"
        }
      },
      {
        "box": {
          "id": "depth_recv",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [700.0, 60.0, 130.0, 22.0],
          "text": "receive reverb_depth"
        }
      },
      {
        "box": {
          "id": "act_recv",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [700.0, 130.0, 130.0, 22.0],
          "text": "receive reverb_active"
        }
      },
      {
        "box": {
          "id": "depth_scale",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [700.0, 90.0, 130.0, 22.0],
          "text": "scale 0. 1. 0.5 0.95"
        }
      },
      {
        "box": {
          "id": "fb_line",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [700.0, 200.0, 80.0, 22.0],
          "text": "line~ 0.7 50"
        }
      },
      {
        "box": {
          "id": "act_line",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [700.0, 160.0, 60.0, 22.0],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "comb1_ti_l",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [40.0, 100.0, 90.0, 22.0],
          "text": "tapin~ 1000"
        }
      },
      {
        "box": {
          "id": "comb1_to_l",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [40.0, 130.0, 80.0, 22.0],
          "text": "tapout~ 29.7"
        }
      },
      {
        "box": {
          "id": "comb2_ti_l",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [140.0, 100.0, 90.0, 22.0],
          "text": "tapin~ 1000"
        }
      },
      {
        "box": {
          "id": "comb2_to_l",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [140.0, 130.0, 80.0, 22.0],
          "text": "tapout~ 37.1"
        }
      },
      {
        "box": {
          "id": "comb3_ti_l",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [240.0, 100.0, 90.0, 22.0],
          "text": "tapin~ 1000"
        }
      },
      {
        "box": {
          "id": "comb3_to_l",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [240.0, 130.0, 80.0, 22.0],
          "text": "tapout~ 41.1"
        }
      },
      {
        "box": {
          "id": "comb4_ti_l",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [340.0, 100.0, 90.0, 22.0],
          "text": "tapin~ 1000"
        }
      },
      {
        "box": {
          "id": "comb4_to_l",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [340.0, 130.0, 80.0, 22.0],
          "text": "tapout~ 43.7"
        }
      },
      {
        "box": {
          "id": "fb1_l",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [40.0, 160.0, 35.0, 22.0],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "fb2_l",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [140.0, 160.0, 35.0, 22.0],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "fb3_l",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [240.0, 160.0, 35.0, 22.0],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "fb4_l",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [340.0, 160.0, 35.0, 22.0],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "add1_l",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [40.0, 190.0, 35.0, 22.0],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "add2_l",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [140.0, 190.0, 35.0, 22.0],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "add3_l",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [240.0, 190.0, 35.0, 22.0],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "add4_l",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [340.0, 190.0, 35.0, 22.0],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "comb_mix_l1",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [90.0, 230.0, 35.0, 22.0],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "comb_mix_l2",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [290.0, 230.0, 35.0, 22.0],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "comb_mix_l3",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [190.0, 260.0, 35.0, 22.0],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "ap1_ti_l",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [190.0, 300.0, 90.0, 22.0],
          "text": "tapin~ 500"
        }
      },
      {
        "box": {
          "id": "ap1_to_l",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [190.0, 330.0, 70.0, 22.0],
          "text": "tapout~ 5"
        }
      },
      {
        "box": {
          "id": "ap1_fb_l",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [190.0, 360.0, 50.0, 22.0],
          "text": "*~ 0.7"
        }
      },
      {
        "box": {
          "id": "ap1_add_l",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [190.0, 390.0, 35.0, 22.0],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "ap2_ti_l",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [190.0, 430.0, 90.0, 22.0],
          "text": "tapin~ 500"
        }
      },
      {
        "box": {
          "id": "ap2_to_l",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [190.0, 460.0, 80.0, 22.0],
          "text": "tapout~ 1.7"
        }
      },
      {
        "box": {
          "id": "ap2_fb_l",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [190.0, 490.0, 50.0, 22.0],
          "text": "*~ 0.7"
        }
      },
      {
        "box": {
          "id": "ap2_add_l",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [190.0, 520.0, 35.0, 22.0],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "comb1_ti_r",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [450.0, 100.0, 90.0, 22.0],
          "text": "tapin~ 1000"
        }
      },
      {
        "box": {
          "id": "comb1_to_r",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [450.0, 130.0, 80.0, 22.0],
          "text": "tapout~ 31.2"
        }
      },
      {
        "box": {
          "id": "comb2_ti_r",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [550.0, 100.0, 90.0, 22.0],
          "text": "tapin~ 1000"
        }
      },
      {
        "box": {
          "id": "comb2_to_r",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [550.0, 130.0, 80.0, 22.0],
          "text": "tapout~ 38.6"
        }
      },
      {
        "box": {
          "id": "fb1_r",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [450.0, 160.0, 35.0, 22.0],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "fb2_r",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [550.0, 160.0, 35.0, 22.0],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "add1_r",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [450.0, 190.0, 35.0, 22.0],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "add2_r",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [550.0, 190.0, 35.0, 22.0],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "comb_mix_r1",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [500.0, 260.0, 35.0, 22.0],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "ap1_ti_r",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [500.0, 300.0, 90.0, 22.0],
          "text": "tapin~ 500"
        }
      },
      {
        "box": {
          "id": "ap1_to_r",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [500.0, 330.0, 80.0, 22.0],
          "text": "tapout~ 5.3"
        }
      },
      {
        "box": {
          "id": "ap1_fb_r",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [500.0, 360.0, 50.0, 22.0],
          "text": "*~ 0.7"
        }
      },
      {
        "box": {
          "id": "ap1_add_r",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [500.0, 390.0, 35.0, 22.0],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "ap2_ti_r",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [500.0, 430.0, 90.0, 22.0],
          "text": "tapin~ 500"
        }
      },
      {
        "box": {
          "id": "ap2_to_r",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [500.0, 460.0, 70.0, 22.0],
          "text": "tapout~ 2"
        }
      },
      {
        "box": {
          "id": "ap2_fb_r",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [500.0, 490.0, 50.0, 22.0],
          "text": "*~ 0.7"
        }
      },
      {
        "box": {
          "id": "ap2_add_r",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [500.0, 520.0, 35.0, 22.0],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "gain_l",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [190.0, 560.0, 50.0, 22.0],
          "text": "*~ 0.3"
        }
      },
      {
        "box": {
          "id": "gain_r",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [500.0, 560.0, 50.0, 22.0],
          "text": "*~ 0.3"
        }
      },
      {
        "box": {
          "id": "ma_l",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [190.0, 600.0, 35.0, 22.0],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "ma_r",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [500.0, 600.0, 35.0, 22.0],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "swl",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [190.0, 640.0, 110.0, 22.0],
          "text": "send~ fx_wet_l"
        }
      },
      {
        "box": {
          "id": "swr",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [500.0, 640.0, 110.0, 22.0],
          "text": "send~ fx_wet_r"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": ["rl", 0],
          "destination": ["add1_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["rl", 0],
          "destination": ["add2_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["rl", 0],
          "destination": ["add3_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["rl", 0],
          "destination": ["add4_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["add1_l", 0],
          "destination": ["comb1_ti_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["comb1_ti_l", 0],
          "destination": ["comb1_to_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["comb1_to_l", 0],
          "destination": ["fb1_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["fb_line", 0],
          "destination": ["fb1_l", 1]
        }
      },
      {
        "patchline": {
          "source": ["fb1_l", 0],
          "destination": ["add1_l", 1]
        }
      },
      {
        "patchline": {
          "source": ["comb1_to_l", 0],
          "destination": ["comb_mix_l1", 0]
        }
      },
      {
        "patchline": {
          "source": ["add2_l", 0],
          "destination": ["comb2_ti_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["comb2_ti_l", 0],
          "destination": ["comb2_to_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["comb2_to_l", 0],
          "destination": ["fb2_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["fb_line", 0],
          "destination": ["fb2_l", 1]
        }
      },
      {
        "patchline": {
          "source": ["fb2_l", 0],
          "destination": ["add2_l", 1]
        }
      },
      {
        "patchline": {
          "source": ["comb2_to_l", 0],
          "destination": ["comb_mix_l1", 1]
        }
      },
      {
        "patchline": {
          "source": ["add3_l", 0],
          "destination": ["comb3_ti_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["comb3_ti_l", 0],
          "destination": ["comb3_to_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["comb3_to_l", 0],
          "destination": ["fb3_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["fb_line", 0],
          "destination": ["fb3_l", 1]
        }
      },
      {
        "patchline": {
          "source": ["fb3_l", 0],
          "destination": ["add3_l", 1]
        }
      },
      {
        "patchline": {
          "source": ["comb3_to_l", 0],
          "destination": ["comb_mix_l2", 0]
        }
      },
      {
        "patchline": {
          "source": ["add4_l", 0],
          "destination": ["comb4_ti_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["comb4_ti_l", 0],
          "destination": ["comb4_to_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["comb4_to_l", 0],
          "destination": ["fb4_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["fb_line", 0],
          "destination": ["fb4_l", 1]
        }
      },
      {
        "patchline": {
          "source": ["fb4_l", 0],
          "destination": ["add4_l", 1]
        }
      },
      {
        "patchline": {
          "source": ["comb4_to_l", 0],
          "destination": ["comb_mix_l2", 1]
        }
      },
      {
        "patchline": {
          "source": ["comb_mix_l1", 0],
          "destination": ["comb_mix_l3", 0]
        }
      },
      {
        "patchline": {
          "source": ["comb_mix_l2", 0],
          "destination": ["comb_mix_l3", 1]
        }
      },
      {
        "patchline": {
          "source": ["comb_mix_l3", 0],
          "destination": ["ap1_add_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["ap1_add_l", 0],
          "destination": ["ap1_ti_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["ap1_ti_l", 0],
          "destination": ["ap1_to_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["ap1_to_l", 0],
          "destination": ["ap1_fb_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["ap1_fb_l", 0],
          "destination": ["ap1_add_l", 1]
        }
      },
      {
        "patchline": {
          "source": ["ap1_to_l", 0],
          "destination": ["ap2_add_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["ap2_add_l", 0],
          "destination": ["ap2_ti_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["ap2_ti_l", 0],
          "destination": ["ap2_to_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["ap2_to_l", 0],
          "destination": ["ap2_fb_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["ap2_fb_l", 0],
          "destination": ["ap2_add_l", 1]
        }
      },
      {
        "patchline": {
          "source": ["ap2_to_l", 0],
          "destination": ["gain_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["gain_l", 0],
          "destination": ["ma_l", 0]
        }
      },
      {
        "patchline": {
          "source": ["act_line", 0],
          "destination": ["ma_l", 1]
        }
      },
      {
        "patchline": {
          "source": ["ma_l", 0],
          "destination": ["swl", 0]
        }
      },
      {
        "patchline": {
          "source": ["rr", 0],
          "destination": ["add1_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["rr", 0],
          "destination": ["add2_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["add1_r", 0],
          "destination": ["comb1_ti_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["comb1_ti_r", 0],
          "destination": ["comb1_to_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["comb1_to_r", 0],
          "destination": ["fb1_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["fb_line", 0],
          "destination": ["fb1_r", 1]
        }
      },
      {
        "patchline": {
          "source": ["fb1_r", 0],
          "destination": ["add1_r", 1]
        }
      },
      {
        "patchline": {
          "source": ["comb1_to_r", 0],
          "destination": ["comb_mix_r1", 0]
        }
      },
      {
        "patchline": {
          "source": ["add2_r", 0],
          "destination": ["comb2_ti_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["comb2_ti_r", 0],
          "destination": ["comb2_to_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["comb2_to_r", 0],
          "destination": ["fb2_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["fb_line", 0],
          "destination": ["fb2_r", 1]
        }
      },
      {
        "patchline": {
          "source": ["fb2_r", 0],
          "destination": ["add2_r", 1]
        }
      },
      {
        "patchline": {
          "source": ["comb2_to_r", 0],
          "destination": ["comb_mix_r1", 1]
        }
      },
      {
        "patchline": {
          "source": ["comb_mix_r1", 0],
          "destination": ["ap1_add_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["ap1_add_r", 0],
          "destination": ["ap1_ti_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["ap1_ti_r", 0],
          "destination": ["ap1_to_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["ap1_to_r", 0],
          "destination": ["ap1_fb_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["ap1_fb_r", 0],
          "destination": ["ap1_add_r", 1]
        }
      },
      {
        "patchline": {
          "source": ["ap1_to_r", 0],
          "destination": ["ap2_add_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["ap2_add_r", 0],
          "destination": ["ap2_ti_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["ap2_ti_r", 0],
          "destination": ["ap2_to_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["ap2_to_r", 0],
          "destination": ["ap2_fb_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["ap2_fb_r", 0],
          "destination": ["ap2_add_r", 1]
        }
      },
      {
        "patchline": {
          "source": ["ap2_to_r", 0],
          "destination": ["gain_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["gain_r", 0],
          "destination": ["ma_r", 0]
        }
      },
      {
        "patchline": {
          "source": ["act_line", 0],
          "destination": ["ma_r", 1]
        }
      },
      {
        "patchline": {
          "source": ["ma_r", 0],
          "destination": ["swr", 0]
        }
      },
      {
        "patchline": {
          "source": ["depth_recv", 0],
          "destination": ["depth_scale", 0]
        }
      },
      {
        "patchline": {
          "source": ["depth_scale", 0],
          "destination": ["fb_line", 0]
        }
      },
      {
        "patchline": {
          "source": ["act_recv", 0],
          "destination": ["act_line", 0]
        }
      }
    ]
  }
}
