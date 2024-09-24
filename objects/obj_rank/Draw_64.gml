if (!showlastcolor)
{
    confectiindex = 0
    secretindex = 0
    switch global.rank
    {
        case "p":
            bgimageindex = 6
            break
        case "s":
            bgimageindex = 5
            break
        case "a":
            bgimageindex = 4
            break
        case "b":
            bgimageindex = 3
            break
        case "c":
            bgimageindex = 2
            break
        case "d":
            bgimageindex = 1
            break
        default:
            bgimageindex = 0
            break
    }

    draw_set_color(c_white)
    draw_sprite_tiled_ext(spr_bgranks, bgimageindex, bgspeed, (0 - bgspeed), 1, 1, c_white, bgwaitalpha)
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
    draw_set_alpha(1)
    pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0)
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    shader_reset()
    draw_set_alpha(flashalpha)
    draw_rectangle(-64, -64, (camera_get_view_width(view_camera[0]) + 64), (camera_get_view_height(view_camera[0]) + 64), false)
    flashalpha = lerp(flashalpha, 0, 0.2)
    draw_set_alpha(image_alpha)
}
if (showlastcolor == 1)
{
    confectiindex += 0.25
    secretindex += 0.25
    shader_set(shd_rank)
    var dark = shader_get_uniform(shd_rank, "u_dark")
    var light = shader_get_uniform(shd_rank, "u_light")
    shader_set_uniform_f_array(dark, freezecol.dark)
    shader_set_uniform_f_array(light, freezecol.light)
    draw_set_color(c_white)
    draw_rectangle(-64, -64, (camera_get_view_width(view_camera[0]) + 64), (camera_get_view_height(view_camera[0]) + 64), false)
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    shader_reset()
    switch global.rank
    {
        case "p":
            _cakeIndex = 0
            break
        case "s":
            _cakeIndex = 0
            break
        case "a":
            _cakeIndex = 1
            break
        case "b":
            _cakeIndex = 2
            break
        case "c":
            _cakeIndex = 3
            break
        case "d":
            _cakeIndex = 4
            break
    }

    draw_sprite(spr_clipboardrank, 0, 455, clipboardPos)
    draw_sprite(spr_rank_cakescores, _cakeIndex, 700, (clipboardPos + 475))
    draw_set_font(global.resultsfont)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    var _string = string(global.collect)
    var _string_length = string_length(_string)
    for (var l = 0; l < _string_length; l++)
    {
        var _xx = 735 + (-((string_width(_string) / 2))) + string_width(_string) / _string_length * l
        var _yyoffset = ((l % 2) == 0 ? -4 : 0)
        pal = color_array[l]
        pal_swap_set(spr_palcandle, pal, 0)
        draw_text(_xx, (clipboardPos + 385 + height_array[l] + _yyoffset), string_char_at(_string, (l + 1)))
        pal_swap_reset()
    }
    for (l = 0; l < 3; l++)
    {
        _xx = 625 + 75 * l
        if (!(variable_global_get("secretfound" + (string(l + 1)))))
            draw_sprite(spr_rankcard, secretindex, _xx, (clipboardPos + 325))
        else if (secretindex > 6)
            draw_sprite(spr_rankcardflipped, secretindex, _xx, (clipboardPos + 325))
        else
            draw_sprite(spr_rankcardflipping, secretindex, _xx, (clipboardPos + 325))
    }
    for (l = 0; l < 5; l++)
    {
        var _followvar = variable_global_get(confectiArray[l] + "follow")
        var index = asset_get_index(string("spr_rank_{0}", (confectiArray[l] + (_followvar ? "" : "_lose"))))
        _xx = 535 + 80 * l
        if (confectiindex > 8)
            draw_sprite(index, (sprite_get_number(index) - 1), _xx, (clipboardPos + 230))
        else
            draw_sprite(index, confectiindex, _xx, (clipboardPos + 230))
    }
    draw_set_font(global.combofontresults)
    draw_text(795, (clipboardPos + 90), string(global.maxcombo))
    switch global.rank
    {
        case "p":
            _cakeIndex = 0
            break
        case "s":
            _cakeIndex = 1
            break
        case "a":
            _cakeIndex = 2
            break
        case "b":
            _cakeIndex = 3
            break
        case "c":
            _cakeIndex = 4
            break
        case "d":
            _cakeIndex = 5
            break
    }

    draw_sprite(spr_rank_image, _cakeIndex, 695, (clipboardPos + 110))
    if global.treasure
        draw_sprite(spr_rudejanitorgot, 0, 575, (clipboardPos + 120))
    draw_set_alpha(flashalpha)
    draw_rectangle(-64, -64, (camera_get_view_width(view_camera[0]) + 64), (camera_get_view_height(view_camera[0]) + 64), false)
    clipboardPos = lerp(clipboardPos, 2, 0.1)
    flashalpha = lerp(flashalpha, 0, 0.2)
    x = lerp(x, target_x, 0.1)
    draw_set_alpha(image_alpha)
}
