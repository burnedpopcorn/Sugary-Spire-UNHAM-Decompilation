function scr_player_crouchslide() //scr_player_crouchslide
{
    if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
        hsp = xscale * movespeed
    else if place_meeting(x, (y + 1), obj_railh)
        hsp = xscale * movespeed - 5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = xscale * movespeed + 5
    if (mask_index == spr_player_mask || mask_index == spr_crouchmask)
        mask_index = spr_crouchmask
    if (input_buffer_crouch > 0)
        input_buffer_crouch--
    if ((!key_down) && input_buffer_crouch == 0 && (!(scr_solid((x + 27), (y - 32)))) && (!(scr_solid((x - 27), (y - 32)))) && (!(scr_solid(x, (y - 32)))) && (!(scr_solid(x, (y - 16)))))
    {
        switch character
        {
            case "N":
                sprite_index = spr_pizzano_mach2
                image_index = 0
                state = states.pizzano
                break
            default:
                sprite_index = spr_playerPZ_rollgetup
                image_index = 0
                mach2 = 35
                if (movespeed < 12)
                {
                    state = states.mach2
                    if (movespeed < 12)
                        movespeed = 12
                }
                else if (movespeed >= 12)
                {
                    state = states.mach3
                    if (movespeed < 12)
                        movespeed = 12
                }
                break
        }

    }
    if (movespeed <= 0 && (((!scr_slope()) && (!(place_meeting((x + xscale), y, obj_minecartRail_Slope)))) || scr_solid((x + xscale), y, true)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        state = states.normal
        movespeed = 0
        mach2 = 0
        crouchslideAnim = true
        image_index = 0
        crouchAnim = true
        start_running = true
        alarm[4] = 14
    }
    if (scr_solid((x + xscale), y, true) && (!(place_meeting((x + xscale), y, obj_minecartRail_Slope))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        movespeed = 0
        state = states.bump
        hsp = 0
        vsp = 0
        mach2 = 0
        image_index = 0
        sprite_index = spr_playerPZ_wallsplat
        machslideAnim = true
        machhitAnim = false
        instance_create((x + xscale * 10), (y + xscale * 10), obj_bumpeffect)
    }
    var _xscale = xscale
    if place_meeting(x, (y + 1), obj_slope)
    {
        with (instance_place(x, (y + 1), obj_slope))
        {
            var slope_acceleration = abs(image_yscale) / abs(image_xscale)
            if (_xscale == sign(image_xscale))
            {
                if (other.movespeed > 0)
                    other.movespeed -= (0.25 * slope_acceleration)
                else
                {
                    other.movespeed = 0
                    other.xscale = (-sign(image_xscale))
                }
            }
            else if (_xscale == (-sign(image_xscale)))
            {
                if (other.movespeed < 18)
                    other.movespeed += (0.25 * slope_acceleration)
            }
        }
    }
    if place_meeting(x, (y + 1), obj_slopeplatform)
    {
        with (instance_place(x, (y + 1), obj_slopeplatform))
        {
            slope_acceleration = abs(image_yscale) / abs(image_xscale)
            if (_xscale == sign(image_xscale))
            {
                if (other.movespeed > 0)
                    other.movespeed -= (0.25 * slope_acceleration)
                else
                {
                    other.movespeed = 0
                    other.xscale = (-sign(image_xscale))
                }
            }
            else if (_xscale == (-sign(image_xscale)))
            {
                if (other.movespeed < 18)
                    other.movespeed += (0.25 * slope_acceleration)
            }
        }
    }
    if (sprite_index != spr_dive && (!grounded))
    {
        sprite_index = spr_dive
        state = states.machroll
        vsp = 10
        input_buffer_jump = 8
    }
    if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
        instance_create(x, y, obj_slidecloud)
    image_speed = 0.35
}

