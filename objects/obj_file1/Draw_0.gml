pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0)
draw_self()
if (sprite_index == spr_file1_pizzanoprep && floor(image_index) <= 2)
{
    pal_swap_set(spr_deadpizzellepal, prevpal, false)
    draw_sprite(spr_file1_pizzanoprep2, image_index, x, y)
}
shader_reset()
