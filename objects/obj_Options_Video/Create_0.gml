enum video_selected
{
	back,
	fullscreen,
	resolution,
	smoothcam,
	screentilt,
	hud,
	timer,
	timertype
};
optionselected = video_selected.back
ini_open("optionData.ini")
global.fullscreen = ini_read_real("Settings", "fullscrn", 0)
global.selectedResolution = ini_read_real("Settings", "resolution", 1)
global.smoothcam = ini_read_real("Settings", "smthcam", 1)
global.hitstunEnabled = ini_read_real("Settings", "hitstun", 1)
global.screentilt = ini_read_real("Settings", "scrntilt", 1)
global.playerrotate = ini_read_real("Settings", "playrot", 1)
global.showhud = ini_read_real("Settings", "showhud", 1)
global.timer = ini_read_real("Settings", "timer", 1)
global.timertype = ini_read_real("Settings", "timertype", 0)
ini_close()
optionsaved_fullscreen = global.fullscreen
optionsaved_resolution = global.selectedResolution
optionsaved_smoothcam = global.smoothcam
optionsaved_screentilt = global.screentilt
optionsaved_hitstun = global.hitstunEnabled
optionsaved_showhud = global.showhud
optionsaved_timer = global.timer
optionsaved_timertype = global.timertype
subtitle = "GO BACK TO MAIN SCREEN"
CursorY = -999
depth = -100
selecting = -1
obj_Options_Main.CursorY = -999
canmove = false
alarm[0] = 1
ScrollY = 0
//function anon@1309@gml_Object_obj_Options_Video_Create_0() //anon@1309@gml_Object_obj_Options_Video_Create_0
function scr_savesettings()
{
    ini_open("optionData.ini")
    if ((global.smoothcam != optionsaved_smoothcam || global.smoothcam != optionsaved_smoothcam || optionsaved_timer != global.timer || optionsaved_timertype != global.timertype) && instance_exists(obj_Options_Main))
        obj_Options_Main.optionchanged = true
    ini_write_real("Settings", "smthcam", optionsaved_smoothcam)
    global.smoothcam = optionsaved_smoothcam
    ini_write_real("Settings", "scrntilt", optionsaved_screentilt)
    global.smoothcam = optionsaved_smoothcam
    ini_write_real("Settings", "showhud", optionsaved_showhud)
    global.showhud = optionsaved_showhud
    ini_write_real("Settings", "timer", optionsaved_timer)
    global.timer = optionsaved_timer
    ini_write_real("Settings", "timertype", optionsaved_timertype)
    global.timertype = optionsaved_timertype
    ini_close()
}

