function scr_player_fling() //scr_player_fling
{
    image_speed = 0.35
    if (sprite_index == spr_candybegin && animation_end())
        sprite_index = spr_candyidle
}

