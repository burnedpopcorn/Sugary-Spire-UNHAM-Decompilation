scr_getinput()
if (musicbuffer > 0)
    musicbuffer--
if (!finish)
{
    darkalpha = approach(darkalpha, 0.6, 0.1)
    drawy = lerp(drawy, 270, 0.2)
    if (drawy >= 180)
    {
        var move = key_left2 + key_right2
        if (move != 0)
        {
            selected += move
            selected = clamp(selected, 0, 1)
            if (move == -1 && (!selected) && (!audio_is_playing(mu_oldlevel)))
                scr_sound(mu_tooldlevel)
            if (move == 1 && selected && (!audio_is_playing(mu_newlevel)))
                scr_sound(mu_tonewlevel)
        }
        if (!selected)
        {
            audio_stop_sound(mu_newlevel)
            if (!audio_is_playing(mu_tooldlevel))
            {
                if (!audio_is_playing(mu_oldlevel))
                    scr_music(mu_oldlevel)
            }
        }
        if selected
        {
            audio_stop_sound(mu_oldlevel)
            if (!audio_is_playing(mu_tonewlevel))
            {
                if (!audio_is_playing(mu_newlevel))
                    scr_music(mu_newlevel)
            }
        }
        if (prevselected != selected)
        {
            prevselected = selected
            scr_sound(sound_step)
        }
        if (key_jump || keyboard_check_direct(vk_return))
        {
            global.layout = selected
            finish = 1
            scr_sound(sound_enemythrow)
            obj_startgate.start = true
            var type = "Old"
            if global.layout
                type = "New"
            trace(type + " Level Layout Chosed!")
        }
    }
}
else
{
    darkalpha = approach(darkalpha, 0, 0.07)
    iconalpha = approach(iconalpha, 0, 0.15)
    if (iconalpha == 0)
    {
        instance_destroy()
        audio_stop_sound(mu_oldlevel)
        audio_stop_sound(mu_tooldlevel)
        audio_stop_sound(mu_newlevel)
        audio_stop_sound(mu_tonewlevel)
    }
}
