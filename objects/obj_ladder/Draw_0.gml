if ((room == mines_11 || room == mines_12) && global.darkmines)
{
    shader_set(shd_mines)
    var colorblend1 = shader_get_uniform(shd_mines, "blendcolor1")
    shader_set_uniform_f(colorblend1, 0, 0, 0)
    var colorblend2 = shader_get_uniform(shd_mines, "blendcolor2")
    shader_set_uniform_f(colorblend2, 0.08627450980392157, 0.23529411764705882, 0.4666666666666667)
}
for (var i = 0; i < (image_yscale - 1); i++)
    draw_sprite_ext(spr_ladder, 0, x, (y + i * 32), image_xscale, 1, 0, c_white, 1)
var end_ladder = ((!(place_meeting(x, (y + 1), obj_ladder))) ? spr_ladderend : spr_ladder)
draw_sprite_ext(end_ladder, 0, x, (y + (image_yscale - 1) * 32), image_xscale, 1, 0, c_white, 1)
if ((room == mines_11 || room == mines_12) && global.darkmines)
    shader_reset()
