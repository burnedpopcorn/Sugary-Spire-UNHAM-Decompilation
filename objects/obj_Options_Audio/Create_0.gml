enum audio_selected
{
	back,
	master,
	music,
	sfx
}
ini_open("optionData.ini")
global.musicVolume = ini_read_real("Settings", "musicvol", 1)
global.soundVolume = ini_read_real("Settings", "soundvol", 1)
global.masterVolume = ini_read_real("Settings", "mastervol", 1)
ini_close()
optionsaved_masterVolume = global.masterVolume
optionsaved_musicVolume = global.musicVolume
optionsaved_soundVolume = global.soundVolume
subtitle = "GO BACK TO MAIN SCREEN"
CursorY = -999
depth = -100
selecting = -1
optionselected = audio_selected.back
obj_Options_Main.CursorY = -999
canmove = false
alarm[0] = 1
//function anon@652@gml_Object_obj_Options_Audio_Create_0() //anon@652@gml_Object_obj_Options_Audio_Create_0
function scr_savesettings()
{
    ini_open("optionData.ini")
    if ((global.masterVolume == optionsaved_masterVolume || global.musicVolume == optionsaved_musicVolume || global.soundVolume == optionsaved_soundVolume) && instance_exists(obj_Options_Main))
        obj_Options_Main.optionchanged = 1
    ini_write_real("Settings", "mastervol", optionsaved_masterVolume)
    global.masterVolume = optionsaved_masterVolume
    audio_master_gain(global.masterVolume)
    ini_write_real("Settings", "musicvol", optionsaved_musicVolume)
    global.musicVolume = optionsaved_musicVolume
    audio_sound_gain(global.music, global.musicVolume, 0)
    audio_sound_gain(obj_Options_Main.PauseMusic, global.musicVolume, 0)
    ini_write_real("Settings", "soundvol", optionsaved_soundVolume)
    global.soundVolume = optionsaved_soundVolume
    ini_close()
}

