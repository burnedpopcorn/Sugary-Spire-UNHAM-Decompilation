charindex += 0.35
draw_set_font(global.font)
draw_set_halign(fa_center)
draw_set_color(c_white)
draw_text(xi, yi, string_hash_to_newline(_message))
if pizzano_unlocked
    draw_sprite_ext(charicon, charindex, 80, (510 + icon_y), 1, 1, 0, c_white, 1)
var titlespr = spr_titlemenu
menuindex += 0.175
if (menuindex >= 2)
    menuindex = frac(menuindex)
if (!file_exists(global.charsave))
    titlespr = spr_titlemenu2
draw_sprite(titlespr, menuindex, 0, 0)
