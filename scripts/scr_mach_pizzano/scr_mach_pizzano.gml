function scr_mach_pizzano() //scr_mach_pizzano
{
    move = key_left + key_right
    hsp = xscale * movespeed
    landAnim = true
    jumpstop = false
    if (sprite_index == spr_pizzano_djump)
        sprite_index = choose(spr_pizzano_kungfu1, spr_pizzano_kungfu2, spr_pizzano_kungfu3, spr_pizzano_kungfu4, spr_pizzano_kungfu5)
    image_speed = 0.4
    if (sprite_index != spr_pizzano_pizzacutter)
    {
        if (move != 0)
        {
            if (move != xscale && movespeed > -12)
                movespeed -= 1
            else if (move == xscale && movespeed < 12)
                movespeed += 0.2
        }
    }
    if (character == "N" && input_buffer_slap < 8 && sprite_index != spr_pizzano_pizzacutter)
    {
        scr_sound(sound_suplex1)
        instance_create(x, y, obj_slaphitbox)
        suplexmove = true
        vsp = 0
        instance_create(x, y, obj_jumpdust)
        image_index = 0
        sprite_index = spr_pizzano_pizzacutter
        state = states.pizzano
        if (movespeed < 10)
            movespeed = 10
        if (move != 0)
            xscale = move
        input_buffer_slap = 8
    }
    if (sprite_index == spr_pizzano_pizzacutter)
    {
        if (movespeed < 20)
            movespeed += 0.1
    }
    if (floor(image_index) == (image_number - 1))
    {
        switch sprite_index
        {
            case spr_pizzano_kungfu1:
            case spr_pizzano_kungfu2:
            case spr_pizzano_kungfu3:
            case spr_pizzano_kungfu4:
            case spr_pizzano_kungfu5:
            case spr_pizzano_pizzacutter:
                if ((move == 0 && (!key_attack)) || (!key_attack))
                    state = states.normal
                else if (movespeed < 12 && key_attack && (!(place_meeting((x + xscale), y, obj_solid))))
                {
                    sprite_index = spr_mach
                    state = states.mach2
                    if (movespeed < 6)
                        movespeed = 6
                }
                else if (movespeed >= 12 && key_attack && (!(place_meeting((x + xscale), y, obj_solid))))
                {
                    sprite_index = spr_pizzano_mach3grounded
                    state = states.mach3
                    if (movespeed < 12)
                        movespeed = 12
                }
                if (move != 0)
                    xscale = move
                break
        }

    }
    if (((!grounded) && place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_slopeplatform)))) || (grounded && place_meeting((x + hsp), (y - 32), obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting(x, (y + 1), obj_slope)))
    {
        sprite_index = spr_pizzano_wallclimb
        if (movespeed <= 0)
            wallspeed = 9
        else
        {
            wallspeed = movespeed
            if (movespeed < 9)
                wallspeed = 9
        }
        state = states.climbwall
        grabclimbbuffer = 10
    }
    if (grounded && place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting(x, (y + 1), obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_slopeplatform))) && (!(place_meeting(x, (y + 1), obj_slopeplatform))) && (!(place_meeting((x + sign(hsp)), y, obj_minecartRail_Slope))) && (!(place_meeting(x, (y + 1), obj_minecartRail_Slope))))
    {
        grav = 0.5
        movespeed = 0
        state = states.bump
        hsp = 0
        vsp = -4
        mach2 = 0
        image_index = 0
        machslideAnim = true
        machhitAnim = false
        sprite_index = spr_pizzano_wallsplat
        instance_create((x + 10 * xscale), (y + 10), obj_bumpeffect)
        if audio_is_playing(sound_suplex1)
            audio_stop_sound(sound_suplex1)
        scr_sound(sound_bump)
    }
    if (input_buffer_jump < 8 && grounded && vsp > 0 && (!jumpstop))
    {
        state = states.mach2
        sprite_index = spr_pizzano_longjump
        image_index = 0
        vsp = -12
        if (movespeed < 12)
            movespeed = 12
        if (move != 0)
            xscale = move
        hsp = xscale * movespeed
        input_buffer_jump = 8
    }
    if (character == "N" && key_down2)
    {
        sprite_index = spr_pizzano_crouchslide
        state = states.machroll
        input_buffer_jump = 8
        input_buffer_crouch = 14
        if (movespeed < 12)
            movespeed = 12
    }
}

