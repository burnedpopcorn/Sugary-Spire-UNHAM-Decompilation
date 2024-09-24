function scr_player_minecart() //scr_player_minecart
{
    move = key_left + key_right
    var _xscale = xscale
    if place_meeting(x, (y + 1), obj_minecartRail_Slope)
    {
        with (instance_place(x, (y + 1), obj_minecartRail_Slope))
        {
            var slope_acceleration = abs(image_yscale) / abs(image_xscale)
            if (_xscale == sign(image_xscale))
            {
                if (other.movespeed > 3)
                    other.movespeed -= (0.15 * slope_acceleration)
            }
            else if (_xscale == (-sign(image_xscale)))
            {
                if (other.movespeed < 15)
                    other.movespeed += (0.1 * slope_acceleration)
            }
        }
    }
    if (move == 0 && movespeed < 3)
        movespeed += 0.1
    if (move != 0 && move != xscale && movespeed > 2 && Dashpad_buffer <= 0)
        movespeed -= 0.05
    if (move != 0 && move == xscale && movespeed < 12)
        movespeed += 0.1
    movespeed = clamp(movespeed, 0, 15)
    hsp = xscale * movespeed
    if (room == mines_13 && movespeed < 11)
        movespeed = 11
    if (movespeed >= 12 && (!instance_exists(obj_chargeeffect)))
        instance_create((x + 32 * xscale), y, obj_chargeeffect)
    if (scr_solid((x + xscale), y) && (!(place_meeting((x + xscale), (y + 1), obj_minecartRail_Slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))) && (!(place_meeting((x + xscale), y, obj_metalblock))))
    {
        if (character == "N")
        {
            if grounded
                sprite_index = spr_pizzano_mach3hitwall
            else
                sprite_index = spr_pizzano_mach3hitwallair
        }
        else
            sprite_index = spr_player_mach3hitwall
        state = states.bump
        hsp = 2.5 * (-xscale)
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create(x, y, obj_bombexplosionharmless)
        audio_stop_sound(sfx_railgrind)
        for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
        {
            with (instance_create((x + (irandom_range(-9, 9))), (y + (irandom_range(-9, 9))), obj_debris))
            {
                sprite_index = spr_minecartdebris
                image_index = i
                vsp = floor(random_range(-5, -9))
                hsp = floor(random_range(-5, 7))
            }
        }
    }
    if (input_buffer_jump < 8 && grounded)
    {
        vsp = -10
        image_index = 0
        sprite_index = spr_pl_minecartjump
        input_buffer_jump = 8
    }
    if (grounded && (!(place_meeting(x, (y + 1), obj_minecartRail))) && (!(place_meeting(x, (y + 1), obj_minecartRail_Slope))))
    {
        movespeed -= 0.4
        if (movespeed <= 0)
        {
            with (instance_create(x, y, obj_dummycart))
                image_xscale = other.xscale
            state = states.machslide
            vsp = -8
            movespeed = 6
            if (character == "N")
                sprite_index = spr_pizzano_outofcontrolfall
            else
                sprite_index = spr_player_hurtroll
        }
    }
    var groundedlandsprite = (movespeed >= 12 ? spr_pl_minecartfastland : spr_pl_minecartland)
    var groundedsprite = (movespeed >= 12 ? spr_pl_minecartfast : spr_pl_minecart)
    if (!grounded)
    {
        if (sprite_index == spr_pl_minecart || sprite_index == spr_pl_minecartfast || sprite_index == groundedlandsprite)
            sprite_index = spr_pl_minecartfall
        if (sprite_index == spr_pl_minecartjump && animation_end())
            sprite_index = spr_pl_minecartfall
    }
    if grounded
    {
        if ((sprite_index == spr_pl_minecartfall || sprite_index == spr_pl_minecartjump) && vsp > 0)
        {
            sprite_index = groundedlandsprite
            image_index = 0
        }
        if (sprite_index == groundedlandsprite && animation_end())
            sprite_index = groundedsprite
        if (sprite_index == spr_pl_minecartfastland && animation_end())
            sprite_index = groundedsprite
        if (sprite_index == spr_pl_minecartland && animation_end())
            sprite_index = groundedsprite
        if (sprite_index != groundedsprite && (sprite_index == spr_pl_minecartfast || sprite_index == spr_pl_minecart))
            sprite_index = groundedsprite
    }
    if ((!grounded) && input_buffer_slap < 8 && character == "N" && sprite_index != spr_pizzano_mach3hitwall && sprite_index != spr_pizzano_mach3hitwallair)
    {
        audio_stop_sound(sfx_railgrind)
        state = states.minecartspin
        vsp = -5
        scr_sound(sound_suplex1)
        sprite_index = spr_pizzano_minecartspin
        movespeed = hsp + 1
        input_buffer_slap = 8
    }
    if (sprite_index == spr_pl_minecartfast || sprite_index == spr_pl_minecart)
        image_speed = clamp((0.5 * (movespeed / 12)), 0.35, 0.6)
    else
        image_speed = 0.35
}

