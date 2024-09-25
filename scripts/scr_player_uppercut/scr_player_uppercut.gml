function scr_player_uppercut()
{
    static attack_afterimagetimer = 6;
    
    image_speed = 0.35;
    
    if (sprite_index == spr_player_uppercutbegin && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_player_uppercutend;
        image_index = 0;
    }
    
    if (sprite_index == spr_pizzano_uppercutbegin && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_pizzano_uppercutend;
        image_index = 0;
    }
    
    if (scr_solid(x + sign(hsp), y) && !scr_slope_ext(x + xscale, y) && move != 0)
        movespeed = 0;
    
    move = key_left + key_right;
    hsp = movespeed;
    
    if (move != 0)
        movespeed = approach(movespeed, move * 6, 0.5);
    else
        movespeed = approach(movespeed, 0, 0.5);
    
    if (!instance_exists(obj_dashcloud) && grounded)
    {
        with (instance_create_depth(x, y, 0, obj_dashcloud))
            image_xscale = other.xscale;
    }
    
    if (grounded && vsp > 0)
    {
        if (move != 0)
            xscale = move;
        
        movespeed = abs(hsp);
        scr_sound(sound_step);
        landAnim = true;
        input_buffer_secondjump = false;
        state = false;
        jumpAnim = true;
        jumpstop = false;
        image_index = 0;
        freefallstart = false;
        instance_create_depth(x, y, 0, obj_landcloud);
    }
}