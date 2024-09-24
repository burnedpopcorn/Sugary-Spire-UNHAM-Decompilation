var t = pizzellebuffer
var spr_w = sprite_get_width(spr_loadingPizzelle)
var spr_h = sprite_get_height(spr_loadingPizzelle)
var xx = floor(480 - spr_w / 2)
var yy = floor(270 - spr_h / 2)
draw_sprite_ext(spr_loadingPizzelle_outline, 0, xx, yy, 1, 1, 0, c_gray, 1)
draw_sprite_part(spr_loadingPizzelle, 0, 0, 0, (spr_w * (t / 400)), spr_h, xx, yy)
