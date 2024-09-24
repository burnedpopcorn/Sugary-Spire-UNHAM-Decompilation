draw_sprite_ext(sprite_index, image_index, (x + (irandom_range((-ShakeBuffer), ShakeBuffer))), (y + (irandom_range((-ShakeBuffer), ShakeBuffer))), image_xscale, image_yscale, image_angle, image_blend, image_alpha)
if ((room == mines_11 || room == mines_12) && global.darkmines)
{
    shader_set(shd_mines)
    var colorblend1 = shader_get_uniform(shd_mines, "blendcolor1")
    shader_set_uniform_f(colorblend1, 0, 0, 0)
    var colorblend2 = shader_get_uniform(shd_mines, "blendcolor2")
    shader_set_uniform_f(colorblend2, 0.08627450980392157, 0.23529411764705882, 0.4666666666666667)
    draw_sprite_ext(sprite_index, image_index, (x + (irandom_range((-ShakeBuffer), ShakeBuffer))), (y + (irandom_range((-ShakeBuffer), ShakeBuffer))), image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    shader_reset()
}
