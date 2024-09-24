if canmove
{
    scr_getinput()
    ScrollY = lerp(ScrollY, (optionselected / 2 * -100), 0.15)
    if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
    {
        optionselected--
        scr_sound(sound_step)
        optionsaved_fullscreen = global.fullscreen
        optionsaved_resolution = global.selectedResolution
    }
    if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 7)
    {
        optionselected++
        scr_sound(sound_step)
        optionsaved_fullscreen = global.fullscreen
        optionsaved_resolution = global.selectedResolution
    }
    switch optionselected
    {
        case video_selected.back:
            subtitle = "GO BACK TO MAIN SCREEN"
            CursorY = -999
            if key_jump
            {
                scr_sound(sound_enemythrow)
                self.scr_savesettings()
                instance_destroy()
            }
            break
        case video_selected.fullscreen:
            subtitle = "TOGGLE WINDOW MODE"
            CursorY = 100 + ScrollY
            optionsaved_fullscreen += (key_right2 + key_left2)
            optionsaved_fullscreen = wrap(optionsaved_fullscreen, 0, 1)
            if key_jump
            {
                scr_sound(sound_enemythrow)
                window_set_fullscreen(optionsaved_fullscreen)
                ini_open("optionData.ini")
                ini_write_real("Settings", "fullscrn", optionsaved_fullscreen)
                ini_close()
                if (global.fullscreen != optionsaved_fullscreen)
                {
                    if (!instance_exists(obj_saveicon))
                        instance_create_depth(0, 0, -1000, obj_saveicon)
                    else
                    {
                        with (obj_saveicon)
                            finishbuffer = 200
                    }
                }
                global.fullscreen = optionsaved_fullscreen
            }
            break
        case video_selected.resolution:
            subtitle = "ADJUST WINDOWED RESOLUTION"
            CursorY = 200 + ScrollY
            optionsaved_resolution += (key_right2 + key_left2)
            optionsaved_resolution = wrap(optionsaved_resolution, 0, 2)
            if key_jump
            {
                scr_sound(sound_enemythrow)
                switch optionsaved_resolution
                {
                    case 0:
                        window_set_size(480, 260)
                        break
                    case 1:
                        window_set_size(960, 540)
                        break
                    case 2:
                        window_set_size(1280, 720)
                        break
                }

                ini_open("optionData.ini")
                ini_write_real("Settings", "resolution", optionsaved_resolution)
                ini_close()
                if (global.selectedResolution != optionsaved_resolution)
                {
                    if (!instance_exists(obj_saveicon))
                        instance_create_depth(0, 0, -1000, obj_saveicon)
                    else
                    {
                        with (obj_saveicon)
                            finishbuffer = 200
                    }
                }
                global.selectedResolution = optionsaved_resolution
            }
            break
        case video_selected.smoothcam:
            subtitle = "TOGGLE SMOOTHCAM"
            CursorY = 300 + ScrollY
            optionsaved_smoothcam += (key_right2 + key_left2)
            optionsaved_smoothcam = wrap(optionsaved_smoothcam, 0, 1)
            break
        case video_selected.screentilt:
            subtitle = "TOGGLE ESCAPE SCREEN TILT EFFECTS"
            CursorY = 400 + ScrollY
            optionsaved_screentilt += (key_right2 + key_left2)
            optionsaved_screentilt = wrap(optionsaved_screentilt, 0, 1)
            break
        case video_selected.hud:
            subtitle = "TOGGLE HUD VISIBLE"
            CursorY = 500 + ScrollY
            optionsaved_showhud += (key_right2 + key_left2)
            optionsaved_showhud = wrap(optionsaved_showhud, 0, 1)
            break
        case video_selected.timer:
            subtitle = "TOGGLE TIMER"
            CursorY = 600 + ScrollY
            optionsaved_timer += (key_right2 + key_left2)
            optionsaved_timer = wrap(optionsaved_timer, 0, 1)
            break
        case video_selected.timertype:
            subtitle = "TOGGLE TIMER TYPE"
            CursorY = 700 + ScrollY
            optionsaved_timertype += (key_right2 + key_left2)
            optionsaved_timertype = wrap(optionsaved_timertype, 0, 2)
            trace("Timer Type: " + string(global.timertype))
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
