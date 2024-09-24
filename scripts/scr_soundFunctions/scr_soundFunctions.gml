function scr_sound() //scr_sound
{
    var snd = audio_play_sound(argument[irandom(argument_count - 1)], 1, false)
    audio_sound_gain(snd, global.soundVolume, 0)
    return snd;
}

function scr_music(argument0, argument1, argument2) //scr_music
{
    if (argument1 == undefined)
        argument1 = 0
    if (argument2 == undefined)
        argument2 = undefined
    var _als = instance_create(0, 0, obj_musicLoopManager)
    global.music = audio_play_sound(argument0, 10, true)
    audio_sound_gain(global.music, global.musicVolume, 0)
    with (_als)
    {
        Audio = global.music
        LoopBegin = argument1
        LoopEnd = argument2
    }
    return global.music;
}

function scr_soundloop(argument0, argument1, argument2) //scr_soundloop
{
    if (argument1 == undefined)
        argument1 = 0
    if (argument2 == undefined)
        argument2 = undefined
    _als = instance_create(0, 0, obj_musicLoopManager)
    var _music = audio_play_sound(argument0, 10, true)
    audio_sound_gain(_music, global.musicVolume, 0)
    with (_als)
    {
        Audio = _music
        LoopBegin = argument1
        LoopEnd = argument2
    }
    return _music;
}

function audio_stop_all_music() //audio_stop_all_music
{
    audio_stop_sound(global.music)
    audio_stop_sound(global.harrymusic)
}

