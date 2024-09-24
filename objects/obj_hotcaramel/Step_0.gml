if place_meeting(x, (y - 1), obj_player)
{
    with (obj_player)
    {
        if (character == "N")
            sprite_index = spr_pizzano_fireass
        else
            sprite_index = spr_player_fireass
        state = states.fireass
        image_index = 0
        vsp = -20
        if (character == "N")
        {
            audio_stop_sound(sfx_pizzanohurt)
            scr_sound(sfx_pizzanohurt)
        }
        else
        {
            audio_stop_sound(sound_fireass)
            scr_sound(sound_fireass)
        }
    }
    if (obj_player.state == states.cotton || obj_player.state == states.cottondrill)
        instance_create(x, y, obj_poofeffect)
}
