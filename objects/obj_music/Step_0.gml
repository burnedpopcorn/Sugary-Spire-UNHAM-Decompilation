pausedmusic = global.music
if (global.panic && (!obj_pause.pause) && room != timesuproom)
{
    if (global.lapcount == 0)
    {
        if (obj_player.character == "N")
        {
            if (!audio_is_playing(mu_pizzano_escape))
            {
                audio_stop_all_music()
                scr_music(mu_pizzano_escape)
                pausedmusic = mu_pizzano_escape
            }
        }
        else if (!audio_is_playing(mu_escape))
        {
            audio_stop_all_music()
            scr_music(mu_escape)
            pausedmusic = mu_escape
        }
    }
    else if (global.lapcount >= 1 && global.lappingsys == 0)
    {
        if (obj_player.character == "N")
        {
            if (!audio_is_playing(mu_lap2Pizzano))
            {
                audio_stop_all_music()
                scr_music(mu_lap2Pizzano)
                pausedmusic = mu_lap2Pizzano
            }
        }
        else if (!audio_is_playing(mu_laplap))
        {
            audio_stop_all_music()
            scr_music(mu_laplap)
            pausedmusic = mu_laplap
        }
    }
    else if (global.lapcount == 1 && global.lappingsys == 1)
    {
        if (obj_player.character == "N")
        {
            if (!audio_is_playing(mu_lap2Pizzano))
            {
                audio_stop_all_music()
                scr_music(mu_lap2Pizzano)
                pausedmusic = mu_lap2Pizzano
            }
        }
        else if (!audio_is_playing(mu_laplap))
        {
            audio_stop_all_music()
            scr_music(mu_laplap)
            pausedmusic = mu_laplap
        }
    }
    else if (global.lapcount > 1 && global.lappingsys == 1)
    {
        if (!audio_is_playing(mu_lap3))
        {
            audio_stop_all_music()
            scr_music(mu_lap3)
            pausedmusic = mu_lap3
        }
    }
}
else if ((!global.panic) && room == timesuproom)
    audio_stop_sound(global.music)
if (room != hub_room1 && room != outer_room2 && room != hub_start && room != hub_hall && room != hub_new && room != hub_bikinibottomtest)
    fadeoff = audio_sound_get_track_position(global.music) / audio_sound_length(global.music)
else
    fadeoff = 0
if (room == outer_room1 && (audio_is_playing(mu_void) || audio_is_playing(spireintroN)))
{
    if (voidmusvolume > 0)
    {
        voidmusvolume = lerp(voidmusvolume, 0, 0.03)
        audio_sound_gain(mu_void, (global.musicVolume * voidmusvolume), 0)
        audio_sound_gain(spireintroN, (global.musicVolume * voidmusvolume), 0)
    }
}
