function scr_player_backbreaker() //scr_player_backbreaker
{
    if (sprite_index == spr_pizzano_djump)
        sprite_index = spr_pizzano_taunt
    if (sprite_index != spr_player_machfreefall && sprite_index != spr_pizzano_outofcontrolfall)
    {
        hsp = 0
        movespeed = 0
    }
    else
        hsp = xscale * movespeed
    landAnim = false
    if (sprite_index == spr_pizzelle_taunt || sprite_index == spr_gumbob_taunt || sprite_index == spr_player_supertaunt || sprite_index == spr_pizzano_taunt)
    {
        taunttimer--
        vsp = 0
    }
    if (sprite_index == spr_player_machfreefall && place_meeting(x, (y + 1), obj_solid))
    {
        state = states.machslide
        sprite_index = spr_player_crouchslide
    }
    if (sprite_index == spr_pizzano_outofcontrolfall && place_meeting(x, (y + 1), obj_solid))
    {
        state = states.machslide
        sprite_index = spr_pizzano_sleepend
        image_index = 0
    }
    if (sprite_index == spr_pizzelle_taunt || sprite_index == spr_gumbob_taunt || sprite_index == spr_player_supertaunt || sprite_index == spr_pizzano_taunt)
    {
        if (!instance_exists(parryid))
        {
            with (instance_create(x, y, obj_parryhitbox))
            {
                other.parryid = id
                image_xscale = other.xscale
                playerID = other.id
            }
        }
    }
    if (sprite_index == spr_player_supertaunt1 || sprite_index == spr_player_supertaunt2 || sprite_index == spr_player_supertaunt3 || sprite_index == spr_pizzano_supertaunt1 || sprite_index == spr_pizzano_supertaunt2)
    {
        supercharge = 0
        vsp = 0
        hsp = 0
        supertauntbuffer = 100
        with (obj_baddie)
        {
            if (point_in_camera(x, y, view_camera[0]) && sprite_index != spr_charcherry_wait)
            {
                state = states.cheeseball
                stunned = 999
                hsp = 0
                vsp = 0
                shakebuffer = 999
                shake = 8
            }
        }
        if (floor(image_index) >= 5 && supertauntcharged)
        {
            instance_create(x, y, obj_supertaunthitbox)
            with (instance_create(x, y, obj_tauntaftereffectspawner))
                playerid = other.id
            if (!instance_exists(parryid))
            {
                with (instance_create(x, y, obj_parryhitbox))
                {
                    other.parryid = id
                    image_xscale = other.xscale
                }
            }
            supertauntcharged = false
        }
        if animation_end()
        {
            supertauntbuffer = 0
            supertauntcharged = false
            movespeed = tauntstoredmovespeed
            sprite_index = tauntstoredsprite
            state = tauntstoredstate
            vsp = tauntstoredvsp
        }
    }
    if (taunttimer == 0 && (sprite_index == spr_pizzelle_taunt || sprite_index == spr_gumbob_taunt || sprite_index == spr_player_supertaunt || sprite_index == spr_pizzano_taunt))
    {
        movespeed = tauntstoredmovespeed
        sprite_index = tauntstoredsprite
        state = tauntstoredstate
        vsp = tauntstoredvsp
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_eatspaghetti)
        state = states.normal
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_Timesup && (place_meeting(x, y, obj_exitgate) || room != timesuproom))
        state = states.normal
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_levelcomplete || sprite_index == spr_playerN_victory))
        state = states.normal
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_bossintro)
        state = states.normal
    if (sprite_index != spr_player_taunt)
        image_speed = 0.35
    else if (sprite_index == spr_player_supertaunt1 || sprite_index == spr_player_supertaunt2 || sprite_index == spr_player_supertaunt3 || sprite_index == spr_pizzano_supertaunt1)
        image_speed = 0.5
    else if (sprite_index == spr_player_taunt)
        image_speed = 0
    if (supertauntcharged && key_up && sprite_index == spr_player_taunt)
    {
        image_index = 0
        if (character == "N")
            sprite_index = choose(spr_pizzano_supertaunt1, spr_pizzano_supertaunt2)
        else
            sprite_index = choose(spr_player_supertaunt1, spr_player_supertaunt2, spr_player_supertaunt3)
        audio_stop_sound(sound_taunt)
        audio_stop_sound(sound_taunt1)
        audio_stop_sound(sound_taunt2)
        audio_stop_sound(sound_taunt3)
        audio_stop_sound(sound_taunt4)
        audio_stop_sound(sound_taunt5)
        audio_stop_sound(sound_taunt6)
        audio_stop_sound(sound_taunt7)
        audio_stop_sound(sound_taunt8)
        instance_destroy(obj_taunteffect)
        with (instance_create(x, y, obj_taunteffect))
            scr_sound(sfx_supertaunt)
    }
}

