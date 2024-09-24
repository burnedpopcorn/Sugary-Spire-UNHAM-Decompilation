if instance_exists(obj_rank)
{
    if obj_rank.showlastcolor
    {
        var tiny = ";"
        var tinier = "."
        var tinyish = ":"
        if (global.playtimerseconds < 10)
            tiny = ";0"
        if (global.playtimermiliseconds < 10)
            tinier = ".0"
        if (global.playtimerminutes < 10)
            tinyish = ":0"
        draw_set_color(c_white)
        draw_set_halign(fa_left)
        draw_set_font(global.clipboardtimefont)
        draw_text(798, (obj_rank.clipboardPos + 522), string_hash_to_newline(string(global.playtimerhour) + string(tinyish) + string(global.playtimerminutes) + string(tiny) + string(global.playtimerseconds) + string(tinier) + string(global.playtimermiliseconds)))
    }
}
