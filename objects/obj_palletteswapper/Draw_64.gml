if drawing
{
    draw_set_font(global.smallfont)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    var _x = 0
    if (palettename == "CHOCOLATE AMPHIBIAN" || palettename == "LOADING INTO SPIRE")
        _x = 20
    draw_text_color((312 + _x), 142, palettename, c_white, c_white, c_white, c_white, textblend)
}
