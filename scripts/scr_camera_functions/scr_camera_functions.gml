function point_in_camera(argument0, argument1, argument2) //point_in_camera
{
    var cam_x = camera_get_view_x(argument2)
    var cam_y = camera_get_view_y(argument2)
    var cam_w = camera_get_view_width(argument2)
    var cam_h = camera_get_view_height(argument2)
    return point_in_rectangle(argument0, argument1, cam_x, cam_y, (cam_x + cam_w), (cam_y + cam_h));
}

function bbox_in_camera(argument0) //bbox_in_camera
{
    cam_x = camera_get_view_x(argument0)
    cam_y = camera_get_view_y(argument0)
    cam_w = camera_get_view_width(argument0)
    cam_h = camera_get_view_height(argument0)
    return rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, cam_x, cam_y, (cam_x + cam_w), (cam_y + cam_h));
}

function camera_shake(argument0, argument1) //camera_shake
{
    with (obj_camera)
    {
        shake_mag = argument0
        shake_mag_acc = argument1 / room_speed
    }
    return true;
}

function camera_get_position_struct(argument0) constructor //camera_get_position_struct
{
    var _cam_x = camera_get_view_x(argument0)
    var _cam_y = camera_get_view_y(argument0)
    cam_x = _cam_x
    cam_y = _cam_y
    centeredcam_x = cam_x + 480
    centeredcam_y = cam_y + 270
}

