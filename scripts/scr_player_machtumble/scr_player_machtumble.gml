function scr_player_machtumble()
{
    static bufferslap = 0;
    static attack_afterimagetimer = 6;
    
    move = key_left + key_right;
    hsp = xscale * movespeed;
    
    if (movespeed < 10 && grounded)
        movespeed += 0.5;
    else if (movespeed < 10 && !grounded)
        movespeed = 10;
    
    if (((!grounded && !place_meeting(x + hsp, y, obj_metalblock)) && scr_solid(x + hsp, y, true) && !place_meeting(x + hsp, y, obj_destructibles) && !scr_slope_ext(x + sign(hsp), y)) || (grounded && (scr_solid(x + sign(hsp), y - 2, true) && !scr_slope_ext(x + sign(hsp), y - 1)) && (!place_meeting(x + hsp, y, obj_metalblock) && !place_meeting(x + hsp, y, obj_destructibles)) && scr_slope()))
    {
        wallspeed = clamp(movespeed, 10, 24);
        state = states.climbwall;
        scr_sound(sfx_climbwallstart);
        grabclimbbuffer = 10;
    }
    else if (grounded && scr_solid(x + sign(hsp), y) && (!scr_slope() && scr_solid(x + sign(hsp), y - 2)) && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_destructibles))
    {
        scr_sound(sound_bump);
        flash = false;
        combo = 0;
        sprite_index = spr_playerPZ_wallsplat;
        state = states.bump;
        hsp = 0;
        vsp = 0;
        mach2 = 0;
        image_index = 0;
        instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
    }
    
    if (key_down)
    {
        sprite_index = spr_crouchslip;
        machhitAnim = false;
        state = states.crouchslide//states.crouchslide;
        
        if (audio_is_playing(sound_suplex1))
            audio_stop_sound(sound_suplex1);
        
        input_buffer_crouch = 16;
    }
    
    if (animation_end() && !key_slap)
    {
        if (key_attack)
        {
            if (movespeed < 12)
            {
                state = states.mach2;
                sprite_index = spr_player_mach;
            }
            else
            {
                state = states.mach3;
                sprite_index = spr_player_mach4;
            }
        }
        else if (key_down)
        {
            sprite_index = spr_crouchslip;
            machhitAnim = false;
            state = states.crouchslide//states.crouchslide;
            
            if (audio_is_playing(sound_suplex1))
                audio_stop_sound(sound_suplex1);
            
            input_buffer_crouch = 16;
        }
        else
        {
            image_speed = 0.35;
            state = states.normal//states.normal;
            grav = 0.5;
        }
    }
    else if (animation_end() && key_slap && move != 0 && !key_down)
    {
        if (move == xscale)
            movespeed += 0.4;
        else if (move == -xscale)
            movespeed -= 0.5;
        
        movespeed = clamp(movespeed, 10, 24);
    }
    
    if (input_buffer_jump < 8 && grounded)
    {
        if (movespeed < 10)
            movespeed = 10;
        
        sprite_index = spr_player_mach2jump;
        instance_create(x, y, obj_jumpdust);
        state = states.mach2;
        vsp = -11;
        
        if (audio_is_playing(sound_suplex1))
            audio_stop_sound(sound_suplex1);
        
        minusmovespeed = 0;
        input_buffer_jump = 8;
    }
    
    image_speed = 0.35;
}