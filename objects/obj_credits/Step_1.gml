var oldscenebackground = scenebackground
if (audio_sound_get_track_position(global.music) < 21.5)
{
    scenebackground = bg_thumbnail_entryway
    DrawHspeed = 0.5
    DrawVspeed = 0
}
else if (audio_sound_get_track_position(global.music) < 43.2)
{
    scenebackground = bg_thumbnail_steamy
    DrawHspeed = 0.5
    DrawVspeed = 0.5
}
else if (audio_sound_get_track_position(global.music) < 64.78)
{
    scenebackground = bg_thumbnail_molasses
    DrawHspeed = 0
    DrawVspeed = -0.5
}
else if (audio_sound_get_track_position(global.music) < 107.94)
{
    scenebackground = bg_thumbnail_mines
    DrawHspeed = 0
    DrawVspeed = 1
}
else
{
    scenebackground = bg_thumbnail_cone
    DrawHspeed = 1
    DrawVspeed = 1
}
if (oldscenebackground != scenebackground)
{
    flash = true
    alarm[0] = 0.15 * room_speed
    DrawX = 0
    DrawY = 0
    if (scenebackground == bg_thumbnail_entryway)
    {
        y = ystart
        vspeed = 0
        can_goUp = true
    }
}
