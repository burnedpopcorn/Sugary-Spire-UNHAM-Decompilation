bgx++
bgy++
if (selected == 0)
{
    scr_getinput()
    if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
    {
        optionselected -= 1
        scr_sound(sound_step)
    }
    if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 4)
    {
        optionselected += 1
        scr_sound(sound_step)
    }
    switch optionselected
    {
        case option_selected.back:
            subtitle = "GO BACK TO MAIN SCREEN"
            CursorY = -999
            if key_jump
            {
                scr_sound(sound_enemythrow)
                instance_destroy()
                if optionchanged
                {
                    if (!instance_exists(obj_saveicon))
                        instance_create_depth(0, 0, -1000, obj_saveicon)
                    else
                    {
                        with (obj_saveicon)
                            finishbuffer = 200
                    }
                }
            }
            break
        case option_selected.audio:
            subtitle = "ADJUST AUDIO SETTINGS"
            CursorY = 100
            if key_jump
            {
                scr_sound(sound_enemythrow)
                selected = true
                instance_create(0, 0, obj_Options_Audio)
            }
            break
        case option_selected.video:
            subtitle = "ADJUST VIDEO SETTINGS"
            CursorY = 200
            if key_jump
            {
                scr_sound(sound_enemythrow)
                selected = true
                instance_create(0, 0, obj_Options_Video)
            }
            break
        case option_selected.input:
            subtitle = "CHANGE CONTROL INPUTS"
            CursorY = 300
            if key_jump
            {
                scr_sound(sound_enemythrow)
                selected = true
                instance_create(0, 0, obj_Options_Input)
            }
            break
        case option_selected.misc:
            subtitle = string_upper("Change this Mod's Settings")
            CursorY = 400
            if key_jump
            {
                scr_sound(sound_enemythrow)
                selected = true
                instance_create(0, 0, obj_Options_Modded)
                global.shake_in_options = 0
            }
            break
    }

    if (key_slap2 || (key_start2 && escape_buffer == 0))
    {
        scr_sound(sound_enemythrow)
        instance_destroy()
        if optionchanged
        {
            if (!instance_exists(obj_saveicon))
                instance_create_depth(0, 0, -1000, obj_saveicon)
            else
            {
                with (obj_saveicon)
                    finishbuffer = 200
            }
        }
    }
}
if (escape_buffer > 0)
    escape_buffer--
if ((!global.sigma) || global.shake_in_options == 0)
    moddedshake = 0
else
    moddedshake = 1
