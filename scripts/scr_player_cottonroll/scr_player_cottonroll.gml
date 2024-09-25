function scr_player_cottonroll()
{
    var _xscale, slope_acceleration;
    
    static cotton_afterimagetimer = 6;
    
    if (movespeed >= 9)
        sprite_index = spr_cottonmaxroll;
    else
        sprite_index = spr_cottonroll;
    
    hsp = xscale * movespeed;
    dir = xscale;
    momemtum = true;
    
    if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_chocofrogbig))
    {
        xscale *= -1;
        movespeed /= 2;
        instance_create(x, y, obj_bangeffect);
    }
    
    if (movespeed < 3)
        movespeed = 3;
    
    if (grounded && !key_down && movespeed < 9 && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
    {
        state = states.cotton;
        sprite_index = spr_cottonidle;
        momemtum = true;
    }
    
    if (input_buffer_jump < 8 && !grounded)
    {
        momemtum = true;
        state = states.cotton;
        vsp = -10;
        grav = 0.1;
        image_index = 0;
        sprite_index = spr_cottondoublejump;
        
        with (instance_create(x, y, obj_highjumpcloud2))
        {
            image_xscale = other.xscale;
            
            if (other.character == "N")
                sprite_index = spr_pizzano_cottonpoof;
            else
                sprite_index = spr_cottonpoof;
        }
        
        scr_sound(sound_jump);
        input_buffer_jump = 8;
    }
    
    if (input_buffer_jump < 8 && grounded && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
    {
        momemtum = true;
        state = states.cotton;
        vsp = -14;
        grav = 0.025;
        image_index = 0;
        sprite_index = spr_cottonpljump;
        instance_create(x, y, obj_highjumpcloud2);
        scr_sound(sound_jump);
        input_buffer_jump = 8;
    }
    
    _xscale = xscale;
    
    if (place_meeting(x, y + 1, obj_slope))
    {
        with (instance_place(x, y + 1, obj_slope))
        {
            slope_acceleration = abs(image_yscale) / abs(image_xscale);
            
            if (_xscale == sign(image_xscale))
            {
                if (room != steamy_7)
                {
                    if (other.movespeed > 3)
                    {
                        other.movespeed -= (0.35 * slope_acceleration);
                    }
                    else
                    {
                        other.movespeed = 3;
                        other.xscale = -sign(image_xscale);
                    }
                }
                else if (room == steamy_7)
                {
                    if (other.movespeed > 3)
                    {
                        other.movespeed -= (0.25 * slope_acceleration);
                    }
                    else
                    {
                        other.movespeed = 3;
                        other.xscale = -sign(image_xscale);
                    }
                }
            }
            else if (_xscale == -sign(image_xscale))
            {
                if (room != steamy_7)
                {
                    if (other.movespeed < 12)
                        other.movespeed += (0.35 * slope_acceleration);
                }
                else if (room == steamy_7)
                {
                    if (other.movespeed < 12)
                        other.movespeed += (0.25 * slope_acceleration);
                }
            }
        }
    }
    
    if (place_meeting(x, y + 1, obj_slopeplatform))
    {
        with (instance_place(x, y + 1, obj_slopeplatform))
        {
            slope_acceleration = abs(image_yscale) / abs(image_xscale);
            
            if (_xscale == sign(image_xscale))
            {
                if (room != steamy_7)
                {
                    if (other.movespeed > 3)
                    {
                        other.movespeed -= (0.35 * slope_acceleration);
                    }
                    else
                    {
                        other.movespeed = 3;
                        other.xscale = -sign(image_xscale);
                    }
                }
                else if (room == steamy_7)
                {
                    if (other.movespeed > 3)
                    {
                        other.movespeed -= (0.25 * slope_acceleration);
                    }
                    else
                    {
                        other.movespeed = 3;
                        other.xscale = -sign(image_xscale);
                    }
                }
            }
            else if (_xscale == -sign(image_xscale))
            {
                if (room != steamy_7)
                {
                    if (other.movespeed < 12)
                        other.movespeed += (0.35 * slope_acceleration);
                }
                else if (room == steamy_7)
                {
                    if (other.movespeed < 12)
                        other.movespeed += (0.25 * slope_acceleration);
                }
            }
        }
    }
    
    dir = xscale;
    image_speed = 0.35 + ((movespeed / 12) * 0.35);
    
    if (cotton_afterimagetimer > 0)
        cotton_afterimagetimer--;
    
    if (cotton_afterimagetimer <= 0)
    {
        with (instance_create(x, y, obj_cotton_aftereffect))
            playerid = other.id;
        
        cotton_afterimagetimer = 6;
    }
}

// Old Playtest 3.2 code that should NOT be trusted
/*
function scr_player_cottonroll()
{
	image_speed = 0.35;
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	hsp = xscale * movespeed;
	if (sprite_index == spr_cotton_run && floor(image_index) == (image_number - 1))
	{
		sprite_index = spr_cotton_maxrun;
		flash = true;
		movespeed = 13;
	}
	if (sprite_index != spr_cotton_maxrun)
		movespeed += 0.25;
	if (!key_attack)
	{
		state = states.cotton;
		sprite_index = spr_cotton_idle;
		vsp = 0;
		movespeed = 0;
		image_index = 0;
	}
	if ((place_meeting(x + 1, y, obj_solid) || place_meeting(x - 1, y, obj_solid)) && !scr_slope())
	{
		if (sprite_index == spr_cotton_maxrun && grounded)
		{
			state = states.cotton;
			sprite_index = spr_cotton_slam3;
			vsp = -4;
			image_index = 0;
			movespeed = 0;
		}
		else if (sprite_index == spr_cotton_maxrun && !grounded)
		{
			state = states.cotton;
			sprite_index = spr_cotton_slam;
			vsp = -4;
			image_index = 0;
			movespeed = 0;
		}
		else if (sprite_index == spr_cotton_run)
		{
			state = states.cotton;
			sprite_index = spr_cotton_idle;
			vsp = 0;
			movespeed = 0;
			image_index = 0;
		}
	}
	if (grounded && sprite_index == spr_cotton_maxrun && key_jump)
		vsp = -10;
	if (grounded && sprite_index == spr_cotton_run && key_jump)
		vsp = -8;
	if (key_down2 && !grounded && drill && sprite_index == spr_cotton_maxrun)
	{
		vsp = 9;
		state = states.cottondrill;
		sprite_index = spr_cotton_drill;
		image_index = 0;
		scr_sound(sound_suplex1);
		flash = true;
		drill = false;
		with (instance_create(x, y, obj_afterimageoutward))
			hspeed = 7;
		with (instance_create(x, y, obj_afterimageoutward))
			hspeed = -7;
		with (instance_create(x, y, obj_afterimageoutward))
			vspeed = 7;
		with (instance_create(x, y, obj_afterimageoutward))
			vspeed = -7;
	}
}
