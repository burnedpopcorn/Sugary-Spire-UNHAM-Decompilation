if pause
{
    pauseshake = lerp(pauseshake, 0, 0.12)
    draw_set_alpha(1)
    scr_draw_pause_image()
    draw_sprite_tiled(bg_paused, 0, x++, y++)
    draw_rectangle_color(-5000, 0, 0, 1080, 0x2A0005, 0x2A0005, 0x2A0005, 0x2A0005, false)
    draw_rectangle_color(960, 0, 5960, 1080, 0x2A0005, 0x2A0005, 0x2A0005, 0x2A0005, false)
    draw_sprite(spr_pause, 0, 0, 0)
    switch selected
    {
        case 0:
            selectindex = [1, 0, 0, 0]
            break
        case 1:
            selectindex = [0, 1, 0, 0]
            if (!canrestart)
                selectindex = [0, 2, 0, 0]
            break
        case 2:
            selectindex = [0, 0, 1, 0]
            if (!canexit)
                selectindex = [0, 0, 2, 0]
            break
        case 3:
            selectindex = [0, 0, 0, 1]
            break
    }

    draw_sprite(spr_pauseresume, selectindex[0], (0 + (random_range((-pauseshake), pauseshake))), (0 + (random_range((-pauseshake), pauseshake))))
    draw_sprite(spr_pauseretry, selectindex[1], (0 + (random_range((-pauseshake), pauseshake))), (0 + (random_range((-pauseshake), pauseshake))))
    draw_sprite(spr_pauseexit, selectindex[2], (0 + (random_range((-pauseshake), pauseshake))), (0 + (random_range((-pauseshake), pauseshake))))
    draw_sprite(spr_pauseoptions, selectindex[3], (0 + (random_range((-pauseshake), pauseshake))), (0 + (random_range((-pauseshake), pauseshake))))
    if global.mallowfollow
        draw_sprite(spr_pauseconfecti1, 1, 0, 0)
    else
        draw_sprite(spr_pauseconfecti1, 0, 0, 0)
    if global.chocofollow
        draw_sprite(spr_pauseconfecti2, 1, 0, 0)
    else
        draw_sprite(spr_pauseconfecti2, 0, 0, 0)
    if global.crackfollow
        draw_sprite(spr_pauseconfecti3, 1, 0, 0)
    else
        draw_sprite(spr_pauseconfecti3, 0, 0, 0)
    if global.wormfollow
        draw_sprite(spr_pauseconfecti4, 1, 0, 0)
    else
        draw_sprite(spr_pauseconfecti4, 0, 0, 0)
    if global.candyfollow
        draw_sprite(spr_pauseconfecti5, 1, 0, 0)
    else
        draw_sprite(spr_pauseconfecti5, 0, 0, 0)
    pal_swap_set(palette, pal, 0)
    draw_sprite(pause_char, global.panic, 686, 285)
    shader_reset()
    draw_set_font(global.font)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    var _x = 86
    var _y = 32
    if (global.playseconds >= 10)
        draw_text(_x, _y, string_hash_to_newline(string(global.playminutes) + ":" + string(global.playseconds)))
    if (global.playseconds < 10)
        draw_text(_x, _y, string_hash_to_newline(string(global.playminutes) + ":0" + string(global.playseconds)))
}
