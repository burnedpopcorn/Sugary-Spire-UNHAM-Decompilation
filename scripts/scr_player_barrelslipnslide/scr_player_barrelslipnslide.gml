function scr_player_barrelslipnslide() //scr_player_barrelslipnslide
{
    if (mask_index == spr_player_mask || mask_index == spr_crouchmask)
        mask_index = spr_player_mask
    hsp = image_xscale * movespeed
    if (movespeed <= 8)
        movespeed += 0.2
    if (vsp < 12)
        vsp += grav
    sprite_index = spr_player_barrelslipnslide
    if (floor(image_index) == 6)
    {
        state = states.barrelroll
        flash = true
    }
    else
        image_speed = 0.35
}

