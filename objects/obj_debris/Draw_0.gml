if (sprite_index == spr_introdebris || sprite_index == spr_pizzano_sleepdebris)
{
    pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0)
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, image_blend, image_alpha)
    draw_self()
    shader_reset()
}
else
    draw_self()
