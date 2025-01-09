shader_set(shd_mines);
var colorblend1 = shader_get_uniform(shd_mines, "blendcolor1");
shader_set_uniform_f(colorblend1, 0.8901960784313725, 0.19215686274509805, 0);
var colorblend2 = shader_get_uniform(shd_mines, "blendcolor2");
shader_set_uniform_f(colorblend2, 0.8901960784313725, 0.19215686274509805, 0);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
shader_reset();
