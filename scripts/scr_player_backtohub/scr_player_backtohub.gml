function scr_player_backtohub()
{
    static standBuffer = 40;
    
    image_alpha = approach(image_alpha, 1, 0.1);
    hsp = 0;
    
    if (vsp < 20 && sprite_index != spr_player_slipnslideend && sprite_index != spr_pizzano_sleepend)
        vsp += grav;
    
    y += vsp;
    
    if (y >= huby && !grounded && vsp > 0)
    {
        y = huby;
        grounded = true;
        standBuffer = 40;
        sprite_index = spr_player_slipnslideend;
        
        if (character == "N")
            sprite_index = spr_pizzano_sleepend;
        
        vsp = 0;
        scr_sound(choose(slipnslideend, slipnslideend2, slipnslideend3));
    }
    
    if (sprite_index == spr_player_slipnslideend || sprite_index == spr_pizzano_sleepend)
    {
        vsp = 0;
        
        if (animation_end())
            image_index = image_number - 1;
        
        if (standBuffer > 0)
        {
            standBuffer--;
        }
        else
        {
            start_running = true;
            movespeed = 0;
            state = states.normal;
            image_alpha = 1;
            image_blend = #010000;
            backtohub = 0;
        }
    }
    
    image_speed = 0.35;
}
/*
function scr_player_backtohub()
{
    static standBuffer = 40;
    
    image_alpha = approach(image_alpha, 1, 0.1);
    hsp = 0;
    
    if (vsp < 20 && sprite_index != spr_player_slipnslideend && sprite_index != spr_pizzano_sleepend)
        vsp += grav;
    
    y += vsp;
    
    if (y >= huby && !grounded && vsp > 0)
    {
        y = huby;
        grounded = true;
        standBuffer = 40;
        sprite_index = spr_player_slipnslideend;
        
        if (character == "N")
            sprite_index = spr_pizzano_sleepend;
        
        vsp = 0;
        scr_sound(choose(slipnslideend, slipnslideend2, slipnslideend3));
    }
    
    if (sprite_index == spr_player_slipnslideend || sprite_index == spr_pizzano_sleepend)
    {
        vsp = 0;
        
        if (animation_end())
            image_index = image_number - 1;
        
        if (standBuffer > 0)
        {
            standBuffer--;
        }
        else
        {
            start_running = true;
            movespeed = 0;
            state = states.normal;
            image_alpha = 1;
            image_blend = #010000;
            backtohub = 0;
        }
    }
    
    image_speed = 0.35;
}