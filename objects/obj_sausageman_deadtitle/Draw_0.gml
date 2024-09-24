if (sprite_index == spr_file_pizzelledebris)
{
    pal_swap_set(spr_pal, paletteselect, 0)
    draw_self()
    shader_reset()
}
else
    draw_self()
