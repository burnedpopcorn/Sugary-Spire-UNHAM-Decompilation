function scr_playersounds() //scr_playersounds
{
    if ((!audio_is_playing(sfx_railgrind)) && state == states.minecart && grounded)
        scr_sound(sfx_railgrind)
    else if (state != states.minecart || (!grounded))
        audio_stop_sound(sfx_railgrind)
    if (state == states.mach2 && sprite_index == spr_mach1 && (!audio_is_playing(sound_dash1)) && grounded)
        scr_sound(sound_dash1)
    else if (sprite_index != spr_mach1 || (!grounded) || move == (-xscale))
        audio_stop_sound(sound_dash1)
    if (sprite_index == spr_mach && (!audio_is_playing(sound_dash2)))
        scr_sound(sound_dash2)
    else if (sprite_index != spr_mach)
        audio_stop_sound(sound_dash2)
    if (((state == states.mach3 && sprite_index != spr_playerPZ_crazyrun && sprite_index != spr_pizzano_crazyrun) || sprite_index == spr_playerPZ_machslideboost3) && (!audio_is_playing(sound_maxspeed)))
        scr_sound(sound_maxspeed)
    else if ((state != states.mach3 && sprite_index != spr_playerPZ_machslideboost3) || sprite_index == spr_playerPZ_crazyrun || sprite_index == spr_pizzano_crazyrun)
        audio_stop_sound(sound_maxspeed)
    if ((sprite_index == spr_playerPZ_crazyrun || sprite_index == spr_pizzano_crazyrun) && (!audio_is_playing(sound_dash3)))
        scr_sound(sound_dash3)
    else if (sprite_index != spr_playerPZ_crazyrun && sprite_index != spr_pizzano_crazyrun)
        audio_stop_sound(sound_dash3)
    if (state != states.Sjumpprep)
    {
        audio_stop_sound(sfx_superjumphold)
        audio_stop_sound(sound_superjumpcharge2)
    }
}

