function scr_player_drown()
{
    static bubbleBuffer = 15;
    
    landAnim = false;
    machslideAnim = false;
    crouchslideAnim = false;
    crouchAnim = false;
    machhitAnim = false;
    jumpAnim = false;
    mach2 = 0;
    
    if (character == "P")
    {
        hsp = xscale * movespeed;
        movespeed = approach(movespeed, 0, 1);
        grav = 0.1;
        
        if (drownbuffer > 15 && input_buffer_jump < 8)
        {
            sprite_index = spr_player_outofcontrolfall;
            
            if (character == "N")
                sprite_index = spr_pizzano_outofcontrolfall;
            
            state = states.jump;
            vsp = -13;
            input_buffer_jump = 8;
        }
        
        if (drownbuffer < 25)
        {
            sprite_index = spr_playerPZ_drown;
            
            if (bubbleBuffer > 0)
            {
                bubbleBuffer--;
            }
            else
            {
                repeat (random_range(1, 2))
                    instance_create(x + random_range(-64, 64), y + random_range(-64, 64), obj_molassesbubble);
                
                bubbleBuffer = 15;
            }
        }
        
        if (drownbuffer > 0)
        {
            drownbuffer--;
        }
        else
        {
            if (!instance_exists(obj_technicaldifficulty))
                instance_create(x, y, obj_technicaldifficulty);
            
            state = states.hurt;
            alarm[8] = 60;
            alarm[7] = 120;
            hurted = 1;
            sprite_index = spr_hurt;
            movespeed = 0;
            vsp = -3;
            global.combofreeze = 60;
        }
        
        image_speed = 0.25;
    }
    else if (character == "N")
    {
        move = key_left + key_right;
        move2 = key_down + key_up;
        hsp = xscale * movespeed;
        
        if (key_down)
            vsp = approach(vsp, 7, 0.25);
        
        if (key_up)
            vsp = approach(vsp, -7, -0.5);
        else if (move2 == 0 || (key_up && key_down))
            vsp = approach(vsp, 0, 1);
        
        if (move == 0)
            movespeed = approach(movespeed, 0, 0.5);
        
        if (move != 0)
            movespeed = approach(movespeed, 7, 0.25);
        
        if (move != xscale && movespeed > 0)
            movespeed -= 2;
        
        grav = 0.1;
        
        if (movespeed < 0)
            movespeed = 0;
        
        if (move != 0 || move2 != 0)
            sprite_index = spr_pizzano_swim;
        else if (move == 0 && move2 == 0)
            sprite_index = spr_pizzano_swimidle;
        
        if (key_jump)
        {
            sprite_index = spr_pizzano_djump;
            state = states.jump;
            vsp = -13;
            scr_sound(sound_jump);
        }
        
        if (!place_meeting(x, y, obj_molasseswater))
        {
            sprite_index = spr_pizzano_fall;
            state = states.jump;
            
            if (vsp > -7 && !key_down)
                vsp = -7;
        }
    }
    
    if (move != 0)
        xscale = move;
    
    image_speed = 0.35;
}
