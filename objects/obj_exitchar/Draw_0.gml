if (obj_player.character == "N")
{
    pal_swap_set(obj_player.spr_palette, 1, 0)
    draw_self()
    pal_swap_reset()
}
else
    pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0)
draw_self()
pal_swap_reset()
