if (!obj_player.supertauntcharged)
    instance_destroy()
with (obj_baddie)
{
    if (point_in_camera(x, y, view_camera[0]) && sprite_index != spr_charcherry_wait)
    {
        camera_shake(10, 30)
        instance_destroy()
    }
}
