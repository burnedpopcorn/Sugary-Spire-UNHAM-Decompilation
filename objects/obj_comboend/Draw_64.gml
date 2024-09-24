if (!global.showhud)
    return;
if (global.combotime > 0 && global.combo > 0 && (!startlerp))
    y = approach(y, (ystart + 90), 10)
var xx = x
var yy = y + obj_tv.DrawY
draw_set_color(c_white)
draw_sprite_ext(spr_comboend, 0, xx, yy, 1, 1, 0, c_white, veryalpha)
var title = floor(combo / 5)
draw_sprite_ext(spr_combotitlesanim, (title * 2 + title_index), xx, (yy + 30), scalealpha, scalealpha, 0, c_white, veryalpha)
draw_set_font(global.smallfont)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_text_color(xx, (yy + 55), string(comboscore), c_white, c_white, c_white, c_white, scorealpha)
if very
    draw_sprite_ext(spr_comboveryPZ, image_index, xx, yy, scalealpha, scalealpha, 0, c_white, veryalpha)
