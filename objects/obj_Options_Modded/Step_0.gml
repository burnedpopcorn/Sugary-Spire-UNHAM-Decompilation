if canmove
{
    scr_getinput()
    var b = 3
    var b2 = 6
    if global.sigma
    {
        b = 2
        b2 = 7
    }
    ScrollY = lerp(ScrollY, (optionselected / b * -100), 0.15)
    if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
    {
        optionselected--
        scr_sound(sound_step)
    }
    if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < b2)
    {
        optionselected++
        scr_sound(sound_step)
    }
    switch optionselected
    {
        case modded_selected.back:
            subtitle = "GO BACK TO MAIN SCREEN"
            CursorY = -999
            if key_jump
            {
                scr_sound(sound_enemythrow)
                self.scr_savesettings()
                instance_destroy()
            }
            break
        case modded_selected.theme:
            subtitle = "CHANGE PIZZANO ENTRANCE THEME"
            CursorY = 100 + ScrollY
            optionsaved_entrancetheme += (key_right2 + key_left2)
            optionsaved_entrancetheme = wrap(optionsaved_entrancetheme, 0, 1)
            break
        case modded_selected.laps:
            subtitle = "CHANGE HOW LAPS WORK"
            CursorY = 200 + ScrollY
            optionsaved_lappingsys += (key_right2 + key_left2)
            optionsaved_lappingsys = wrap(optionsaved_lappingsys, 0, 1)
            break
        case modded_selected.heat:
            subtitle = "DISABLE OR ENABLE HEATMETER"
            CursorY = 300 + ScrollY
            optionsaved_heatmeter += (key_right2 + key_left2)
            optionsaved_heatmeter = wrap(optionsaved_heatmeter, 0, 1)
            break
        case modded_selected.backgrounds:
            subtitle = "CHANGES BACKGROUNDS AND TILESETS TO NEW ONES"
            CursorY = 400 + ScrollY
            optionsaved_lvldesign += (key_right2 + key_left2)
            optionsaved_lvldesign = wrap(optionsaved_lvldesign, 0, 1)
            break
        case modded_selected.gamefreeze:
            subtitle = "GAME FREEZES WHEN KILLING AN ENEMY"
            CursorY = 500 + ScrollY
            optionsaved_hitstun += (key_right2 + key_left2)
            optionsaved_hitstun = wrap(optionsaved_hitstun, 0, 1)
            break
        case modded_selected.dark:
            subtitle = "EVERYTHING GOES DARK IN 3 SECTION OF SUGARSHACK MINES"
            CursorY = 600 + ScrollY
            optionsaved_darkmines += (key_right2 + key_left2)
            optionsaved_darkmines = wrap(optionsaved_darkmines, 0, 1)
            break
        case modded_selected.noclip:
            subtitle = "USE NOCLIP SPRITE AS MAIN SPRITE"
            CursorY = 700 + ScrollY
            optionsaved_realsigma += (key_right2 + key_left2)
            optionsaved_realsigma = wrap(optionsaved_realsigma, 0, 1)
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
