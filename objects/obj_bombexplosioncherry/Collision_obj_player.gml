if (obj_player.state != states.parry && obj_player.state != states.backbreaker && obj_player.state != states.titlescreen)
{
    if (obj_player.character == "N")
    {
        obj_player.state = states.parry
        obj_player.sprite_index = spr_pizzano_parry1
        if (!instance_exists(other.parryid))
        {
            with (instance_create(x, y, obj_parryhitbox))
            {
                other.parryid = id
                image_xscale = obj_player.xscale
            }
            if (!audio_is_playing(sound_parry))
                scr_sound(sound_parry)
        }
    }
    else if (obj_player.state != states.bombpep)
    {
        obj_player.state = states.bombpep
        obj_player.bombpeptimer = 0
        obj_player.sprite_index = spr_bombpep_end
    }
}
