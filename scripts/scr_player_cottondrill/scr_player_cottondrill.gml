function scr_player_cottondrill()
{
    static cotton_afterimagetimer = 6;
    
    image_speed = 0.35;
    
    if (dir != xscale)
    {
        dir = xscale;
        movespeed = 0;
    }
    
    move = key_left + key_right;
    
    if (move != 0)
        xscale = move;
    
    hsp = 0;
    sprite_index = spr_cottondrill;
    
    if (grounded)
    {
        if (key_down)
        {
            sprite_index = spr_cottonroll;
            state = states.cottonroll;
            
            if (movespeed < 8)
                movespeed = 8;
            
            if (move != 0)
                xscale = move;
        }
        else
        {
            state = states.cotton;
            sprite_index = spr_cottonland;
            vsp = 0;
            movespeed = 0;
            image_index = 0;
        }
    }
    
    if (input_buffer_slap < 8 && sprite_index != spr_cottonattack && groundedcot)
    {
        state = states.cotton;
        flash = true;
        image_index = 0;
        sprite_index = spr_cottonattack;
        grounded = false;
        vsp = -5;
        grav = 0.2;
        scr_sound(sound_suplex1);
        groundedcot = false;
        input_buffer_slap = 8;
    }
    
    if (input_buffer_jump < 8)
    {
        state = states.cotton;
        vsp = -10;
        grav = 0.1;
        image_index = 0;
        sprite_index = spr_cottondoublejump;
        instance_create(x, y, obj_highjumpcloud2);
        
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
    
    if (cotton_afterimagetimer > 0)
        cotton_afterimagetimer--;
    
    if (cotton_afterimagetimer <= 0)
    {
        with (instance_create(x, y, obj_cotton_aftereffect))
            playerid = other.id;
        
        cotton_afterimagetimer = 6;
    }
}


// OLD Playtest 3.2 code that should NOT be trusted
/*
function scr_player_cottondrill()
{
	image_speed = 0.35;
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	move = key_left + key_right;
	if (move != 0)
		xscale = move;
	hsp = 0;
	sprite_index = spr_cotton_drill;
	if (grounded)
	{
		state = states.cottonroll;
		sprite_index = spr_cotton_land;
		vsp = 0;
		movespeed = 0;
		image_index = 0;
	}
	if (key_slap2 && sprite_index != spr_cotton_attack && groundedcot)
	{
		state = states.cottonroll;
		flash = true;
		image_index = 0;
		sprite_index = spr_cotton_attack;
		grounded = false;
		vsp = -5;
		grav = 0.2;
		scr_sound(sound_suplex1);
		groundedcot = false;
	}
	if (key_jump)
	{
		state = states.cottonroll;
		vsp = -10;
		grav = 0.1;
		image_index = 0;
		sprite_index = spr_cotton_doublejump;
		instance_create(x, y, obj_highjumpcloud2);
		with (instance_create(x, y, obj_highjumpcloud2))
		{
			image_xscale = other.xscale;
			sprite_index = spr_cottonpoof;
		}
		scr_sound(sound_jump);
	}
}
