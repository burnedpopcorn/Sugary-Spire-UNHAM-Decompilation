draw_set_alpha(0.7)
draw_rectangle_color(-32, -32, 992, 572, c_black, c_black, c_black, c_black, 0)
draw_set_alpha(1)
draw_set_font(global.newfont)
draw_set_halign(fa_center)
draw_text(485, 250, "Exit Game?")
draw_set_font(global.font)
draw_option(400, 300, "NO", optionselected == 0)
if (optionselected == 1)
    draw_text_colour(560, 300, "YES", c_red, c_red, c_red, c_red, 1)
else
{
    draw_text_colour(560, 300, "YES", c_black, c_black, c_black, c_black, 1)
    draw_text_colour(560, 300, "YES", c_red, c_red, c_red, c_red, 0.5)
}
