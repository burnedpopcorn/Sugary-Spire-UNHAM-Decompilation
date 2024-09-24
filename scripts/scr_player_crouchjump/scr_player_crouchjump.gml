function scr_player_crouchjump() //scr_player_crouchjump
{
    move = key_left + key_right
    if (mask_index == spr_player_mask || mask_index == spr_crouchmask)
        mask_index = spr_crouchmask
    hsp = move * movespeed
    movespeed = 4
    if ((!key_jump2) && (!jumpstop) && jumpAnim)
    {
        vsp /= 2
        jumpstop = true
    }
    if (scr_solid(x, (y - 1)) && (!(scr_solid(x, y))) && (!jumpstop) && jumpAnim)
    {
        vsp = grav
        jumpstop = true
    }
    if (grounded && key_down)
    {
        state = states.crouch
        jumpAnim = true
        crouchAnim = true
        image_index = 0
        jumpstop = false
    }
    if (grounded && (!key_down) && (!(scr_solid(x, (y - 16)))))
    {
        movespeed = 0
        state = states.normal
        jumpAnim = true
        landAnim = true
        crouchAnim = true
        image_index = 0
        jumpstop = false
        if (mask_index == spr_player_mask || mask_index == spr_crouchmask)
            mask_index = spr_player_mask
    }
    if grounded
    {
        state = states.crouch
        jumpAnim = true
        crouchAnim = true
        image_index = 0
        jumpstop = false
    }
    if jumpAnim
    {
        sprite_index = spr_crouchjump
        if (floor(image_index) == (image_number - 1))
            jumpAnim = false
    }
    if (!jumpAnim)
        sprite_index = spr_crouchfall
    if (move != 0)
        xscale = move
    image_speed = 0.35
}

