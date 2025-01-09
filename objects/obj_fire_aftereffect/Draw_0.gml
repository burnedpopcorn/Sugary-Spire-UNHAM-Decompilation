shader_set(shd_mines);
var colorblend1 = shader_get_uniform(shd_mines, "blendcolor1");
shader_set_uniform_f(colorblend1, 0.9725490196078431, 0.4392156862745098, 0.09411764705882353);
var colorblend2 = shader_get_uniform(shd_mines, "blendcolor2");
shader_set_uniform_f(colorblend2, 0.9725490196078431, 0.4392156862745098, 0.09411764705882353);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
shader_reset();
