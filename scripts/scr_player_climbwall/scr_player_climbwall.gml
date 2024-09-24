function scr_player_climbwall() //scr_player_climbwall
{
    if (windingAnim < 200)
        windingAnim++
    suplexmove = false
    vsp = (-wallspeed)
    crouchslideAnim = true
    if (character == "N")
    {
        wallbuffer++
        wallbuffer += (wallspeed / 44)
    }
    if (character == "P")
    {
        if (wallspeed < 12)
            sprite_index = spr_playerPZ_wallclimb
        else
            sprite_index = spr_climbwall
    }
    else if (character == "N")
        sprite_index = spr_climbwall
    if (grabclimbbuffer > 0)
        grabclimbbuffer--
    if (wallspeed < 24 && (!(place_meeting((x + xscale), y, obj_molassesWall))))
        wallspeed += 0.15
    if (vsp != 0 && place_meeting((x + xscale), y, obj_molassesWall))
    {
        if ((floor(image_index) % 4) == 0)
        {
            with (instance_create((x + 16 * xscale), (y + 43), obj_debris))
            {
                sprite_index = spr_molassesgoop
                image_index = irandom_range(0, 5)
            }
            wallbuffer = 0
        }
        wallspeed -= (wallspeed / 24)
    }
    if place_meeting((x + xscale), y, obj_molassesWall)
    {
        if (wallspeed > 0)
            wallspeed -= 0.05
    }
    if (wallspeed <= 0 || ((!key_attack) && grabclimbbuffer == 0))
    {
        state = states.jump
        sprite_index = spr_fall
    }
    if (!(scr_solid((x + xscale), y, true)))
    {
        if (wallspeed < 12)
        {
            if (character == "N")
            {
                if (wallbuffer < 8)
                {
                    instance_create(x, y, obj_jumpdust)
                    vsp = 0
                    ledge_bump(32)
                    state = states.mach2
                    if (movespeed < 8)
                        movespeed = 8
                    else
                        movespeed = wallspeed
                    hsp = movespeed * xscale
                    wallbuffer = 0
                    input_buffer_crouch = 14
                }
                else
                {
                    state = states.jump
                    sprite_index = spr_pizzano_wallclimbspin
                    savedwallspeed = wallspeed
                    vsp = -13
                    if (move != 0)
                        xscale = move
                    wallbuffer = 0
                    movespeed = xscale
                    hsp = xscale
                }
            }
            else
            {
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                ledge_bump(32)
                state = states.mach2
                if (movespeed < 8)
                    movespeed = 8
                else
                    movespeed = wallspeed
                hsp = movespeed * xscale
            }
        }
        else if (wallspeed >= 12)
        {
            if (character == "N")
            {
                if (wallbuffer < 8)
                {
                    instance_create(x, y, obj_jumpdust)
                    vsp = 0
                    ledge_bump(32)
                    state = states.mach3
                    sprite_index = spr_pizzano_mach3grounded
                    if (movespeed < 12)
                        movespeed = 12
                    movespeed = wallspeed
                    hsp = xscale * movespeed
                    input_buffer_crouch = 14
                }
                else
                {
                    state = states.jump
                    sprite_index = spr_pizzano_wallclimbspin
                    savedwallspeed = wallspeed
                    vsp = -13
                    if (move != 0)
                        xscale = move
                    wallbuffer = 0
                    movespeed = xscale
                    hsp = xscale
                    input_buffer_slap = 8
                }
            }
            else
            {
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                ledge_bump(32)
                state = states.mach3
                sprite_index = spr_player_mach4
                if (movespeed < 12)
                    movespeed = 12
                movespeed = wallspeed
                hsp = xscale * movespeed
            }
        }
    }
    if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && (!(scr_slope_ext((x + sign(hsp)), y))) && (!(scr_slope_ext((x - sign(hsp)), y))) && input_buffer_jump >= 8)
    {
        if (character == "N")
            sprite_index = spr_pizzano_ceilingcrash
        else
            sprite_index = spr_player_ceilingcrash
        scr_sound(sound_maximumspeedland)
        image_index = 0
        state = states.Sjumpland
        machhitAnim = false
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = 30 / room_speed
        }
    }
    if (input_buffer_jump < 8 && key_attack)
    {
        if (wallspeed >= 12 && (!(place_meeting((x + 1), y, obj_molassesWall))) && (!(place_meeting((x - 1), y, obj_molassesWall))))
        {
            mach2 = 100
            instance_create(x, y, obj_jumpdust)
            if (character == "P")
            {
                vsp = -14
                sprite_index = spr_playerPZ_scooterspinstart
                state = states.jump
                movespeed = hsp
                kickclimbbuffer = 10
                input_buffer_slap = 8
            }
            else
            {
                vsp = -9
                sprite_index = spr_pizzano_dashpad
                state = states.mach3
                wallspeed = movespeed
            }
            if global.starrmode
                state = states.mach2
            xscale *= -1
            hsp = xscale * movespeed
        }
        else if (wallspeed < 12 || place_meeting((x + xscale), y, obj_molassesWall))
        {
            if (character == "N")
                sprite_index = spr_pizzano_machfall
            else
                sprite_index = spr_player_walljump
            image_index = 0
            mach2 = 35
            instance_create(x, y, obj_jumpdust)
            vsp = -9
            state = states.mach2
            xscale *= -1
            hsp = xscale * movespeed
        }
        input_buffer_jump = 8
    }
    image_speed = 0.6
    if (!instance_exists(obj_cloudeffect))
        instance_create(x, (y + 43), obj_cloudeffect)
    if ((!instance_exists(obj_chargeeffectwall)) && wallspeed >= 12)
        instance_create((x - 16), (y - 16), obj_chargeeffectwall)
}

