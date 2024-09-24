function scr_scareenemy()
{
	if (point_in_rectangle(x, y, obj_player.x - 400, obj_player.y - 60, obj_player.x + 400, obj_player.y + 60) && (obj_player.state == states.mach3 || (obj_player.movespeed >= 10 && obj_player.state == states.minecart)))
	{
		if (state != baddiestates.scared)
		{
			state = baddiestates.scared;
			sprite_index = scaredspr;
			if (x != obj_player.x)
				image_xscale = -sign(x - obj_player.x);
			hsp = 0;
			if (grav != 0 && grounded)
				vsp = -3;
			image_index = 0;
		}
		ScareBuffer = clamp(ScareBuffer++, 50, 80);
	}
	ScareBuffer--;
	if (ScareBuffer <= 0 && state == baddiestates.scared)
	{
		state = baddiestates.walk;
		sprite_index = walkspr;
		ScareBuffer = 0;
	}
}

/*
function scr_scareenemy() //scr_scareenemy
{
    if (point_in_rectangle(x, y, (obj_player.x - 400), (obj_player.y - 60), (obj_player.x + 400), (obj_player.y + 60)) && (obj_player.state == states.mach3 || obj_player.state == states.pizzano || (obj_player.movespeed >= 10 && (obj_player.state == states.minecart || obj_player.state == states.minecartspin)) || (obj_player.state == states.jump && sprite_index == spr_playerPZ_scooterspin) || (obj_player.sprite_index == spr_player_swingding && state != states.boxxedpep) || (obj_player.state == states.machroll && (obj_player.sprite_index == spr_playerPZ_backslide || obj_player.character == "N")) || obj_player.sprite_index == spr_player_machtumble || audio_is_playing(sfx_pizzanoscreamstart) || audio_is_playing(sfx_pizzanoscream)) && state != states.meteorpep)
    {
        if (state != states.pistolaim)
        {
            state = states.pistolaim
            sprite_index = scaredspr
            if (x != obj_player.x)
                image_xscale = (-(sign(x - obj_player.x)))
            hsp = 0
            if (grav != 0 && grounded)
                vsp = -3
            image_index = 0
        }
        ScareBuffer = clamp(ScareBuffer++, 50, 80)
    }
    ScareBuffer--
    if (ScareBuffer <= 0 && state == states.pistolaim)
    {
        state = states.slap
        sprite_index = walkspr
        ScareBuffer = 0
    }
}

