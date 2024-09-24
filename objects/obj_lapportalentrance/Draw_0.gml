pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0)
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, image_blend, image_alpha)
draw_self()
shader_reset()
