function cutscene_rosetteMines_prestart()
{
    var finished, plus_y;
    
    static diveBuffer = 0;
    
    finished = false;
    
    with (obj_player)
    {
        if (grounded)
        {
            if (sprite_index == spr_playerPZ_poundcancel1 || sprite_index == spr_playerPZ_poundcancelprep)
            {
                sprite_index = spr_playerPZ_poundcancel2;
                image_index = 0;
                instance_create(x, y, obj_landcloud);
                scr_sound(sound_maximumspeedland);
                
                if (instance_exists(obj_groundpoundeffect))
                    instance_destroy(obj_groundpoundeffect);
                
                with (obj_camera)
                {
                    shake_mag = 5;
                    shake_mag_acc = 15 / room_speed;
                }
                
                if (smashbodyslam >= 20)
                {
                    with (obj_camera)
                    {
                        shake_mag = 10;
                        shake_mag_acc = 30 / room_speed;
                    }
                }
            }
            else if (sprite_index == spr_pizzano_bodyslamfall || sprite_index == spr_pizzano_bodyslamprep)
            {
                sprite_index = spr_pizzano_bodyslamland;
                image_index = 0;
                instance_create(x, y, obj_landcloud);
                scr_sound(sound_maximumspeedland);
                
                with (obj_camera)
                {
                    shake_mag = 5;
                    shake_mag_acc = 15 / room_speed;
                }
                
                if (smashbodyslam >= 20)
                {
                    with (obj_camera)
                    {
                        shake_mag = 10;
                        shake_mag_acc = 30 / room_speed;
                    }
                }
            }
            else if (sprite_index == spr_pizzano_poundcancel || sprite_index == spr_pizzano_poundcancelprep)
            {
                sprite_index = spr_pizzano_poundcancelland;
                image_index = 0;
                instance_create(x, y, obj_landcloud);
                scr_sound(sound_maximumspeedland);
                
                if (instance_exists(obj_groundpoundeffect))
                    instance_destroy(obj_groundpoundeffect);
                
                with (obj_camera)
                {
                    shake_mag = 5;
                    shake_mag_acc = 15 / room_speed;
                }
                
                if (smashbodyslam >= 20)
                {
                    with (obj_camera)
                    {
                        shake_mag = 10;
                        shake_mag_acc = 30 / room_speed;
                    }
                }
            }
            else if (sprite_index == spr_player_bodyslamfall || sprite_index == spr_player_bodyslamstart)
            {
                sprite_index = spr_player_bodyslamland;
                image_index = 0;
                instance_create(x, y, obj_landcloud);
                scr_sound(sound_maximumspeedland);
                
                if (instance_exists(obj_groundpoundeffect))
                    instance_destroy(obj_groundpoundeffect);
                
                with (obj_camera)
                {
                    shake_mag = 5;
                    shake_mag_acc = 15 / room_speed;
                }
                
                if (smashbodyslam >= 20)
                {
                    with (obj_camera)
                    {
                        shake_mag = 10;
                        shake_mag_acc = 30 / room_speed;
                    }
                }
            }
            else if (sprite_index == spr_player_suplexdashCancel)
            {
                sprite_index = spr_fall;
            }
            else if (sprite_index == spr_fall)
            {
                sprite_index = spr_land;
                image_index = 0;
                instance_create_depth(x, y, 0, obj_landcloud);
                scr_sound(sound_step);
            }
            
            if (state == states.mach3 || ((state == states.mach2 || state == states.machroll || state == states.crouchslide) && movespeed >= 8))
            {
                sprite_index = spr_machslidestart;
                scr_sound(sound_break);
                image_index = 0;
            }
            else if (state != states.actor)
            {
                sprite_index = spr_idle;
            }
            
            if (animation_end() && sprite_index == spr_machslidestart)
                sprite_index = spr_machslide;
            
            if (sprite_index == spr_machslide && floor(hsp) == 0)
            {
                sprite_index = spr_machslideend;
                image_index = 0;
            }
            
            if (sprite_index == spr_machslide || sprite_index == spr_machslidestart || sprite_index == spr_machslideend)
            {
                if (!instance_exists(obj_slidecloud))
                    instance_create(x, y, obj_slidecloud);
                
                if (abs(hsp) > 0)
                    hsp = approach(hsp, 0, 0.4);
            }
            
            if (((animation_end() && (sprite_index == spr_playerPZ_poundcancel2 || sprite_index == spr_pizzano_bodyslamland || sprite_index == spr_pizzano_poundcancelland || sprite_index == spr_player_bodyslamland || sprite_index == spr_land)) || sprite_index == spr_machslideend) || sprite_index == spr_idle || (sprite_index == spr_dive && grounded))
                finished = true;
            
            if ((sprite_index == spr_pizzano_poundcancelprep || sprite_index == spr_playerPZ_poundcancelprep) && vsp > 0)
                vsp = 0;
            
            if (sprite_index == spr_playerPZ_poundcancel1 || sprite_index == spr_pizzano_bodyslamfall || sprite_index == spr_pizzano_poundcancel || sprite_index == spr_player_bodyslamfall)
            {
                if (vsp > 0)
                    smashbodyslam++;
                
                if (vsp > 2)
                    vsp++;
                
                plus_y = 0;
                
                if (sprite_index == spr_playerPZ_poundcancel1)
                    plus_y = 8;
                
                if (smashbodyslam > 10 && !instance_exists(obj_groundpoundeffect))
                {
                    with (instance_create_depth(x, y + plus_y, -6, obj_groundpoundeffect))
                        plusy = plus_y;
                }
            }
        }
        else
        {
            if (state != states.jump && state != states.actor)
            {
                if (state != states.handstandjump && state != states.freefall && state != states.freefallprep)
                {
                    if (state == states.mach2 || state == states.pizzano || state == states.pizzano)
                    {
                        diveBuffer = irandom_range(2, 6);
                        sprite_index = spr_dive;
                        vsp = 10;
                    }
                    else
                    {
                        image_index = 0;
                        
                        if (character == "N")
                            sprite_index = spr_pizzano_poundcancelprep;
                        else
                            sprite_index = spr_player_bodyslamstart;
                        
                        vsp = -7;
                        smashbodyslam = 0;
                    }
                }
                else if (state == states.handstandjump)
                {
                    sprite_index = spr_player_suplexdashCancel;
                    image_index = 0;
                    xscale *= -1;
                    
                    if (audio_is_playing(sound_suplex1))
                        audio_stop_sound(sound_suplex1);
                }
            }
            
            if (animation_end())
            {
                switch (sprite_index)
                {
                    case spr_pizzano_bodyslamprep:
                        sprite_index = spr_pizzano_bodyslamfall;
                        image_index = 0;
                        break;
                    
                    case spr_playerPZ_poundcancelprep:
                        sprite_index = spr_playerPZ_poundcancel1;
                        image_index = 0;
                        break;
                    
                    case spr_pizzano_poundcancelprep:
                        sprite_index = spr_pizzano_poundcancel;
                        image_index = 0;
                        break;
                    
                    case spr_player_bodyslamstart:
                        sprite_index = spr_player_bodyslamfall;
                        image_index = 0;
                        break;
                }
            }
            
            if (sprite_index != spr_dive)
            {
                hsp = 0;
            }
            else
            {
                vsp = 10;
                
                if (diveBuffer > 0)
                {
                    diveBuffer--;
                }
                else
                {
                    image_index = 0;
                    
                    if (character == "N")
                        sprite_index = spr_pizzano_poundcancelprep;
                    else
                        sprite_index = spr_player_bodyslamstart;
                    
                    vsp = -7;
                    smashbodyslam = 0;
                }
            }
        }
        
        image_speed = 0.35;
        state = states.actor;
    }
    
    if (finished)
    {
        cutscene_event_end();
        
        if (instance_exists(obj_groundpoundeffect))
            instance_destroy(obj_groundpoundeffect);
    }
}

function cutscene_rosetteMines_start()
{
    var finished, target_x;
    
    finished = false;
    target_x = obj_rosette.x - 64;
    
    with (obj_player)
    {
        image_speed = 0.35;
        
        if (-sign(x - target_x) != 0)
            xscale = -sign(x - target_x);
        
        if (movespeed < 7)
            movespeed += 0.5;
        else if (floor(movespeed) >= 7)
            movespeed = 7;
        
        hsp = lengthdir_x(movespeed, point_direction(x, 0, target_x, 0));
        
        if (hsp != 0)
        {
            if (movespeed < 3 && move != 0)
                image_speed = 0.35;
            else if (movespeed > 3 && movespeed < 6)
                image_speed = 0.45;
            else
                image_speed = 0.6;
            
            if (character == "P")
            {
                if ((angry == 1 || global.combo >= 25) && global.combo < 50)
                    sprite_index = spr_playerPZ_3hpwalk;
                else if (global.combo >= 50)
                    sprite_index = spr_playerPZ_ragemove;
                else
                    sprite_index = spr_move;
            }
            else
            {
                sprite_index = spr_move;
            }
        }
        
        if (point_distance(x, 0, target_x, 0) <= 7 && grounded)
        {
            movespeed = 0;
            hsp = 0;
            vsp = 0;
            image_speed = 0.35;
            x = target_x;
            
            if (-sign(x - obj_rosette.x) != 0)
                xscale = -sign(x - obj_rosette.x);
            
            finished = true;
        }
    }
    
    global.combotime = 60;
    global.combofreeze = 30;
    
    if (finished)
    {
        obj_rosette.sprite_index = spr_rosettegivetreat;
        obj_rosette.image_index = 0;
        cutscene_event_end();
    }
}

function cutscene_rosetteMines_middle()
{
    var finished;
    
    finished = false;
    
    with (obj_player)
    {
        image_speed = 0.35;
        
        if (character == "P")
        {
            if (instance_exists(obj_coneball))
                sprite_index = spr_timesupidle;
            else if (global.panic)
                sprite_index = spr_escapeidle;
            else
                sprite_index = spr_idle;
        }
        else
        {
            sprite_index = spr_idle;
        }
    }
    
    with (obj_rosette)
    {
        sprite_index = spr_rosettegivetreat;
        
        if (animation_end())
            finished = true;
    }
    
    if (finished)
    {
        if (obj_player.character == "P")
        {
            obj_player.sprite_index = spr_player_donutget;
        }
        else
        {
            obj_player.sprite_index = spr_pizzano_eatdonut;
            
            with (instance_create(obj_player.x + 10, obj_player.y, obj_boxdebris))
                box = 1;
        }
        
        obj_player.image_index = 0;
        obj_rosette.sprite_index = spr_rosettegavetreat;
        cutscene_event_end();
    }
}

function cutscene_rosetteMines_grab()
{
    var finished;
    
    finished = false;
    
    with (obj_player)
    {
        image_speed = 0.35;
        
        if (character == "P")
        {
            sprite_index = spr_player_donutget;
        }
        else
        {
            sprite_index = spr_pizzano_eatdonut;
            
            with (instance_create(obj_player.x + 10, obj_player.y, obj_boxdebris))
                box = 1;
        }
        
        if (animation_end())
            finished = true;
    }
    
    if (finished)
        cutscene_event_end();
}

function cutscene_rosetteMines_end()
{
    global.treat = true;
    
    with (obj_player)
        state = states.normal//UnknownEnum.Value_0;
    
    with (obj_boxdebris)
        box = 0;
    
    cutscene_event_end();
}

//
/*
function cutscene_rosetteMines_prestart()
{
	var finished = false;
	with (obj_player)
	{
		state = states.actor;
		image_speed = 0.35;
		if (grounded)
		{
			if (sprite_index == spr_fall)
			{
				image_index = 0;
				sprite_index = spr_land;
			}
			if (sprite_index != spr_land || (sprite_index == spr_land && animation_end()))
				finished = true;
		}
		else
		{
			hsp = approach(hsp, 0, 1);
			sprite_index = spr_fall;
		}
	}
	if (finished)
		cutscene_event_end();
}
function cutscene_rosetteMines_start()
{
	var finished = false;
	var target_x = obj_rosette.x - 64;
	with (obj_player)
	{
		image_speed = 0.35;
		if (-sign(x - target_x) != 0)
			xscale = -sign(x - target_x);
		if (movespeed < 7)
			movespeed += 0.5;
		else if (floor(movespeed) >= 7)
			movespeed = 7;
		hsp = lengthdir_x(movespeed, point_direction(x, 0, target_x, 0));
		if (hsp != 0)
		{
			if (movespeed < 3 && move != 0)
				image_speed = 0.35;
			else if (movespeed > 3 && movespeed < 6)
				image_speed = 0.45;
			else
				image_speed = 0.6;
			sprite_index = spr_move;
		}
		if (point_distance(x, 0, target_x, 0) <= 7 && grounded)
		{
			movespeed = 0;
			hsp = 0;
			vsp = 0;
			image_speed = 0.35;
			x = target_x;
			if (-sign(x - obj_rosette.x) != 0)
				xscale = -sign(x - obj_rosette.x);
			finished = true;
		}
	}
	if (finished)
	{
		obj_rosette.sprite_index = spr_rosettegivetreat;
		obj_rosette.image_index = 0;
		cutscene_event_end();
	}
}
function cutscene_rosetteMines_middle()
{
	var finished = false;
	with (obj_player)
	{
		image_speed = 0.35;
		sprite_index = spr_idle;
	}
	with (obj_rosette)
	{
		sprite_index = spr_rosettegivetreat;
		if (animation_end())
			finished = true;
	}
	if (finished)
	{
		obj_player.sprite_index = spr_player_donutget;
		obj_player.image_index = 7;
		obj_rosette.sprite_index = spr_rosettegavetreat;
		cutscene_event_end();
	}
}
function cutscene_rosetteMines_grab()
{
	var finished = false;
	with (obj_player)
	{
		image_speed = 0.35;
		sprite_index = spr_player_donutget;
		if (animation_end())
			finished = true;
	}
	if (finished)
		cutscene_event_end();
}
function cutscene_rosetteMines_end()
{
	global.treat = true;
	with (obj_player)
		state = states.normal;
	cutscene_event_end();
}
