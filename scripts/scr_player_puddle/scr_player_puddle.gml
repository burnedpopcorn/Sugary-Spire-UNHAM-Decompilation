function scr_player_puddle() //scr_player_puddle
{
    hsp = xscale * movespeed
    if (scr_solid((x + xscale), y) && (!(scr_slope_ext((x + xscale), (y + 1)))) && (!(place_meeting((x + xscale), y, obj_destructibles))) && (!(place_meeting((x + xscale), y, obj_metalblock))))
    {
        instance_create(x, y, obj_bangeffect)
        xscale = (-xscale)
        if (character == "N")
            sprite_index = spr_pizzano_outofcontrolfall
        else
            sprite_index = spr_player_outofcontrolfall
        scr_sound(choose(slipnslide1, slipnslide2, slipnslide3, slipnslide4, slipnslide5, slipnslide6, slipnslide7, slipnslide8))
    }
    if (sprite_index == spr_player_slipnslidestart || sprite_index == spr_player_outofcontrolfall || sprite_index == spr_pizzano_outofcontrolfall || sprite_index == spr_pizzano_sleepstart || sprite_index == spr_player_slipnslide)
    {
        if (grounded && vsp > -1 && (!(place_meeting((x + 1), y, obj_destructibles))) && (!(place_meeting(x, (y + 1), obj_metalblock))))
        {
            if (sprite_index == spr_player_slipnslidestart || sprite_index == spr_pizzano_sleepstart || sprite_index == spr_player_slipnslide)
            {
                if (character == "N")
                    sprite_index = spr_pizzano_outofcontrolfall
                else
                    sprite_index = spr_player_outofcontrolfall
                image_index = 0
                image_speed = 0.35
                vsp = -7
                movespeed /= 1.2
                instance_create(x, y, obj_bangeffect)
                scr_sound(choose(slipnslide1, slipnslide2, slipnslide3, slipnslide4, slipnslide5, slipnslide6, slipnslide7, slipnslide8))
            }
            else
            {
                if (character == "N")
                    sprite_index = spr_pizzano_sleepend
                else
                    sprite_index = spr_player_slipnslideend
                image_index = 0
                image_speed = 0.35
                scr_sound(choose(slipnslideend, slipnslideend2, slipnslideend3))
            }
        }
    }
    else if (sprite_index == spr_player_slipnslideend || sprite_index == spr_pizzano_sleepend)
    {
        image_speed = 0.35
        movespeed -= 0.5
        if (movespeed <= 0)
            state = states.normal
        if (!grounded)
        {
            if (character == "N")
                sprite_index = spr_pizzano_outofcontrolfall
            else
                sprite_index = spr_player_outofcontrolfall
        }
    }
    if (animation_end() && (sprite_index == spr_player_slipnslidestart || sprite_index == spr_player_slipnslideend))
        sprite_index = spr_player_slipnslide
    if (animation_end() && (sprite_index == spr_pizzano_sleepstart || sprite_index == spr_pizzano_sleepend))
        image_speed = 0
    else if (sprite_index == spr_player_outofcontrolfall || sprite_index == spr_pizzano_outofcontrolfall)
        image_speed = (clamp((movespeed / 15), 0.3, 1)) * 0.6
    else if (sprite_index == spr_pizzano_sleepstart && image_index >= 4)
        image_speed = 0.5
    else
        image_speed = 0.35
    var _xscale = xscale
    if place_meeting(x, (y + 1), obj_slope)
    {
        with (instance_place(x, (y + 1), obj_slope))
        {
            var slope_acceleration = abs(image_yscale) / abs(image_xscale)
            if (_xscale == sign(image_xscale))
            {
                if (other.movespeed > 3)
                    other.movespeed -= (0.5 * slope_acceleration)
                else
                {
                    other.movespeed = 3
                    other.xscale = (-sign(image_xscale))
                }
            }
            else if (_xscale == (-sign(image_xscale)))
            {
                if (other.movespeed < 12)
                    other.movespeed += (1 * slope_acceleration)
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
                if (other.movespeed > 3)
                    other.movespeed -= (0.5 * slope_acceleration)
                else
                {
                    other.movespeed = 3
                    other.xscale = (-sign(image_xscale))
                }
            }
            else if (_xscale == (-sign(image_xscale)))
            {
                if (other.movespeed < 12)
                    other.movespeed += (1 * slope_acceleration)
            }
        }
    }
}

