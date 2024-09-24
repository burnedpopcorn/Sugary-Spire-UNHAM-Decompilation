if (sprite_index == spr_confectiboxopen && animation_end())
    instance_destroy()
if bbox_in_camera(view_camera[0])
{
    if (image_index >= 14)
    {
        if (!audio_is_playing(toppinhelp))
            scr_sound(toppinhelp)
    }
}
