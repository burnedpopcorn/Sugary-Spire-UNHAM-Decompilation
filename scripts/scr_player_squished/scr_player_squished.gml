function scr_player_squished() //scr_player_squished
{
    hsp = 0
    move = 0
    movespeed = 0
    if (animation_end() && (sprite_index == spr_player_squished || sprite_index == spr_pizzano_squished))
    {
        image_speed = 0
        if grounded
        {
            image_speed = 0.35
            state = states.normal
        }
    }
}

