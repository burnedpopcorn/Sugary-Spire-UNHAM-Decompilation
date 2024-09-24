enum modded_selected
{
	back,
	theme,
	laps,
	heat,
	backgrounds,
	gamefreeze,
	dark,
	noclip
}
optionselected = modded_selected.back
ini_open("optionData.ini")
global.entrancetheme = ini_read_real("Settings", "enttheme", 0)
global.lappingsys = ini_read_real("Settings", "lapping", 0)
global.heatmeter = ini_read_real("Settings", "heatmeter", 1)
global.lvldesign = ini_read_real("Settings", "lvldesign", 0)
global.hitstun = ini_read_real("Settings", "hitstun", 1)
global.darkmines = ini_read_real("Settings", "darkmines", 0)
ini_close()
optionsaved_entrancetheme = global.entrancetheme
optionsaved_lappingsys = global.lappingsys
optionsaved_heatmeter = global.heatmeter
optionsaved_lvldesign = global.lvldesign
optionsaved_hitstun = global.hitstun
optionsaved_darkmines = global.darkmines
optionsaved_realsigma = global.realsigma
subtitle = "GO BACK TO MAIN SCREEN"
CursorY = -999
depth = -100
selecting = -1
ScrollY = 0
obj_Options_Main.CursorY = -999
canmove = false
alarm[0] = 1
global.shake_in_options = 1
//function anon@1190@gml_Object_obj_Options_Modded_Create_0() //anon@1190@gml_Object_obj_Options_Modded_Create_0
function scr_savesettings()
{
    ini_open("optionData.ini")
    if ((global.entrancetheme != optionsaved_entrancetheme || global.entrancetheme != optionsaved_entrancetheme || global.heatmeter != optionsaved_heatmeter || global.hitstun != optionsaved_hitstun) && instance_exists(obj_Options_Main))
        obj_Options_Main.optionchanged = true
    ini_write_real("Settings", "enttheme", optionsaved_entrancetheme)
    global.entrancetheme = optionsaved_entrancetheme
    if (room == hub_room1 || room == rm_credits || room == outer_room1 || room == outer_room2 || room == tutorial_1 || room == tutorial_2 || room == tutorial_3 || room == tutorial_4 || room == tutorial_5 || room == tutorial_6 || room == tutorial_7 || room == tutorial_8 || room == tutorial_9 || room == tutorial_10 || room == secrets_await || room == realtitlescreen || room == hub_new || room == hub_start || room == hub_hall || room == hub_bikinibottom)
    {
        if ((global.lappingsys != optionsaved_lappingsys || global.lvldesign != optionsaved_lvldesign || global.darkmines != optionsaved_darkmines) && instance_exists(obj_Options_Main))
            obj_Options_Main.optionchanged = true
        ini_write_real("Settings", "lapping", optionsaved_lappingsys)
        global.lappingsys = optionsaved_lappingsys
        ini_write_real("Settings", "lvldesign", optionsaved_lvldesign)
        global.lvldesign = optionsaved_lvldesign
        ini_write_real("Settings", "darkmines", optionsaved_darkmines)
        global.darkmines = optionsaved_darkmines
    }
    ini_write_real("Settings", "heatmeter", optionsaved_heatmeter)
    global.heatmeter = optionsaved_heatmeter
    ini_write_real("Settings", "hitstun", optionsaved_hitstun)
    global.hitstun = optionsaved_hitstun
    if global.sigma
        global.realsigma = optionsaved_realsigma
    ini_close()
}

