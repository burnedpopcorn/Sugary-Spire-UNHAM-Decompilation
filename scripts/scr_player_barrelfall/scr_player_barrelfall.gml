function scr_player_barrelfall()
{
    if (mask_index == spr_player_mask || mask_index == spr_crouchmask)
        mask_index = spr_player_mask;
    
    if (vsp < 12)
        vsp += grav;
    
    if (place_meeting(x, y, obj_water2))
        vsp -= 1;
    
    if (grounded)
    {
        state = states.barrelcrouch;
        image_index = 0;
    }
    
    if (place_meeting(x, y, obj_water2))
    {
        state = states.barrelmach3;
        image_index = 0;
    }
    
    sprite_index = spr_player_barrelfall;
    image_speed = 0.35;
}
