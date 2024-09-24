function scr_player_mach2() //scr_player_mach2
{
    switch character
    {
        case "P":
        case "N":
            if (windingAnim < 2000)
                windingAnim++
            if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
                hsp = xscale * movespeed
            else if place_meeting(x, (y + 1), obj_railh)
                hsp = xscale * movespeed - 5
            else if place_meeting(x, (y + 1), obj_railh2)
                hsp = xscale * movespeed + 5
            move2 = key_right2 + key_left2
            move = key_right + key_left
            if (sprite_index != spr_playerPZ_longjump && sprite_index != spr_playerPZ_longjumpend && sprite_index != spr_pizzano_machfall && sprite_index != spr_pizzano_spincancel)
            {
                if (sprite_index == spr_mach1)
                {
                    if (movespeed <= 8)
                        movespeed += 0.5
                    else if (movespeed >= 8 && floor(image_index) == (image_number - 1))
                        sprite_index = spr_mach
                }
                if (sprite_index == spr_mach)
                {
                    if (movespeed < 8)
                        movespeed = 8
                    else if (movespeed >= 8)
                        movespeed += 0.1
                }
            }
            if (sprite_index == spr_player_walljump && animation_end())
            {
                sprite_index = spr_playerPZ_airkick
                image_index = 0
            }
            if (sprite_index == spr_pizzano_longjump || sprite_index == spr_pizzano_longjumpend)
            {
                if (movespeed < 20)
                    movespeed += 0.05
            }
            crouchslideAnim = true
            if (sprite_index != spr_null)
            {
                if ((!key_jump2) && (!jumpstop) && vsp < 0.5)
                {
                    vsp /= 2
                    jumpstop = true
                }
            }
            if (sprite_index != spr_null)
            {
                if (character == "P")
                {
                    if (grounded && vsp > 0)
                        jumpstop = false
                    if (input_buffer_jump < 8 && grounded && vsp > 0 && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))))
                    {
                        image_index = 0
                        sprite_index = spr_secondjump1
                        scr_sound(sound_jump)
                        vsp = -9
                        input_buffer_jump = 8
                    }
                }
                else if (character == "N")
                {
                    if (input_buffer_jump < 8 && grounded && vsp > 0)
                    {
                        scr_sound(sound_jump)
                        state = states.pizzanotwirl
                        sprite_index = spr_pizzano_twirl
                        vsp = -12
                        input_buffer_jump = 8
                    }
                }
            }
            if (grounded && sprite_index != spr_null)
            {
                if ((!machpunchAnim) && sprite_index != spr_mach && sprite_index != spr_player_mach3 && sprite_index != spr_player_machhit && sprite_index != spr_mach1)
                {
                    if (sprite_index != spr_player_machhit && sprite_index != spr_playerPZ_rollgetup && sprite_index != spr_pizzano_rollgetup)
                        sprite_index = spr_mach
                }
                if machpunchAnim
                {
                    if ((!punch) && sprite_index != spr_machpunch1)
                    {
                        sprite_index = spr_machpunch1
                        image_index = 0
                    }
                    if (punch && sprite_index != spr_machpunch2)
                    {
                        sprite_index = spr_machpunch2
                        image_index = 0
                    }
                    if animation_end()
                    {
                        punch = (!punch)
                        machpunchAnim = false
                    }
                }
            }
            if (!grounded)
                machpunchAnim = false
            if (mach2 < 100)
                mach2 += 1.5
            if (movespeed >= 12 && grounded)
            {
                machhitAnim = false
                state = states.mach3
                flash = true
                if (character == "N")
                    sprite_index = spr_pizzano_mach3grounded
                else
                    sprite_index = spr_player_mach4
                instance_create(x, y, obj_jumpdust)
                if (movespeed < 12)
                    movespeed = 12
            }
            if (sprite_index != spr_null)
            {
                if ((!key_attack) && grounded)
                {
                    if (sprite_index != spr_mach1)
                    {
                        alarm[0] = 240
                        scr_sound(sound_break)
                        sprite_index = spr_machslidestart
                        state = states.machslide
                        image_index = 0
                        mach2 = 0
                    }
                    else
                    {
                        sprite_index = spr_idle
                        image_index = 0
                        state = states.normal
                        mach2 = 0
                    }
                }
            }
            if (sprite_index != spr_mach1)
            {
                if (move == -1 && xscale == 1 && grounded)
                {
                    scr_sound(sound_maximumspeedstop)
                    sprite_index = spr_machslideboost
                    state = states.machslide
                    image_index = 0
                    mach2 = 35
                }
                if (move == 1 && xscale == -1 && grounded)
                {
                    scr_sound(sound_maximumspeedstop)
                    sprite_index = spr_machslideboost
                    state = states.machslide
                    image_index = 0
                    mach2 = 35
                }
            }
            else if (sprite_index == spr_mach1)
            {
                if (move != 0)
                {
                    if (move != xscale)
                        xscale *= -1
                }
            }
            if (key_down && grounded && character == "P")
            {
                sprite_index = spr_player_machroll
                if (character == "P")
                    machhitAnim = false
                state = states.machroll
                input_buffer_jump = 8
            }
            if (key_down && (!grounded) && sprite_index != spr_dive)
            {
                sprite_index = spr_dive
                vsp = 10
                state = states.machroll
                input_buffer_jump = 8
            }
            if (((!grounded) && place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_slopeplatform)))) || (grounded && place_meeting((x + hsp), (y - 32), obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && (place_meeting(x, (y + 1), obj_slope) || place_meeting(x, (y + 1), obj_slopeplatform))))
            {
                wallspeed = movespeed
                state = states.climbwall
                grabclimbbuffer = 0
            }
            if (grounded && (!scr_slope()) && place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_slopeplatform))))
            {
                if (character == "N")
                    sprite_index = spr_pizzano_wallsplat
                else
                    sprite_index = spr_playerPZ_wallsplat
                state = states.bump
                movespeed = 0
            }
            if ((!instance_exists(obj_dashcloud)) && grounded)
            {
                with (instance_create(x, y, obj_dashcloud))
                    sprite_index = spr_dashcloud2
            }
            if ((!grounded) && movespeed <= 7 && sprite_index != spr_airdash1 && sprite_index != spr_airdash2)
            {
                sprite_index = spr_airdash1
                momemtum = 1
                jumpAnim = 0
                image_index = 0
            }
            if ((!grounded) && sprite_index != spr_secondjump2 && sprite_index != spr_mach2jump && sprite_index != spr_null && sprite_index != spr_player_bump && sprite_index != spr_playerPZ_longjump && sprite_index != spr_pizzano_spincancel && sprite_index != spr_playerPZ_longjumpend && sprite_index != spr_pizzano_longjump && sprite_index != spr_pizzano_longjumpend && sprite_index != spr_playerPZ_airkick && sprite_index != spr_player_walljump && movespeed > 7)
                sprite_index = spr_secondjump1
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_secondjump1)
                sprite_index = spr_secondjump2
            if (grounded && floor(image_index) == (image_number - 1) && (sprite_index == spr_playerPZ_rollgetup || sprite_index == spr_pizzano_rollgetup))
                sprite_index = spr_mach
            if (grounded && (sprite_index == spr_airdash2 || sprite_index == spr_playerPZ_longjumpend || sprite_index == spr_pizzano_longjumpend))
                sprite_index = spr_mach
            if (sprite_index == spr_airdash1 && floor(image_index) == (image_number - 1))
                sprite_index = spr_airdash2
            if (sprite_index == spr_mach1 && floor(image_index) == (image_number - 1))
                sprite_index = spr_mach
            if (sprite_index == spr_playerPZ_longjump && floor(image_index) == (image_number - 1))
                sprite_index = spr_playerPZ_longjumpend
            if (sprite_index == spr_pizzano_longjump && floor(image_index) == (image_number - 1))
                sprite_index = spr_pizzano_longjumpend
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
            if (sprite_index == spr_playerPZ_rollgetup || sprite_index == spr_pizzano_rollgetup)
                image_speed = 0.4
            else if (sprite_index == spr_playerPZ_longjump || sprite_index == spr_playerPZ_longjumpend || sprite_index == spr_mach1 || sprite_index == spr_pizzano_longjump || sprite_index == spr_pizzano_longjumpend || sprite_index == spr_playerPZ_airkick || sprite_index == spr_player_walljump || sprite_index == spr_secondjump1 || sprite_index == spr_secondjump2)
                image_speed = 0.35
            else if (sprite_index == spr_pizzano_spincancel)
                image_speed = 0.5
            else
                image_speed = 0.65
            if (input_buffer_slap < 8 && key_up)
            {
                movespeed = hsp
                grounded = false
                vsp = -10
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
            if (character == "N" && key_down)
            {
                sprite_index = spr_pizzano_crouchslide
                state = states.machroll
                input_buffer_jump = 8
            }
            if (character == "N" && key_up && input_buffer_slap < 8 && charged)
            {
                flash = true
                alarm[0] = 240
                image_index = 0
                state = states.Sjump
                sprite_index = spr_pizzano_sjumpprep
                input_buffer_slap = 8
            }
            if (input_buffer_slap < 8 && (!key_down) && (!suplexmove) && (!shotgunAnim) && global.cane != true && character != "N" && (!key_up))
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
            if (character == "N" && input_buffer_slap < 8 && (!key_down) && (!suplexmove) && (!shotgunAnim) && global.cane != true && obj_player.character != "G" && sprite_index != spr_pizzano_spincancel && (!key_up))
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
            if (character == "N" && (input_buffer_slap < 8 || key_attack2) && sprite_index == spr_pizzano_spincancel)
            {
                flash = true
                charged = false
                sprite_index = spr_pizzano_sjumpprepside
                image_index = 0
                movespeed = 0
                vsp = 0
                mach2 = 0
                state = states.rocketfistpizzano
                scr_sound(superjumpcancel)
                if (move != 0)
                    xscale = move
                input_buffer_slap = 8
            }
            break
    }

}

