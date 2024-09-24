draw_set_halign(fa_center)
draw_set_font(global.font)
draw_option(150, (30 + ScrollY), "BACK", optionselected == states.normal)
var _yy = 50
var _x1 = 400
var _x2 = 600
draw_option(_x1, (_yy + ScrollY), "UP", optionselected == states.titlescreen)
draw_text(_x2, (_yy + ScrollY), scr_keyname(global.key_up))
_yy += 50
draw_option(_x1, (_yy + ScrollY), "RIGHT", optionselected == states.hookshot)
draw_text(_x2, (_yy + ScrollY), scr_keyname(global.key_right))
_yy += 50
draw_option(_x1, (_yy + ScrollY), "LEFT", optionselected == states.slap)
draw_text(_x2, (_yy + ScrollY), scr_keyname(global.key_left))
_yy += 50
draw_option(_x1, (_yy + ScrollY), "DOWN", optionselected == states.charge)
draw_text(_x2, (_yy + ScrollY), scr_keyname(global.key_down))
_yy += 50
draw_option(_x1, (_yy + ScrollY), "JUMP", optionselected == states.cheesepep)
draw_text(_x2, (_yy + ScrollY), scr_keyname(global.key_jump))
_yy += 50
draw_option(_x1, (_yy + ScrollY), "GRAB", optionselected == states.cheeseball)
draw_text(_x2, (_yy + ScrollY), scr_keyname(global.key_slap))
_yy += 50
draw_option(_x1, (_yy + ScrollY), "TAUNT", optionselected == states.cheesepepstick)
draw_text(_x2, (_yy + ScrollY), scr_keyname(global.key_taunt))
_yy += 50
draw_option(_x1, (_yy + ScrollY), "SHOOT", optionselected == states.boxxedpep)
draw_text(_x2, (_yy + ScrollY), scr_keyname(global.key_shoot))
_yy += 50
draw_option(_x1, (_yy + ScrollY), "MACHRUN", optionselected == states.pistolaim)
draw_text(_x2, (_yy + ScrollY), scr_keyname(global.key_attack))
_yy += 50
draw_option(_x1, (_yy + ScrollY), "START", optionselected == states.climbwall)
draw_text(_x2, (_yy + ScrollY), scr_keyname(global.key_start))
_yy += 50
draw_set_font(global.smallfont)
draw_text(480, 512, subtitle)
