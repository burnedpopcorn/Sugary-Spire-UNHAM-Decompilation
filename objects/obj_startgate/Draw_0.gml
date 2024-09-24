_old_depth = object_get_depth()
if (white_alpha != 1)
{
    if (!surface_exists(gate_surf))
        gate_surf = surface_create(sprite_get_width(sprite_index), sprite_get_height(sprite_index))
    else
    {
        surface_set_target(gate_surf)
        for (var l = 0; l < array_length(parallax_array); l++)
        {
            var _struct = parallax_array[l]
            _struct._x -= _struct._speed
            draw_sprite_tiled(_struct._sprite, 0, _struct._x, 0)
        }
        gpu_set_blendmode(bm_subtract)
        if sprite_exists(asset_get_index(sprite_get_name(sprite_index) + "_mask"))
            draw_sprite(asset_get_index(sprite_get_name(sprite_index) + "_mask"), 0, 0, 0)
        gpu_set_blendmode(bm_normal)
        surface_reset_target()
    }
    if (level == "entryway")
        draw_surface(gate_surf, (x - sprite_get_width(sprite_index) / 2 + 3), (y - sprite_get_height(sprite_index) + 128))
    else if (level == "steamy" || level == "molasses")
        draw_surface(gate_surf, (x - sprite_get_width(sprite_index) / 2), (y - sprite_get_height(sprite_index) + 128))
    else if (level == "mines")
        draw_surface(gate_surf, (x - sprite_get_width(sprite_index) / 2), (y - sprite_get_height(sprite_index) + 129))
}
else
    surface_free(gate_surf)
depth = old_depth
draw_sprite(sprite_index, 0, x, y)
var range = 120
var threshold = 1
var distance = distance_to_object(obj_player)
white_alpha = (-(((threshold + range - distance) / range)))
draw_sprite_ext(sprite_index, 1, x, y, 1, 1, 0, c_white, white_alpha)
draw_set_font(global.smallfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
ini_open(global.charsave)
draw_set_alpha(drawalpha)
draw_text(x, (drawy - 80), ((string(ini_read_string("Highscore", string(level), 0))) + " POINTS - " + (string(ini_read_string("Laps", string(level), 0))) + " LAPS"))
draw_text(x, (drawy - 117), ((ini_read_string("Secret", string(level), 0)) + " OF 3 SECRETS"))
for (var i = 0; i < 5; i++)
{
    var x_pos = -100 + 50 * i
    var collected = ini_read_string("Confecti", (string(level) + (string(i + 1))), 0)
    if (!collected)
        draw_sprite_ext_flash(confecti_sprs[i].sprite, confecti_sprs[i].image, (x + x_pos), (drawy - 170), 1, 1, 0, 0, drawalpha)
    else
        draw_sprite_ext(confecti_sprs[i].sprite, confecti_sprs[i].image, (x + x_pos), (drawy - 170), 1, 1, 0, c_white, drawalpha)
}
ini_close()
draw_set_alpha(1)
