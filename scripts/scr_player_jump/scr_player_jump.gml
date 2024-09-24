function scr_player_jump() //scr_player_jump
{
    move = key_left + key_right
    if (sprite_index == spr_playerPZ_scooterspinstart && floor(image_index) == (image_number - 1))
        sprite_index = spr_playerPZ_scooterspin
    if (sprite_index == spr_playerPZ_scooterspinstart || sprite_index == spr_playerPZ_scooterspin || sprite_index == spr_pizzano_wallclimbspin)
    {
        if (character == "P")
        {
            if (kickclimbbuffer > 0)
                kickclimbbuffer--
        }
        move = key_left + key_right
        hsp = movespeed
        if (move != 0)
            movespeed = approach(movespeed, (move * 12), 1.5)
        else
            movespeed = approach(movespeed, 0, 0.6)
        if (grounded && key_attack && vsp > 0)
        {
            kickclimbbuffer = 0
            if (move != 0)
                xscale = move
            if (movespeed < 12)
                movespeed = 12
            state = states.mach3
            if (character == "N")
            {
                sprite_index = spr_pizzano_mach3grounded
                if (savedwallspeed > 18)
                    movespeed = 18
                else
                    movespeed = savedwallspeed
            }
            else
                sprite_index = spr_player_mach4
        }
        else if (grounded && ((move == 0 && (!key_attack)) || (!key_attack)) && vsp > 0)
        {
            kickclimbbuffer = 0
            if (move != 0)
                xscale = move
            movespeed = abs(hsp)
            if key_attack
                landAnim = 0
            input_buffer_secondjump = 0
            state = states.normal
            jumpAnim = 1
            jumpstop = 0
            image_index = 0
            freefallstart = 0
            instance_create_depth(x, y, 0, obj_landcloud)
            scr_sound(sound_step)
            doublejumped = 0
        }
        if key_down
        {
            if (character == "N")
            {
                if (vsp < 14)
                    vsp = approach(vsp, 14, 4)
            }
            else if (vsp < 20)
                vsp = approach(vsp, 20, 1)
            else
                vsp = 20
        }
        if ((input_buffer_slap < 8 || key_attack2) && sprite_index != spr_playerPZ_airkickstart && sprite_index != spr_playerPZ_airkick && sprite_index != spr_pizzano_wallclimbspincancelstart && sprite_index != spr_pizzano_wallclimbspincancel && (!key_taunt2))
        {
            kickclimbbuffer = 0
            if (move != 0)
                xscale = move
            image_index = 0
            if (character == "N")
            {
                state = states.mach3
                sprite_index = spr_pizzano_wallclimbspincancelstart
                if (savedwallspeed > 18)
                    movespeed = 18
                else
                    movespeed = savedwallspeed
            }
            else
            {
                sprite_index = spr_playerPZ_airkickstart
                state = states.mach3
                if (movespeed < 15)
                    movespeed = 15
                if (hsp < 15 && hsp > -15)
                    hsp = 15 * xscale
            }
            vsp = -3
            suplexmove = true
            flash = 1
            scr_sound(sound_suplex1)
            with (instance_create(x, y, obj_crazyrunothereffect))
                image_xscale = other.xscale
            input_buffer_slap = 8
        }
        if (((kickclimbbuffer == 0 && (!key_down) && (!grounded) && move != 0 && (!(place_meeting((x + move), y, obj_metalblock))) && scr_solid((x + move), y, true) && (!(place_meeting((x + move), y, obj_destructibles))) && (!(scr_slope_ext((x + sign(move)), y)))) || (grounded && scr_solid((x + sign(move)), (y - 2), true) && (!(scr_slope_ext((x + sign(move)), (y - 1)))) && (!(place_meeting((x + move), y, obj_metalblock))) && (!(place_meeting((x + move), y, obj_destructibles))) && scr_slope())) && character == "N")
        {
            wallspeed = clamp(abs(movespeed), 12, 24)
            mach2 = 100
            state = states.climbwall
            if (move != 0)
                xscale = move
            if (movespeed > 8)
                movespeed -= 0.1
            image_speed = 0.35
            grabclimbbuffer = 5
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
                    sprite_index = spr_pizzano_supertaunt1
                else
                    sprite_index = choose(spr_player_supertaunt1, spr_player_supertaunt2, spr_player_supertaunt3)
            }
            else
            {
                image_index = irandom_range(0, sprite_get_number(spr_player_taunt))
                sprite_index = spr_player_taunt
            }
            if (sprite_index == spr_player_supertaunt1 || sprite_index == spr_player_supertaunt2 || sprite_index == spr_player_supertaunt3 || sprite_index == spr_pizzano_supertaunt1)
            {
                with (instance_create(x, y, obj_taunteffect))
                    scr_sound(sfx_supertaunt)
            }
            else
                instance_create(x, y, obj_taunteffect)
        }
        if (sprite_index == spr_pizzano_wallclimbspin && (!key_down))
            image_speed = 0.5
        else if (sprite_index == spr_pizzano_wallclimbspin && key_down)
            image_speed = 0.7
        else
            image_speed = 0.35
    }
    else
    {
        if (!momemtum)
            hsp = move * movespeed
        else
            hsp = xscale * movespeed
        if (move != xscale && momemtum && movespeed != 0)
            movespeed -= 0.1
        if (movespeed == 0)
            momemtum = false
        if ((move == 0 && (!momemtum)) || scr_solid((x + hsp), y))
        {
            movespeed = 0
            mach2 = 0
        }
        if (move != 0 && movespeed < 7)
            movespeed += 0.5
        if (movespeed > 7)
            movespeed -= 0.1
        if scr_solid((x + move), y)
            movespeed = 0
        if (dir != xscale)
        {
            mach2 = 0
            dir = xscale
            movespeed = 0
        }
        if (move == (-xscale))
        {
            mach2 = 0
            movespeed = 0
            momemtum = false
        }
        landAnim = true
        if ((!key_jump2) && (!jumpstop) && vsp < 0.5 && (!stompAnim))
        {
            vsp /= 5
            jumpstop = true
        }
        if (ladderbuffer > 0)
            ladderbuffer--
        if (scr_solid(x, (y - 1)) && (!(place_meeting(x, y, obj_platform))) && (!jumpstop) && jumpAnim)
        {
            vsp = grav
            jumpstop = true
        }
        if (grounded && input_buffer_jump < 8 && (!key_down) && (!key_attack) && vsp > 0 && (!((sprite_index == spr_player_facestomp || sprite_index == spr_player_freefall))))
        {
            scr_sound(sound_jump)
            sprite_index = spr_jump
            if shotgunAnim
                sprite_index = spr_shotgun_jump
            instance_create_depth(x, y, -6, obj_highjumpcloud2)
            stompAnim = false
            vsp = -11
            state = states.jump
            jumpAnim = true
            jumpstop = false
            image_index = 0
            freefallstart = false
            instance_create_depth(x, y, 0, obj_landcloud)
            input_buffer_jump = 8
        }
        if (key_attack && grounded && fallinganimation < 40)
        {
            mach2 = 0
            if (movespeed < 6)
                movespeed = 6
            sprite_index = spr_mach1
            state = states.mach2
            image_index = 0
        }
        if (key_attack && grounded && fallinganimation < 40 && character == "DEEZNUTS")
        {
            mach2 = 0
            movespeed = 0
            sprite_index = spr_null
            jumpAnim = true
            state = states.pizzano
            image_index = 0
        }
        if (grounded && vsp > 0 && (!key_attack))
        {
            if key_attack
                landAnim = false
            input_buffer_secondjump = 0
            state = states.normal
            jumpAnim = true
            jumpstop = false
            image_index = 0
            freefallstart = 0
            instance_create_depth(x, y, 0, obj_landcloud)
            scr_sound(sound_step)
            doublejumped = false
        }
        if (character == "P")
        {
            if (vsp > 5)
                fallinganimation++
            if (fallinganimation >= 40 && fallinganimation < 80 && sprite_index != spr_candyup)
                sprite_index = spr_player_freefall
            if (fallinganimation >= 40 && fallinganimation < 80 && sprite_index == spr_candyup)
            {
                sprite_index = spr_player_freefall
                if (!instance_exists(obj_candifiedeffect1))
                    instance_create(x, y, obj_candifiedeffect1)
            }
            if (fallinganimation >= 80)
                sprite_index = spr_player_freefall2
        }
        if (!stompAnim)
        {
            if jumpAnim
            {
                if (floor(image_index) == (image_number - 1))
                    jumpAnim = false
            }
            if (!jumpAnim)
            {
                if (sprite_index == spr_airdash1)
                    sprite_index = spr_airdash2
                if (sprite_index == spr_player_suplexdashCancel)
                    sprite_index = spr_fall
                if (sprite_index == spr_jump || sprite_index == spr_player_piledriveafter)
                    sprite_index = spr_fall
            }
        }
        if stompAnim
        {
            if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
                sprite_index = spr_stomp
        }
        if (input_buffer_slap < 8 && shotgunAnim && global.ammo > 0)
        {
            global.ammo -= 1
            vsp -= 11
            sprite_index = spr_player_shotgunjump1
            state = states.shotgun
            image_index = 0
            input_buffer_slap = 8
        }
        if (move != 0)
            xscale = move
        image_speed = 0.35
        if (input_buffer_slap < 8 && shotgunAnim && (!instance_exists(obj_cutscene_upstairs)))
        {
            global.ammo -= 1
            sprite_index = spr_shotgun_shootair
            state = states.shotgun
            image_index = 0
            input_buffer_slap = 8
        }
        if (input_buffer_slap < 8 && key_up && (!suplexmove))
        {
            movespeed = hsp
            grounded = false
            vsp = -9
            state = states.uppercut
            suplexmove = true
            if (character == "N")
                sprite_index = spr_pizzano_uppercutbegin
            else
                sprite_index = spr_player_uppercutbegin
            image_index = 0
            scr_sound(sound_rollgetup)
            scr_sound(sound_suplex1)
            with (instance_create(x, y, obj_playeruppercut_hitbox))
                playerID = other.id
            input_buffer_slap = 8
        }
        if ((!key_down) && input_buffer_slap < 8 && (!suplexmove) && (!shotgunAnim) && (!global.cane) && character == "P" && (!key_up))
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
            if (movespeed < 10)
                movespeed = 10
            input_buffer_slap = 8
        }
        if (grounded && (sprite_index == spr_player_facestomp || sprite_index == spr_player_freefall || sprite_index == spr_player_freefall2))
        {
            scr_sound(sound_maximumspeedland)
            with (obj_baddie)
            {
                if (point_in_camera(x, y, view_camera[0]) && grounded)
                {
                    vsp = -7
                    hsp = 0
                }
            }
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = 30 / room_speed
            }
            image_index = 0
            sprite_index = spr_player_freefallland
            state = states.freefallland
            doublejumped = 0
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
        if (key_down2 && (!global.cane))
        {
            image_index = 0
            state = states.freefallprep
            if (character == "N")
                sprite_index = spr_pizzano_bodyslamprep
            else
                sprite_index = spr_playerPZ_poundcancelprep
            vsp = -5
        }
        if global.cane
        {
            if (!grounded)
                canrebound = false
            if key_down2
            {
                image_index = 0
                state = states.freefall
                sprite_index = spr_caneslam
                vsp = -18
            }
            if ((!key_down) && input_buffer_slap < 8 && (!suplexmove) && (!shotgunAnim))
            {
                scr_sound(sound_suplex1)
                instance_create(x, y, obj_slaphitbox)
                suplexmove = true
                vsp = 0
                instance_create(x, y, obj_jumpdust)
                image_index = 0
                sprite_index = spr_canesuplex
                state = states.handstandjump
                input_buffer_slap = 8
            }
        }
        if (sprite_index == spr_caneslam)
        {
            vsp = 17
            if (!instance_exists(obj_mach3effect))
                instance_create(x, (y - 32), obj_mach3effect)
        }
        if (input_buffer_jump < 8 && character == "G" && (!grounded) && gumbobpropellercooldown == 0)
        {
            state = states.propeller
            sprite_index = spr_gumbob_propeller_start
            movespeed = 0
            vsp = 0
            input_buffer_jump = 8
        }
        if (input_buffer_jump < 8 && character == "N" && (!grounded) && doublejumped == 0)
        {
            doublejumped = true
            vsp = -10
            sprite_index = spr_pizzano_djump
            input_buffer_jump = 8
        }
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_candytransitionup)
            sprite_index = spr_candyup
    }
}

