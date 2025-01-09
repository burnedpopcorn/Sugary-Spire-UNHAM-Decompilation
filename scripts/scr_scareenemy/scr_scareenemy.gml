function scr_scareenemy()
{
    if (point_in_rectangle(x, y, obj_player.x - 400, obj_player.y - 60, obj_player.x + 400, obj_player.y + 60) && (obj_player.state == states.mach3 || obj_player.state == states.machpizzano || (obj_player.movespeed >= 10 && (obj_player.state == states.minecart || obj_player.state == states.minecartspin)) || (obj_player.state == states.jump && sprite_index == spr_playerPZ_scooterspin) || (obj_player.sprite_index == spr_player_swingding && state != states.boxxedpep) || (obj_player.state == states.machroll && (obj_player.sprite_index == spr_playerPZ_backslide || obj_player.character == "N")) || obj_player.sprite_index == spr_player_machtumble || (state == states.machslide && (sprite_index == spr_playerPZ_machslideboost3 || sprite_index == spr_playerPZ_machslideboost3fall || sprite_index == spr_pizzano_mach3boost || sprite_index == spr_pizzano_mach3boostfall)) || audio_is_playing(sfx_pizzanoscreamstart) || audio_is_playing(sfx_pizzanoscream)) && state != states.meteorpep)
    {
        if (state != baddiestates.scared)
        {
            state = baddiestates.scared;
            
            if (global.layout == 1 && object_index == obj_cottonwitch)
                sprite_index = spr_cottonwitch_scarednew;
            else if (global.layout == 0 || object_index != obj_cottonwitch)
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
    
    if ((ScareBuffer <= 0 && state == baddiestates.scared && (global.layout == 0 || object_index != obj_cottonwitch)) || ((animation_end() && sprite_index == spr_cottonwitch_scarednew3) && state == states.pistolaim && global.layout == 1 && object_index == obj_cottonwitch))
    {
        state = baddiestates.walk;
        sprite_index = walkspr;
        
        if (global.layout == 1 && object_index == obj_cottonwitch)
            image_xscale *= -1;
        
        ScareBuffer = 0;
    }
    
    if (animation_end() && sprite_index == spr_cottonwitch_scarednew)
    {
        sprite_index = spr_cottonwitch_scarednew2;
        image_index = 0;
    }
    
    if (animation_end() && sprite_index == spr_cottonwitch_scarednew2)
    {
        sprite_index = spr_cottonwitch_scarednew3;
        image_index = 0;
    }
}
