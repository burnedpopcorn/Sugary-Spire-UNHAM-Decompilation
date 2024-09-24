image_speed = 0.35
switch sprite_index
{
    case spr_secretportal_spawnopen:
        with (obj_player)
        {
            x = other.x
            y = other.y
            roomstartx = x
            roomstarty = y
            hsp = 0
            vsp = 0
            movespeed = 0
            cutscene = true
            visible = false
        }
        waitbuffer = 80
        drop = false
        if (floor(image_index) == (image_number - 1))
        {
            scr_sound(sfx_secretexit)
            sprite_index = spr_secretportal_spawnidle
            with (obj_player)
            {
                visible = true
                cutscene = false
                if (secretstoredstate != states.cotton && secretstoredstate != states.cottondrill && secretstoredstate != states.cottonroll)
                {
                    if (character == "N")
                        sprite_index = spr_pizzano_bodyslamprep
                    else
                        sprite_index = spr_playerPZ_poundcancelprep
                    image_index = 0
                    state = states.freefallprep
                    vsp = -7
                }
                else
                {
                    state = secretstoredstate
                    movespeed = secretstoredmovespeed
                    hsp = secretstoredhsp
                    sprite_index = secretstoredsprite
                }
            }
        }
        break
    case spr_secretportal_spawnidle:
        if (!drop)
        {
            with (obj_player)
            {
                x = other.x
                y = other.y - 10
                visible = true
                hsp = 0
                movespeed = 0
                vsp = 10
                fallinganimation = 0
                if (xscale == 1 || xscale == -1)
                    other.drop = true
                tonormalxscale = 1
            }
        }
        if drop
        {
            if (waitbuffer > 0)
                waitbuffer--
            else
            {
                sprite_index = spr_secretportal_spawnclose
                image_index = 0
            }
        }
        break
    case spr_secretportal_spawnclose:
        if (floor(image_index) == (image_number - 1))
        {
            image_index = image_number - 1
            instance_destroy()
        }
        break
}

if audio_is_playing(sfx_coneball)
    audio_stop_sound(sfx_coneball)
