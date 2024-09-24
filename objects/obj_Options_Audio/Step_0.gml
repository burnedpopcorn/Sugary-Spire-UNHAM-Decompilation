if canmove
{
    scr_getinput()
    if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
    {
        optionselected--
        scr_sound(sound_step)
    }
    if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 3)
    {
        optionselected++
        scr_sound(sound_step)
    }
    switch optionselected
    {
        case audio_selected.back:
            subtitle = "GO BACK TO MAIN SCREEN"
            CursorY = -999
            if key_jump
            {
                scr_sound(sound_enemythrow)
                self.scr_savesettings()
                instance_destroy()
            }
            break
        case audio_selected.master:
            subtitle = "ADJUST MASTER VOLUME"
            CursorY = 100
            optionsaved_masterVolume += ((key_right + key_left) / (key_attack ? 200 : 400))
            optionsaved_masterVolume = clamp(optionsaved_masterVolume, 0, 1)
            audio_master_gain(optionsaved_masterVolume)
            if (global.masterVolume != optionsaved_masterVolume)
                global.masterVolume = optionsaved_masterVolume
            break
        case audio_selected.music:
            subtitle = "ADJUST MUSIC VOLUME"
            CursorY = 200
            optionsaved_musicVolume += ((key_right + key_left) / (key_attack ? 200 : 400))
            optionsaved_musicVolume = clamp(optionsaved_musicVolume, 0, 1)
            audio_sound_gain(global.music, optionsaved_musicVolume, 0)
            audio_sound_gain(obj_Options_Main.PauseMusic, optionsaved_musicVolume, 0)
            if (global.musicVolume != optionsaved_musicVolume)
                global.musicVolume = optionsaved_musicVolume
            break
        case audio_selected.sfx:
            subtitle = "ADJUST SOUNDEFFECTS VOLUME"
            CursorY = 300
            optionsaved_soundVolume += ((key_right + key_left) / (key_attack ? 200 : 400))
            optionsaved_soundVolume = clamp(optionsaved_soundVolume, 0, 1)
            if ((key_right + key_left) != 0 && (!audio_is_playing(sound_combo1)))
                audio_sound_gain(audio_play_sound(sound_step2, 1, false), optionsaved_soundVolume, 0)
            if (global.soundVolume != optionsaved_soundVolume)
                global.soundVolume = optionsaved_soundVolume
            break
    }

    if (key_slap2 || key_start)
    {
        scr_sound(sound_enemythrow)
        self.scr_savesettings()
        instance_destroy()
    }
    obj_Options_Main.CursorY = CursorY
}
