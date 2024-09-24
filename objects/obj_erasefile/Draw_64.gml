draw_set_alpha(0.7)
draw_rectangle_color(-32, -32, 992, 572, c_black, c_black, c_black, c_black, 0)
draw_set_alpha(1)
draw_set_font(global.newfont)
draw_set_halign(fa_center)
var savefile = 1
if (obj_mainfartselect.selected == 1)
    savefile = 2
if (obj_mainfartselect.selected == 2)
    savefile = 3
draw_text(480, 250, ("Erase Save File " + string(savefile) + "?"))
draw_set_font(global.font)
draw_option(400, 300, "NO", optionselected == 0)
if (optionselected == 1)
    draw_text_colour(560, 300, "YES", c_red, c_red, c_red, c_red, 1)
else
{
    draw_text_colour(560, 300, "YES", c_black, c_black, c_black, c_black, 1)
    draw_text_colour(560, 300, "YES", c_red, c_red, c_red, c_red, 0.5)
}
if (!cherrybackwards)
    charcherryindex += 0.35
else
{
    charcherryindex -= 0.45
    if (charcherryindex <= 0)
    {
        charcherryindex = 0
        cherrybackwards = 0
        charcherrysprite = spr_charcherry_wait
    }
}
if (charcherryindex >= sprite_get_number(charcherrysprite))
    charcherryindex = frac(charcherryindex)
draw_sprite(charcherrysprite, charcherryindex, (480 + (random_range((-cherryshake), cherryshake))), (205 + (random_range((-cherryshake), cherryshake))))
