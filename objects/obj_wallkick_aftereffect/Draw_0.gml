shader_set(shd_afterimage);
var colorblend1 = shader_get_uniform(shd_afterimage, "blendcolor1");
shader_set_uniform_f(colorblend1, realcol.r / 255, realcol.g / 255, realcol.b / 255);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, draw_angle, c_white, gonealpha * image_alpha);
shader_reset();
