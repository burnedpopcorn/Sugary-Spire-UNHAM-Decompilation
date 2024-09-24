if (!global.panic)
{
    var roomname = room_get_name(room)
    if (room == rm_missing || room == spireintro || room == outer_room1)
    {
        if ((!audio_is_playing(mu_void)) && (!audio_is_playing(spireintroN)))
        {
            audio_stop_all_music()
            if (obj_player.character == "N")
            {
                scr_music(spireintroN)
                pausedmusic = spireintroN
            }
            else
            {
                scr_music(mu_void)
                pausedmusic = mu_void
            }
        }
    }
    if (room == realtitlescreen)
    {
        if (!audio_is_playing(mu_title))
        {
            audio_stop_all_music()
            scr_music(mu_title)
            pausedmusic = mu_title
        }
    }
    if (room == rm_credits)
    {
        if (!audio_is_playing(mu_credits))
        {
            audio_stop_all_music()
            scr_music(mu_credits)
            pausedmusic = mu_credits
        }
    }
    if (string_letters(roomname) == "hubroom" || string_letters(roomname) == "hubpublic" || room == secrets_await || string_letters(roomname) == "hub_" || room == hub_new || room == hub_start)
    {
        if (!audio_is_playing(mu_hub))
        {
            audio_stop_all_music()
            scr_music(mu_hub)
            pausedmusic = mu_hub
        }
    }
    if (room == hub_bikinibottomtest)
    {
        if (!audio_is_playing(mu_bikinibottom))
        {
            audio_stop_all_music()
            scr_music(mu_bikinibottom)
            pausedmusic = mu_bikinibottom
        }
    }
    if ((string_letters(roomname) == "entryway" || string_letters(roomname) == "entrywaynew") && obj_player.character == "P")
    {
        if (!audio_is_playing(mu_waffle))
        {
            audio_stop_all_music()
            scr_music(mu_waffle)
            pausedmusic = mu_waffle
            audio_sound_set_track_position(global.music, (fadeoff * audio_sound_length(global.music)))
        }
    }
    if ((string_letters(roomname) == "entryway" || string_letters(roomname) == "entrywaynew") && obj_player.character == "N")
    {
        if (global.entrancetheme == 0)
        {
            if (!audio_is_playing(mu_pizzanothemetune))
            {
                audio_stop_all_music()
                scr_music(mu_pizzanothemetune)
                pausedmusic = mu_pizzanothemetune
                audio_sound_set_track_position(global.music, (fadeoff * audio_sound_length(global.music)))
            }
        }
        else if (!audio_is_playing(mu_pizzano_entrancenew))
        {
            audio_stop_all_music()
            scr_music(mu_pizzano_entrancenew)
            pausedmusic = mu_pizzano_entrancenew
            audio_sound_set_track_position(global.music, (fadeoff * audio_sound_length(global.music)))
        }
    }
    if (string_letters(roomname) == "entrywaysecret" && obj_player.character == "P")
    {
        if (!audio_is_playing(mu_wafflesecret))
        {
            audio_stop_all_music()
            scr_music(mu_wafflesecret)
            pausedmusic = mu_wafflesecret
            audio_sound_set_track_position(global.music, (fadeoff * audio_sound_length(global.music)))
        }
    }
    if (string_letters(roomname) == "entrywaysecret" && obj_player.character == "N")
    {
        if (!audio_is_playing(mu_pizzano_secret))
        {
            audio_stop_all_music()
            scr_music(mu_pizzano_secret)
            pausedmusic = mu_pizzano_secret
            audio_sound_set_track_position(global.music, (fadeoff * audio_sound_length(global.music)))
        }
    }
    if (string_letters(roomname) == "tutorial")
    {
        if (!audio_is_playing(mu_tutorial))
        {
            audio_stop_all_music()
            scr_music(mu_tutorial)
            pausedmusic = mu_tutorial
            audio_sound_set_track_position(global.music, (fadeoff * audio_sound_length(global.music)))
        }
    }
    if (string_letters(roomname) == "molasses" || string_letters(roomname) == "molassesb" || string_letters(roomname) == "molassesc" || string_letters(roomname) == "molassesd")
    {
        for (i = 0; i < 20; i++)
        {
            if (roomname == ("molasses_" + string(i)) && i < 6)
            {
                if (!audio_is_playing(mu_swamp))
                {
                    audio_stop_all_music()
                    scr_music(mu_swamp)
                    pausedmusic = mu_swamp
                    audio_sound_set_track_position(global.music, (fadeoff * audio_sound_length(global.music)))
                }
            }
        }
        if ((roomname == ("molasses_" + string(i)) && i >= 6) || room == molasses_6b || room == molasses_6c || room == molasses_6d || room == molasses_8b || room == molasses_8)
        {
            if (!audio_is_playing(mu_swamp2))
            {
                audio_stop_all_music()
                scr_music(mu_swamp2)
                pausedmusic = mu_swamp2
                audio_sound_set_track_position(global.music, (fadeoff * audio_sound_length(global.music)))
            }
        }
    }
    if (string_letters(roomname) == "steamy")
    {
        for (i = 0; i < 20; i++)
        {
            if (roomname == ("steamy_" + string(i)) && i < 8)
            {
                if (!audio_is_playing(mu_steamy))
                {
                    audio_stop_all_music()
                    scr_music(mu_steamy)
                    pausedmusic = mu_steamy
                    audio_sound_set_track_position(global.music, (fadeoff * audio_sound_length(global.music)))
                }
            }
            if ((roomname == ("steamy_" + string(i)) && i >= 8) || room == steamy_11_1)
            {
                if (!audio_is_playing(mu_steamyinner))
                {
                    audio_stop_all_music()
                    scr_music(mu_steamyinner)
                    pausedmusic = mu_steamyinner
                    audio_sound_set_track_position(global.music, (fadeoff * audio_sound_length(global.music)))
                }
            }
        }
    }
    if (string_letters(roomname) == "steamysecret")
    {
        if (!audio_is_playing(mu_steamysecret))
        {
            audio_stop_all_music()
            scr_music(mu_steamysecret)
            pausedmusic = mu_steamysecret
            audio_sound_set_track_position(global.music, (fadeoff * audio_sound_length(global.music)))
        }
    }
    if (string_letters(roomname) == "molassessecret")
    {
        if (!audio_is_playing(mu_swampsecret))
        {
            audio_stop_all_music()
            scr_music(mu_swampsecret)
            pausedmusic = mu_swampsecret
            audio_sound_set_track_position(global.music, (fadeoff * audio_sound_length(global.music)))
        }
    }
    if (string_letters(roomname) == "devroom")
    {
        if (!audio_is_playing(mu_what))
        {
            audio_stop_all_music()
            scr_music(mu_what)
            pausedmusic = mu_what
            audio_sound_set_track_position(global.music, (fadeoff * audio_sound_length(global.music)))
        }
    }
    if (string_letters(roomname) == "mines")
    {
        switch global.minesProgress
        {
            case 0:
                if (!audio_is_playing(mu_mineshaft1))
                {
                    audio_stop_all_music()
                    scr_music(mu_mineshaft1)
                    pausedmusic = mu_mineshaft1
                    audio_sound_set_track_position(global.music, (fadeoff * audio_sound_length(global.music)))
                }
                break
            default:
                if (!audio_is_playing(mu_mineshaft2))
                {
                    audio_stop_all_music()
                    scr_music(mu_mineshaft2, 15.245)
                    pausedmusic = mu_mineshaft2
                    audio_sound_set_track_position(global.music, (fadeoff * audio_sound_length(global.music)))
                }
                break
        }

    }
    if (string_letters(roomname) == "minessecret")
    {
        if (!audio_is_playing(mu_minessecret))
        {
            audio_stop_all_music()
            scr_music(mu_minessecret)
            pausedmusic = mu_minessecret
            audio_sound_set_track_position(global.music, (fadeoff * audio_sound_length(global.music)))
        }
    }
    if (string_letters(roomname) == "palroom")
    {
        if (!audio_is_playing(mu_paletteselect))
        {
            audio_stop_all_music()
            scr_music(mu_paletteselect)
            pausedmusic = mu_paletteselect
        }
    }
}
