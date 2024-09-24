if (drawcount > 0)
    drawcount--
else
    countalpha = approach(countalpha, 0, 0.1)
countscale = approach(countscale, 1, 0.2)
draw_set_alpha(countalpha)
draw_set_font(global.newfont)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
var _shake = 0
if (countshake < 0)
{
    countshake--
    _shake = 2
}
if (notsavedcount >= 6)
    draw_text_transformed((480 + (random_range((-_shake), _shake))), (380 + (random_range((-_shake), _shake))), string(plushcount), countscale, countscale, 0)
draw_set_alpha(1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
