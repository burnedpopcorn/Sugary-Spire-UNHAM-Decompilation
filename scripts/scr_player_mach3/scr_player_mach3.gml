function scr_player_mach3() //scr_player_mach3
{
    switch character
    {
        case "P":
        case "N":
            if grounded
                Sjumpcan_doublejump = true
            if (windingAnim < 2000)
                windingAnim++
            if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
                hsp = xscale * movespeed
            else if place_meeting(x, (y + 1), obj_railh)
                hsp = xscale * movespeed - 5
            else if place_meeting(x, (y + 1), obj_railh2)
                hsp = xscale * movespeed + 5
            if (sprite_index == spr_playerPZ_airkickstart && floor(image_index) == (image_number - 1))
                sprite_index = spr_playerPZ_airkick
            if (sprite_index == spr_pizzano_wallclimbspincancelstart && floor(image_index) == (image_number - 1))
                sprite_index = spr_pizzano_wallclimbspincancel
            mach2 = 100
            momemtum = true
            move = key_right + key_left
            move2 = key_right2 + key_left2
            if (movespeed < 12)
                movespeed = 12
            if ((movespeed < 20 || instance_exists(obj_warphallway)) && move == xscale)
            {
                if (sprite_index != spr_playerPZ_crazyrun && sprite_index != spr_pizzano_crazyrun)
                {
                    if grounded
                        movespeed += 0.025
                    else if (!grounded)
                        movespeed += 0.01
                }
                else
                    movespeed += 0.1
                if (!instance_exists(obj_crazyruneffect))
                    instance_create(x, y, obj_crazyruneffect)
            }
            else if (movespeed > 12 && move != xscale && Dashpad_buffer <= 0)
                movespeed -= 0.025
            if grounded
            {
                if (scr_slope() && hsp != 0 && movespeed > 10 && movespeed < 18)
                    scr_player_addslopemomentum(0.1, 0.2)
            }
            crouchslideAnim = true
            if ((!key_jump2) && (!jumpstop) && vsp < 0.5)
            {
                vsp /= 2
                jumpstop = true
            }
            if (grounded && vsp > 0)
                jumpstop = false
            if (input_buffer_jump < 8 && grounded && vsp > 0 && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))))
            {
                scr_sound(sound_jump)
                image_index = 0
                if (character == "N")
                    sprite_index = spr_pizzano_mach3jump
                else
                    sprite_index = spr_playerPZ_mach3jumpnewfix
                vsp = -11
                input_buffer_jump = 8
            }
            if (sprite_index == spr_playerPZ_mach3jumpnewfix && floor(image_index) == (image_number - 1))
                sprite_index = spr_player_mach4
            if ((sprite_index == spr_playerPZ_airkick || sprite_index == spr_playerPZ_Sjumpcancel) && grounded)
                sprite_index = spr_player_mach4
            if (floor(image_index) == (image_number - 1) && (sprite_index == spr_playerPZ_rollgetup || sprite_index == spr_playerPZ_dashpad || sprite_index == spr_playerPZ_mach3hit))
                sprite_index = spr_player_mach4
            if ((sprite_index == spr_pizzano_machfall || sprite_index == spr_pizzano_mach3jump || sprite_index == spr_pizzano_wallclimbspincancel) && grounded && vsp > 0)
                sprite_index = spr_pizzano_mach3grounded
            if (floor(image_index) == (image_number - 1) && (sprite_index == spr_pizzano_dashpad || sprite_index == spr_pizzano_rollgetup || sprite_index == spr_pizzano_mach3jump))
                sprite_index = spr_pizzano_mach3grounded
            if (movespeed > 16 && sprite_index != spr_playerPZ_crazyrun && sprite_index != spr_pizzano_crazyrun && sprite_index != spr_player_dive && sprite_index != spr_playerPZ_rollgetup && sprite_index != spr_pizzano_rollgetup && sprite_index != spr_pizzano_wallclimbspincancel && sprite_index != spr_pizzano_wallclimbspincancelstart)
            {
                flash = true
                if (character == "N")
                    sprite_index = spr_pizzano_crazyrun
                else
                    sprite_index = spr_playerPZ_crazyrun
            }
            else if (movespeed <= 16 && sprite_index == spr_playerPZ_crazyrun)
                sprite_index = spr_player_mach4
            else if (movespeed <= 16 && sprite_index == spr_pizzano_crazyrun)
                sprite_index = spr_pizzano_mach3grounded
            if (sprite_index == spr_playerPZ_crazyrun && (!instance_exists(obj_crazyrunothereffect)))
                instance_create(x, y, obj_crazyrunothereffect)
            if (key_up && sprite_index != spr_dashpadboost && sprite_index != spr_player_dive && (!key_taunt2) && (!key_slap2))
            {
                scr_sound(sound_superjumpcharge1)
                sprite_index = spr_superjumpprep
                state = states.Sjumpprep
                hsp = 0
                image_index = 0
            }
            if ((!key_attack) && grounded && sprite_index != spr_dashpadboost && Dashpad_buffer <= 0)
            {
                scr_sound(sound_break)
                sprite_index = spr_machslidestart
                state = states.machslide
                image_index = 0
                mach2 = 0
            }
            if (move != 0 && xscale != move && grounded && Dashpad_buffer <= 0)
            {
                scr_sound(sound_maximumspeedstop)
                if (character == "N")
                    sprite_index = spr_pizzano_mach3boost
                else
                    sprite_index = spr_playerPZ_machslideboost3
                flash = false
                state = states.machslide
                image_index = 0
                mach2 = 100
            }
            if (key_down && (!grounded) && sprite_index != spr_player_dive)
            {
                flash = false
                state = states.machroll
                vsp = 10
                input_buffer_jump = 8
            }
            if (key_down && grounded)
            {
                flash = false
                state = states.machroll
                input_buffer_jump = 8
            }
            if (sprite_index == spr_player_dive && grounded && character == "P")
                sprite_index = spr_player_mach4
            if (sprite_index == spr_player_dive && grounded && character == "N")
                sprite_index = spr_pizzano_mach3grounded
            if ((!key_down) && sprite_index == spr_player_dive && (!grounded) && character == "P")
            {
                vsp = 15
                sprite_index = spr_player_mach4
            }
            if ((!key_down) && sprite_index == spr_player_dive && (!grounded) && character == "N")
            {
                vsp = 15
                sprite_index = spr_pizzano_mach3grounded
            }
            if (((!grounded) && (!(place_meeting((x + hsp), y, obj_metalblock))) && scr_solid((x + hsp), y, true) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(scr_slope_ext((x + sign(hsp)), y)))) || (grounded && scr_solid((x + sign(hsp)), (y - 2), true) && (!(scr_slope_ext((x + sign(hsp)), (y - 1)))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && scr_slope()))
            {
                wallspeed = clamp(movespeed, 12, 20)
                state = states.climbwall
                if (character == "P")
                    scr_sound(sfx_climbwallstart)
                grabclimbbuffer = 0
            }
            else if (grounded && scr_solid((x + sign(hsp)), y) && (!scr_slope()) && scr_solid((x + sign(hsp)), (y - 2)) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
            {
                scr_sound(sound_maximumspeedland)
                with (obj_camera)
                {
                    shake_mag = 20
                    shake_mag_acc = 40 / room_speed
                }
                image_speed = 0.35
                with (obj_baddie)
                {
                    if (point_in_camera(x, y, view_camera[0]) && grounded)
                    {
                        stun = true
                        alarm[0] = 200
                        ministun = false
                        vsp = -5
                        hsp = 0
                    }
                }
                flash = false
                combo = 0
                if (character == "N")
                    sprite_index = spr_pizzano_mach3hitwall
                else
                    sprite_index = spr_player_mach3hitwall
                state = states.bump
                hsp = -2.5 * xscale
                vsp = -3
                mach2 = 0
                image_index = 0
                instance_create((x + 10 * xscale), (y + 10), obj_bumpeffect)
            }
            if (!grounded)
            {
                if (scr_solid((x + 1), y) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_slopeplatform))) && (!(place_meeting((x + 1), y, obj_destructibles))))
                {
                    wallspeed = movespeed
                    machhitAnim = false
                    state = states.climbwall
                }
                else if (scr_solid((x - 1), y) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_slopeplatform))) && (!(place_meeting((x - 1), y, obj_destructibles))))
                {
                    wallspeed = movespeed
                    machhitAnim = false
                    state = states.climbwall
                }
            }
            if ((!instance_exists(obj_chargeeffect)) && sprite_index != spr_player_dive)
                instance_create(x, y, obj_chargeeffect)
            if ((!instance_exists(obj_superdashcloud)) && grounded)
                instance_create(x, y, obj_superdashcloud)
            if (sprite_index == spr_player_mach4 || sprite_index == spr_pizzano_mach3grounded)
                image_speed = 0.4
            if (sprite_index == spr_playerPZ_crazyrun || sprite_index == spr_pizzano_crazyrun)
                image_speed = 0.55
            if (sprite_index == spr_playerPZ_rollgetup || sprite_index == spr_pizzano_rollgetup)
                image_speed = 0.35
            if (sprite_index == spr_playerPZ_dashpad || sprite_index == spr_pizzano_dashpad || sprite_index == spr_pizzano_crouchslide || sprite_index == spr_pizzano_wallclimbspincancel)
                image_speed = 0.35
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
            if (input_buffer_slap < 8 && (!key_down) && (!suplexmove) && (!shotgunAnim) && global.cane != true && character == "P")
            {
                if (!key_up)
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
                else
                {
                    movespeed = hsp
                    grounded = false
                    vsp = -10
                    state = states.uppercut
                    suplexmove = true
                    sprite_index = spr_player_uppercutbegin
                    image_index = 0
                    scr_sound(sound_jump)
                    scr_sound(sound_rollgetup)
                    scr_sound(sound_suplex1)
                    with (instance_create(x, y, obj_playeruppercut_hitbox))
                        playerID = other.id
                    input_buffer_slap = 8
                }
            }
            if (character == "N" && input_buffer_slap < 8 && (!key_down) && (!suplexmove) && (!shotgunAnim) && global.cane != true && obj_player.character != "G")
            {
                if (!key_up)
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
                else
                {
                    movespeed = hsp
                    grounded = false
                    vsp = -10
                    state = states.uppercut
                    suplexmove = true
                    sprite_index = spr_pizzano_uppercutbegin
                    image_index = 0
                    scr_sound(sound_jump)
                    scr_sound(sound_rollgetup)
                    scr_sound(sound_suplex1)
                    with (instance_create(x, y, obj_playeruppercut_hitbox))
                        playerID = other.id
                }
            }
            if (character == "N" && sprite_index == spr_machroll)
                sprite_index = spr_pizzano_rollgetup
            break
    }

}

