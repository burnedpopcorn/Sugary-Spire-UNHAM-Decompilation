function scr_player_fireass()
{
    static fire_afterimagetimer = 6;
    
    image_speed = 0.35;
    
    if (place_meeting(x + hsp, y, obj_solid))
        xscale *= -1;
    
    if (sprite_index == spr_player_fireass || sprite_index == spr_pizzano_fireass)
    {
        move = key_left + key_right;
        
        if (move != 0)
            xscale = move;
        
        hsp = move * movespeed;
        movespeed = 4;
        
        if (grounded && vsp > 0)
        {
            movespeed = 6;
            
            if (character == "N")
                sprite_index = spr_pizzano_fireassend;
            else
                sprite_index = spr_player_fireassend;
            
            image_index = 0;
        }
    }
    
    if (sprite_index == spr_player_fireassend || sprite_index == spr_pizzano_fireassend)
    {
        hsp = xscale * movespeed;
        
        if (movespeed > 0)
            movespeed -= 0.25;
        
        if (floor(image_index) == (image_number - 1))
        {
            state = states.normal//UnknownEnum.Value_0;
            hsp = 0;
            image_index = 0;
            alarm[5] = 2;
            alarm[7] = 60;
            hurted = true;
            landAnim = false;
        }
    }
    
    if (fire_afterimagetimer > 0)
        fire_afterimagetimer--;
    
    if (fire_afterimagetimer <= 0 && sprite_index != spr_player_fireassend && sprite_index != spr_pizzano_fireassend)
    {
        with (instance_create(x, y, obj_fire_aftereffect))
            playerid = other.id;
        
        fire_afterimagetimer = 6;
    }
}
// Old Playtest 3.2 code that should NOT be trusted
/*
function scr_player_fireass()
{
	static fire_afterimagetimer = 6;
	image_speed = 0.35;
	if (place_meeting(x + hsp, y, obj_solid))
		xscale *= -1;
	if (sprite_index == spr_player_fireass)
	{
		move = key_left + key_right;
		if (move != 0)
			xscale = move;
		hsp = move * movespeed;
		movespeed = 4;
		if (grounded && vsp > 0)
		{
			movespeed = 6;
			sprite_index = spr_player_fireassend;
			image_index = 0;
		}
	}
	if (sprite_index == spr_player_fireassend)
	{
		hsp = xscale * movespeed;
		if (movespeed > 0)
			movespeed -= 0.25;
		if (floor(image_index) == (image_number - 1))
		{
			state = states.normal;
			hsp = 0;
			image_index = 0;
			alarm[5] = 2;
			alarm[7] = 60;
			hurted = true;
			landAnim = false;
		}
	}
	if (fire_afterimagetimer > 0)
		fire_afterimagetimer--;
	if (fire_afterimagetimer <= 0 && sprite_index != spr_player_fireassend)
	{
		with (instance_create(x, y, obj_fire_aftereffect))
			playerid = other.id;
		fire_afterimagetimer = 6;
	}
}
