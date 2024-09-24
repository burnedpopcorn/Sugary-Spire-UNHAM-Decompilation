draw_set_alpha(fadealpha)
draw_set_color(c_white)
draw_set_alpha(flashalpha)
draw_rectangle(-64, -64, (camera_get_view_width(view_camera[0]) + 64), (camera_get_view_height(view_camera[0]) + 64), false)
if (flashbuffer == 0)
    flashalpha = lerp(flashalpha, 0, 0.2)
draw_set_alpha(1)
draw_set_color(c_white)
var tiny = ":"
var tinier = ":"
var tinyish = ":"
if (global.playtimerseconds < 10)
    tiny = ":0"
if (global.playtimermiliseconds < 10)
    tinier = ":0"
if (global.playtimerminutes < 10)
    tinyish = ":0"
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_font(global.timerfont)
draw_text(823, 512, string_hash_to_newline(string(global.playtimerhour) + string(tinyish) + string(global.playtimerminutes) + string(tiny) + string(global.playtimerseconds) + string(tinier) + string(global.playtimermiliseconds)))
