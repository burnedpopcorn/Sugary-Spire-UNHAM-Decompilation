depth = -100
image_speed = 0.35
sprite = choose(spr_technicaldifficulty1, spr_technicaldifficulty2, spr_technicaldifficulty3)
if (obj_player.character == "N")
    sprite = spr_technicaldifficulty1_Pizzano
static_index = 0
static_max = 15
static_dir = 1
use_static = true
scr_sound(TVswitch)
alarm[0] = 80
global.combofreeze = 80
