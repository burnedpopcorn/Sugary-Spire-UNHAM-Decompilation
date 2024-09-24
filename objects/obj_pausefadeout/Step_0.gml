if (fadealpha > 1 && (!fadein))
{
    if obj_pause.pause
    {
        obj_pause.pause = false
        global.gamepaused = 0
        instance_activate_all()
        audio_resume_all()
        audio_stop_sound(mu_pause)
        audio_stop_sound(mu_pizzano_pause)
    }
    else if (!obj_pause.pause)
    {
        audio_pause_all()
        obj_pause.pause = true
        global.gamepaused = 1
        instance_deactivate_all(true)
        instance_activate_object(obj_pause)
        instance_activate_object(obj_rpc)
        scr_sound(scratch)
        if (obj_player.character == "N")
            audio_play_sound(mu_pizzano_pause, 1, true)
        else
            audio_play_sound(mu_pause, 1, true)
    }
    fadein = true
}
if (!fadein)
    fadealpha += 1.1
else if fadein
    fadealpha -= 1.1
if (fadein && fadealpha < 0)
    instance_destroy()
