if (showtext == true)
    newdraw_y = approach(newdraw_y, 500, 5)
if (showtext == false)
    newdraw_y = approach(newdraw_y, 600, 1)
if instance_exists(obj_player)
{
    if (obj_player.y > (480 + obj_camera.Cam_y) && obj_player.x < (obj_camera.Cam_x + 90))
        alpha = 0.5
    else
        alpha = 1
}
if global.showhud
    visible = 1
else
    visible = 0
