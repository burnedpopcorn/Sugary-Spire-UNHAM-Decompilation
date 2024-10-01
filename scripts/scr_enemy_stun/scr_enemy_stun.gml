function scr_enemy_stun()
{
    static cloudbuffer = 0;
    
    if (stunned > 0 && !thrown)
        stunned--;
    
    sprite_index = stunfallspr;
    image_speed = 0.35;
    
    if ((grounded || (grounded && !place_meeting(x, y, obj_platform))) && vsp > 0)
    {
        hsp = 0;
        
        if (thrown && hp <= 0 && object_index != obj_noisecrusher)
            instance_destroy();
        
        if (object_index == obj_noisecrusher && hp <= 0 && thrown)
        {
            alarm[0] = 100;
            alarm[3] = 20;
            stunned = 500;
            flash = true;
            vsp = -5;
            hsp = -image_xscale * 5;
            instance_create(x, y, obj_slapstar);
            instance_create(x, y, obj_slapstar);
            instance_create(x, y, obj_slapstar);
            instance_create(x, y, obj_baddiegibs);
            instance_create(x, y, obj_baddiegibs);
            instance_create(x, y, obj_baddiegibs);
            
            with (obj_camera)
            {
                shake_mag = 3;
                shake_mag_acc = 3 / room_speed;
            }
            
            hp = 5;
            thrown = false;
        }
        
        if (hp > 0)
            thrown = false;
    }
    
    if ((grounded || (grounded && !place_meeting(x, y, obj_cottonplatform))) && vsp > 0)
    {
        hsp = 0;
        
        if (thrown && hp <= 0 && object_index != obj_noisecrusher)
            instance_destroy();
        
        if (object_index == obj_noisecrusher && hp <= 0 && thrown)
        {
            alarm[0] = 100;
            alarm[3] = 20;
            stunned = 500;
            flash = true;
            vsp = -5;
            hsp = -image_xscale * 5;
            instance_create(x, y, obj_slapstar);
            instance_create(x, y, obj_slapstar);
            instance_create(x, y, obj_slapstar);
            instance_create(x, y, obj_baddiegibs);
            instance_create(x, y, obj_baddiegibs);
            instance_create(x, y, obj_baddiegibs);
            
            with (obj_camera)
            {
                shake_mag = 3;
                shake_mag_acc = 3 / room_speed;
            }
            
            hp = 5;
            thrown = false;
        }
        
        if (hp > 0)
            thrown = false;
    }
    
    if (place_meeting(x, y + 1, obj_railh))
        hsp = -5;
    else if (place_meeting(x, y + 1, obj_railh2))
        hsp = 5;
    
    if (scr_solid(x + -image_xscale, y) && !thrown && !place_meeting(x + -image_xscale, y, obj_slope) && !place_meeting(x + -image_xscale, y, obj_slopeplatform))
    {
        with (instance_create(x, y, obj_bulletimpact))
            image_xscale = -other.image_xscale;
        
        grav = 0.5;
        image_xscale *= -1;
        hsp = -image_xscale * 4;
    }
    
    if (scr_solid(x + -image_xscale, y) && thrown && !place_meeting(x + -image_xscale, y, obj_destructibles) && !place_meeting(x + -image_xscale, y, obj_slope) && !place_meeting(x + -image_xscale, y, obj_slope))
    {
        with (instance_create(x, y, obj_bulletimpact))
            image_xscale = -other.image_xscale;
        
        instance_destroy();
    }
    
    if (flyup && thrown)
    {
        if (place_meeting(x, y - 1, obj_solid) && !place_meeting(x - 1, y, obj_destructibles))
        {
            with (instance_create(x, y, obj_bulletimpact))
                image_xscale = -other.image_xscale;
            
            instance_destroy();
        }
        
        if (place_meeting(x, y + vsp, obj_solid) && !place_meeting(x + vsp, y, obj_destructibles))
        {
            with (instance_create(x, y, obj_bulletimpact))
                image_xscale = -other.image_xscale;
            
            instance_destroy();
        }
    }
    
    if ((grounded && stunned <= 0) && object_index != obj_babybear)
    {
        image_index = 0;
        
        if (object_index != obj_charger && object_index != obj_swedishfish)
        {
            movespeed = 1;
            state = baddiestates.walk;
            sprite_index = walkspr;
        }
        else
        {
            sprite_index = idlespr;
            state = baddiestates.idle;
        }
    }
    
    if ((grounded && stunned <= 0) && object_index == obj_babybear)
    {
        image_index = 0;
        movespeed = 5;
        state = baddiestates.walk;
        sprite_index = walkspr;
        vsp -= 8;
    }
    
    if (flyup && vsp > -20 && thrown)
        vsp = -20;
    
    if (thrown)
    {
        if (cloudbuffer > 0)
        {
            cloudbuffer--;
        }
        else
        {
            cloudbuffer = 5;
            instance_create(x, y, obj_cloudeffect);
        }
        
        if (!flyup)
        {
            hsp = 20 * -image_xscale;
            
            if (place_meeting(x + sign(hsp), y, obj_destructibles))
            {
                with (instance_place(x + sign(hsp), y, obj_destructibles))
                {
                    DestroyedBy = other.id;
                    event_user(0);
                }
            }
            
            if (place_meeting(x + -image_xscale, y, obj_destructibles))
            {
                with (instance_place(x + -image_xscale, y, obj_destructibles))
                {
                    DestroyedBy = other.id;
                    event_user(0);
                }
            }
            
            if (place_meeting(x + hsp, y, obj_destructibles))
            {
                with (instance_place(x + hsp, y, obj_destructibles))
                {
                    DestroyedBy = other.id;
                    event_user(0);
                }
            }
        }
        else
        {
            if (place_meeting(x - 1, y, obj_destructibles))
            {
                with (instance_place(x - 1, y, obj_destructibles))
                {
                    DestroyedBy = other.id;
                    event_user(0);
                }
            }
            
            if (place_meeting(x + vsp, y, obj_destructibles))
            {
                with (instance_place(x + vsp, y, obj_destructibles))
                {
                    DestroyedBy = other.id;
                    event_user(0);
                }
            }
        }
    }
}
/*
function scr_enemy_stun()
{
	stunned--;
	sprite_index = stunfallspr;
	image_speed = 0.35;
	if ((grounded || (grounded && !place_meeting(x, y, obj_platform))) && vsp > 0)
	{
		hsp = 0;
		if (thrown && hp <= 0 && object_index != obj_noisecrusher)
			instance_destroy();
		if (object_index == obj_noisecrusher && hp <= 0 && thrown)
		{
			alarm[0] = 100;
			alarm[3] = 20;
			stunned = 500;
			flash = true;
			vsp = -5;
			hsp = -image_xscale * 5;
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_baddiegibs);
			instance_create(x, y, obj_baddiegibs);
			instance_create(x, y, obj_baddiegibs);
			with (obj_camera)
			{
				shake_mag = 3;
				shake_mag_acc = 3 / room_speed;
			}
			hp = 5;
			thrown = false;
		}
		if (hp > 0)
			thrown = false;
	}
	if ((grounded || (grounded && !place_meeting(x, y, obj_cottonplatform))) && vsp > 0)
	{
		hsp = 0;
		if (thrown && hp <= 0 && object_index != obj_noisecrusher)
			instance_destroy();
		if (object_index == obj_noisecrusher && hp <= 0 && thrown)
		{
			alarm[0] = 100;
			alarm[3] = 20;
			stunned = 500;
			flash = true;
			vsp = -5;
			hsp = -image_xscale * 5;
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_baddiegibs);
			instance_create(x, y, obj_baddiegibs);
			instance_create(x, y, obj_baddiegibs);
			with (obj_camera)
			{
				shake_mag = 3;
				shake_mag_acc = 3 / room_speed;
			}
			hp = 5;
			thrown = false;
		}
		if (hp > 0)
			thrown = false;
	}
	if (place_meeting(x, y + 1, obj_railh))
		hsp = -5;
	else if (place_meeting(x, y + 1, obj_railh2))
		hsp = 5;
	if (((scr_solid(x + 1, y) && image_xscale == -1) || (scr_solid(x - 1, y) && image_xscale == 1)) && !thrown)
	{
		with (instance_create(x, y, obj_bulletimpact))
			image_xscale = -other.image_xscale;
		grav = 0.5;
		image_xscale *= -1;
		hsp = -image_xscale * 4;
	}
	if (((scr_solid(x + 1, y) && image_xscale == -1) || (scr_solid(x - 1, y) && image_xscale == 1)) && thrown)
	{
		with (instance_create(x, y, obj_bulletimpact))
			image_xscale = -other.image_xscale;
		instance_destroy();
	}
	if ((grounded && stunned < 0) && object_index != obj_babybear)
	{
		image_index = 0;
		if (object_index != obj_charger && object_index != obj_swedishfish)
		{
			movespeed = 1;
			state = baddiestates.walk;
			sprite_index = walkspr;
		}
		else
		{
			sprite_index = idlespr;
			state = baddiestates.idle;
		}
	}
	if ((grounded && stunned < 0) && object_index == obj_babybear)
	{
		image_index = 0;
		movespeed = 5;
		state = baddiestates.walk;
		sprite_index = walkspr;
		vsp -= 8;
	}
}
