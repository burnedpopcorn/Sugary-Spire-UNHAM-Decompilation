function scr_player_bossintro()
{
    static Walkbuffer = 0;
    
    hsp = movespeed * xscale;
    
    if (movespeed < 7)
        movespeed += 0.5;
    
    x += hsp;
    
    if (hsp != 0)
        sprite_index = spr_move;
    
    if (Walkbuffer < 40)
    {
        Walkbuffer++;
    }
    else
    {
        Walkbuffer = 0;
        state = states.normal//UnknownEnum.Value_0;
    }
    
    if (steppybuffer > 0)
    {
        steppybuffer--;
    }
    else if (!audio_is_playing(sound_step))
    {
        scr_sound(sound_step);
        steppybuffer = 12;
    }
    
    if (movespeed < 3)
        image_speed = 0.35;
    else if (movespeed > 3 && movespeed < 6)
        image_speed = 0.45;
    else
        image_speed = 0.6;
    
    grounded = 1;
}
//
/*
function scr_player_bossintro()
{
	hsp = 0;
	xscale = 1;
	hurted = false;
	inv_frames = 0;
	if (sprite_index == spr_player_bossintro && floor(image_index) == (image_number - 1))
	{
		state = states.normal;
		image_index = 0;
	}
	if (sprite_index == spr_player_levelcomplete && floor(image_index) == (image_number - 1))
		image_speed = 0;
	else
		image_speed = 0.35;
}
