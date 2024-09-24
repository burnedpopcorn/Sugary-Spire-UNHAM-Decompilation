if (!instance_exists(playerID))
    return;
if (other.state == baddiestates.charcherry && playerID.sprite_index == playerID.spr_player_taunt)
{
    if (!audio_is_playing(sound_parry))
        scr_sound(sound_parry)
    instance_destroy(other)
    instance_create(x, y, obj_bombexplosioncherry)
    with (playerID)
    {
        state = states.parry
        if (character == "P")
            sprite_index = choose(spr_player_parry1, spr_player_parry2, spr_player_parry3)
        else if (character == "N")
            sprite_index = spr_pizzano_parry1
        image_index = 0
        movespeed = -8
        flash = true
    }
}
