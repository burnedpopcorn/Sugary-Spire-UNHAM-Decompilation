draw_set_color(c_white)
for (var i = 0; i < ds_list_size(collectiblelist); i++)
{
    var b = ds_list_find_value(collectiblelist, i)
    pal_swap_set(spr_candy_pal, pal_index, 0)
    draw_sprite_ext(b.sprite_index, b.image_index, b.x, b.y, 1, 1, 0, c_white, b.image_alpha)
    pal_swap_reset()
}
