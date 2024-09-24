image_alpha = 0
savedx = x
savedy = y
savedcx = camera_get_view_x(view_camera[0])
savedcy = camera_get_view_y(view_camera[0])
if instance_exists(obj_player)
{
    x = obj_player.x
    y = obj_player.y
}
if instance_exists(obj_lapportalentrance)
{
    x = obj_lapportalentrance.x
    y = obj_lapportalentrance.y
}
if (room == room_treasure)
{
    if (x != -10000 && y != -10000)
    {
        x = -10000
        y = -10000
    }
}
if (room == rank_room || room == timesuproom)
    instance_destroy()
