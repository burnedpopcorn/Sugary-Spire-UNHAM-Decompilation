var cam_x = camera_get_view_x(view_camera[0])
var cam_y = camera_get_view_y(view_camera[0])
var cam_w = camera_get_view_width(view_camera[0])
var cam_h = camera_get_view_height(view_camera[0])
var cx = (cam_x + cam_w - 960) / 2
var cy = (cam_y + cam_h - 540) / 2
if use_static
    draw_sprite(spr_tvstatic1204, static_index, 0, 0)
else
{
    pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0)
    draw_sprite(sprite, 0, 0, 0)
    shader_reset()
}
