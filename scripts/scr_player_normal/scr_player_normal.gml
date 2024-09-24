function scr_player_normal() //scr_player_normal
{
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 2
        facehurt = 0
    }
    mach2 = 0
    move = key_left + key_right
    if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
        hsp = move * movespeed
    else if place_meeting(x, (y + 1), obj_railh)
        hsp = move * movespeed - 5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = move * movespeed + 5
    var breakdance_max = 10
    if (character != "N")
    {
        if key_taunt
            breakdance_pressed++
        else
            breakdance_pressed = 0
        if (breakdance_pressed >= breakdance_max)
            breakdance_speed = approach(breakdance_speed, 0.6, 0.005)
        else
            breakdance_speed = 0.25
    }
    if (character == "N")
    {
        if (move == 0)
        {
            if (idle < 400)
                idle++
            facehurt = false
            if (idle >= 300 && floor(image_index) == (image_number - 1))
            {
                shotgunAnim = false
                facehurt = false
                idle = 0
                image_index = 0
            }
            if (idle >= 300 && sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3)
            {
                randomise()
                idleanim = random_range(0, 100)
                if (idleanim <= 33)
                    sprite_index = spr_idle1
                else if (idleanim > 33 && idleanim < 66)
                    sprite_index = spr_idle2
                else if (idleanim > 66)
                    sprite_index = spr_idle3
                image_index = 0
                if (chance(0.25) && (!audio_is_playing(sfx_pizzanoscream)) && (!audio_is_playing(sfx_pizzanoscreamstart)))
                    scr_sound(sfx_pizzanocollect1, sfx_pizzanocollect2)
            }
            else if (idle < 300)
                sprite_index = spr_idle
            steppybuffer = 12
            if (obj_tv.screensaverbuffer > 0)
                obj_tv.screensaverbuffer--
        }
        else if (move != 0)
        {
            obj_tv.screensaverbuffer = 600
            if (steppybuffer > 0)
                steppybuffer--
            else if (!audio_is_playing(sound_step))
            {
                scr_sound(sound_step)
                steppybuffer = 12
            }
            sprite_index = spr_move
            idle = 0
        }
        if (move != 0)
            xscale = move
    }
    else if ((!machslideAnim) && (!landAnim) && (!shotgunAnim))
    {
        if (move == 0 && breakdance_pressed < breakdance_max)
        {
            steppybuffer = 12
            if (obj_tv.screensaverbuffer > 0)
                obj_tv.screensaverbuffer--
            if (idle < 400 && breakdance_pressed < breakdance_max)
                idle++
            if (idle >= 300 && breakdance_pressed < breakdance_max && floor(image_index) == (image_number - 1))
            {
                shotgunAnim = false
                facehurt = false
                idle = 0
                image_index = 0
            }
            if (sprite_index != spr_caneidle && (!global.panic) && sprite_index != spr_player_3hpidle && sprite_index != spr_playerPZ_rageidle)
            {
                if (idle >= 300 && sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3)
                {
                    randomise()
                    idleanim = random_range(0, 100)
                    if (idleanim <= 33)
                        sprite_index = spr_idle1
                    else if (idleanim > 33 && idleanim < 66)
                        sprite_index = spr_idle2
                    else if (idleanim > 66)
                        sprite_index = spr_idle3
                    image_index = 0
                    if (character == "N")
                    {
                        if (chance(0.25) && (!audio_is_playing(sfx_pizzanoscream)) && (!audio_is_playing(sfx_pizzanoscreamstart)))
                            scr_sound(sfx_pizzanocollect1, sfx_pizzanocollect2)
                    }
                    else if chance(0.25)
                        scr_sound(sfx_voiceidle1PZ, sfx_voiceidle2PZ)
                }
                if (idle < 300)
                {
                    if (!facehurt)
                    {
                        if (windingAnim < 1800 || angry || character == "N")
                        {
                            start_running = true
                            movespeed = 0
                            if (character == "P")
                            {
                                if global.cane
                                    sprite_index = spr_caneidle
                                else
                                    sprite_index = spr_idle
                            }
                            else
                                sprite_index = spr_idle
                        }
                        else if (character == "P")
                        {
                            idle = 0
                            windingAnim--
                            sprite_index = spr_player_winding
                        }
                    }
                    else if (facehurt && character == "P")
                    {
                        windingAnim = false
                        if (sprite_index != spr_player_facehurtup && sprite_index != spr_player_facehurt && sprite_index != spr_player_poundcancelafter && sprite_index != spr_player_poundcancelafterloop)
                            sprite_index = spr_player_facehurtup
                        if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_facehurtup)
                            sprite_index = spr_player_facehurt
                        if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_poundcancelafter)
                            sprite_index = spr_player_poundcancelafterloop
                    }
                }
            }
            if (character == "P")
            {
                if global.panic
                    sprite_index = spr_escapeidle
                if (instance_exists(obj_coneball) && sprite_index == spr_escapeidle)
                    sprite_index = spr_timesupidle
                if (breakdance_pressed >= breakdance_max)
                    sprite_index = spr_player_breakdance
            }
        }
        if (move != 0 && breakdance_pressed < breakdance_max)
        {
            obj_tv.screensaverbuffer = 600
            if (steppybuffer > 0)
                steppybuffer--
            else if (sprite_index != spr_player_breakdance)
            {
                if (!audio_is_playing(sound_step))
                {
                    scr_sound(sound_step)
                    steppybuffer = 12
                }
            }
            machslideAnim = false
            idle = 0
            facehurt = false
            if (character != "N")
            {
                if ((angry == 1 || global.combo >= 25) && global.combo < 50)
                    sprite_index = spr_playerPZ_3hpwalk
                else if (global.combo >= 50)
                    sprite_index = spr_playerPZ_ragemove
                else if global.cane
                    sprite_index = spr_canewalk
                else
                    sprite_index = spr_move
            }
            else
                sprite_index = spr_move
        }
        else if (breakdance_pressed >= breakdance_max)
            sprite_index = spr_player_breakdance
        if (move != 0)
            xscale = move
    }
    if landAnim
    {
        if (!shotgunAnim)
        {
            if (move == 0)
            {
                movespeed = 0
                sprite_index = spr_land
                if (floor(image_index) == (image_number - 1))
                    landAnim = false
            }
            if (move != 0)
            {
                sprite_index = spr_land2
                if (floor(image_index) == (image_number - 1))
                {
                    landAnim = false
                    if (!global.cane)
                        sprite_index = spr_move
                    else
                        sprite_index = spr_canewalk
                    image_index = 0
                }
            }
        }
        if shotgunAnim
        {
            sprite_index = spr_shotgun_land
            if (floor(image_index) == (image_number - 1))
            {
                landAnim = false
                if (!global.cane)
                    sprite_index = spr_move
                else
                    sprite_index = spr_canewalk
                image_index = 0
            }
        }
    }
    if machslideAnim
    {
        sprite_index = spr_machslideend
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_machslideend)
            machslideAnim = false
    }
    if (sprite_index == spr_player_shotgun && floor(image_index) == (image_number - 1))
        sprite_index = spr_shotgun_idle
    if (!landAnim)
    {
        if (shotgunAnim && move == 0 && sprite_index != spr_player_shotgun)
            sprite_index = spr_shotgun_idle
        else if (shotgunAnim && sprite_index != spr_player_shotgun)
            sprite_index = spr_shotgun_walk
    }
    if (scr_solid((x + sign(hsp)), y) && xscale == 1 && move == 1 && (!(place_meeting((x + 1), y, obj_slope))) && (!(place_meeting((x + 1), y, obj_slopeplatform))) && (((!(place_meeting((x + 1), y, obj_minecartRail_Slope))) && ischaracter == 2) || ischaracter != 2))
        movespeed = 0
    if (scr_solid((x + sign(hsp)), y) && xscale == -1 && move == -1 && (!(place_meeting((x - 1), y, obj_slope))) && (!(place_meeting((x - 1), y, obj_slopeplatform))) && (((!(place_meeting((x - 1), y, obj_minecartRail_Slope))) && ischaracter == 2) || ischaracter != 2))
        movespeed = 0
    jumpstop = false
    if ((!grounded) && (!key_jump))
    {
        if (!shotgunAnim)
            sprite_index = spr_fall
        else
            sprite_index = spr_shotgun_fall
        jumpAnim = false
        state = states.jump
        image_index = 0
    }
    if (character == "P")
    {
        if (key_attack && grounded && ((!(place_meeting((x + xscale), y, obj_solid))) || place_meeting((x + xscale), y, obj_destructibles) || place_meeting((x + xscale), y, obj_bigdestructibles)))
        {
            mach2 = 0
            if (movespeed < 6)
                movespeed = 6
            sprite_index = spr_mach1
            jumpAnim = true
            state = states.mach2
            image_index = 0
        }
    }
    if (character == "N" && key_attack && grounded && ((!(place_meeting((x + xscale), y, obj_solid))) || place_meeting((x + xscale), y, obj_destructibles) || place_meeting((x + xscale), y, obj_bigdestructibles)))
    {
        mach2 = 0
        if (movespeed < 6)
            movespeed = 6
        sprite_index = spr_mach1
        jumpAnim = true
        state = states.mach2
        image_index = 0
    }
    if (character == "C" && key_attack)
        state = states.coneboyinhale3
    if (input_buffer_jump < 8 && grounded && (!key_down))
    {
        scr_sound(sound_jump)
        sprite_index = spr_jump
        if shotgunAnim
            sprite_index = spr_shotgun_jump
        instance_create(x, y, obj_highjumpcloud2)
        vsp = -12
        state = states.jump
        image_index = 0
        jumpAnim = true
        input_buffer_jump = 8
    }
    if (grounded && input_buffer_jump < 8 && (!key_down) && (!key_attack) && vsp > 0)
    {
        scr_sound(sound_jump)
        sprite_index = spr_jump
        if shotgunAnim
            sprite_index = spr_shotgun_jump
        instance_create(x, y, obj_highjumpcloud2)
        stompAnim = false
        vsp = -11
        state = states.jump
        jumpAnim = true
        jumpstop = false
        image_index = 0
        freefallstart = false
    }
    if ((key_down && grounded) || scr_solid(x, (y - 3)))
    {
        state = states.crouch
        landAnim = false
        crouchAnim = true
        image_index = 0
        idle = 0
    }
    if (move != 0)
    {
        if (movespeed < 7)
            movespeed += 0.5
        else if (floor(movespeed) == 7)
            movespeed = 7
    }
    else
        movespeed = 0
    if (movespeed > 7)
        movespeed -= 0.1
    if (input_buffer_slap < 8 && shotgunAnim && (!instance_exists(obj_cutscene_upstairs)))
    {
        global.ammo -= 1
        sprite_index = spr_player_shotgun
        state = states.shotgun
        image_index = 0
        input_buffer_slap = 8
    }
    momemtum = false
    if (move != 0)
    {
        xscale = move
        if (movespeed < 3 && move != 0)
            image_speed = 0.35
        else if (movespeed > 3 && movespeed < 6)
            image_speed = 0.45
        else
            image_speed = 0.6
    }
    else
        image_speed = 0.35
    if (character == "P" && input_buffer_slap < 8 && (!key_down) && (!suplexmove) && (!shotgunAnim) && global.cane != true && obj_player.character != "G")
    {
        scr_sound(sound_suplex1)
        instance_create(x, y, obj_slaphitbox)
        suplexmove = true
        vsp = 0
        instance_create(x, y, obj_jumpdust)
        image_index = 0
        sprite_index = spr_suplexdash
        state = states.handstandjump
        input_buffer_slap = 8
    }
    if (character == "N" && input_buffer_slap < 8 && (!key_down) && (!suplexmove) && (!shotgunAnim) && global.cane != true && obj_player.character != "G" && (!key_up))
    {
        scr_sound(sound_suplex1)
        instance_create(x, y, obj_slaphitbox)
        suplexmove = true
        vsp = 0
        instance_create(x, y, obj_jumpdust)
        image_index = 0
        sprite_index = choose(spr_pizzano_kungfu1, spr_pizzano_kungfu2, spr_pizzano_kungfu3, spr_pizzano_kungfu4, spr_pizzano_kungfu5)
        state = states.pizzano
        movespeed = 10
        input_buffer_slap = 8
    }
    if key_taunt2
    {
        taunttimer = 20
        tauntstoredmovespeed = movespeed
        tauntstoredsprite = sprite_index
        tauntstoredstate = state
        tauntstoredvsp = vsp
        state = states.backbreaker
        if (global.tauntcount < 10 && place_meeting(x, y, obj_exitgate) && global.panic == true && global.combotime > 0)
        {
            global.tauntcount++
            global.collect += 25
            create_small_number((x + 16), y, "25")
            global.combofreeze = 30
            global.combotime += 10
            with (instance_create(x, y, obj_collecteffect))
            {
                sprite_index = spr_taunteffect
                image_index = 9
                choosed = true
            }
            scr_sound(sound_points)
        }
        if (supertauntcharged && key_up)
        {
            image_index = 0
            if (character == "N")
                sprite_index = choose(spr_pizzano_supertaunt1, spr_pizzano_supertaunt2)
            else
                sprite_index = choose(spr_player_supertaunt1, spr_player_supertaunt2, spr_player_supertaunt3)
        }
        else
        {
            image_index = irandom_range(0, sprite_get_number(spr_player_taunt))
            sprite_index = spr_player_taunt
        }
        if (sprite_index == spr_player_supertaunt1 || sprite_index == spr_player_supertaunt2 || sprite_index == spr_player_supertaunt3 || sprite_index == spr_pizzano_supertaunt1 || sprite_index == spr_pizzano_supertaunt2)
        {
            with (instance_create(x, y, obj_taunteffect))
                scr_sound(sfx_supertaunt)
        }
        else
            instance_create(x, y, obj_taunteffect)
    }
    if ((!instance_exists(obj_cloudeffect)) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
        instance_create(x, (y + 43), obj_cloudeffect)
    if ((!instance_exists(obj_cloudeffect)) && grounded && move != 0 && (sprite_index == spr_player_downslopes || sprite_index == spr_player_upslopes))
        instance_create(x, (y + 43), obj_cloudeffect)
    if (key_slap2 && key_up)
    {
        movespeed = hsp
        grounded = false
        vsp = -15
        state = states.uppercut
        suplexmove = true
        if (character == "N")
            sprite_index = spr_pizzano_uppercutbegin
        else
            sprite_index = spr_player_uppercutbegin
        image_index = 0
        scr_sound(sound_jump)
        scr_sound(sound_rollgetup)
        scr_sound(sound_suplex1)
        with (instance_create(x, y, obj_playeruppercut_hitbox))
            playerID = other.id
        input_buffer_slap = 8
    }
    if global.cane
    {
        if (scr_solid((x + sign(hsp)), y) && xscale == 1 && move == 1 && (!(place_meeting((x + 1), y, obj_slope))))
            movespeed = 0
        if (scr_solid((x + sign(hsp)), y) && xscale == -1 && move == -1 && (!(place_meeting((x - 1), y, obj_slope))))
            movespeed = 0
        if (key_jump2 && grounded && (!canrebound))
        {
            sprite_index = spr_player_canefall
            vsp = -15
            canrebound = true
            state = states.jump
        }
        if (input_buffer_slap < 8 && (!key_down) && (!suplexmove) && (!shotgunAnim) && (!key_up))
        {
            scr_sound(sound_suplex1)
            instance_create(x, y, obj_slaphitbox)
            suplexmove = true
            vsp = 0
            instance_create(x, y, obj_jumpdust)
            image_index = 0
            sprite_index = spr_canesuplex
            state = states.handstandjump
            if (character == "DEEZNUTS")
                vsp = -5
            input_buffer_slap = 8
        }
    }
    if (input_buffer_slap < 8 && character == "G")
    {
        state = states.mixnbrew
        image_index = 0
        sprite_index = spr_gumbob_brew_pulloutdrink
        input_buffer_slap = 8
    }
}

