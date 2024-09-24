if (other.state != states.bombpep && other.Dashpad_buffer <= 0)
{
    with (other)
    {
        if (state != states.Sjumpprep && state != states.minecart && state != states.minecartspin && state != states.rocketfistpizzano && state != states.crouch && sprite_get_bbox_bottom(mask_index) <= other.bbox_bottom)
        {
            if (state == states.mach3 && xscale == sign(other.image_xscale))
                movespeed += 4
            movespeed = clamp(movespeed, 12, 24)
            state = states.mach3
            Dashpad_buffer = 25
            sprite_index = spr_dashpadboost
            xscale = sign(other.image_xscale)
            scr_sound(sfx_dashpad)
            var try_y = 0
            while (try_y <= 16)
            {
                if scr_solid(x, (other.y - try_y))
                {
                    try_y++
                    continue
                }
                else
                {
                    y = other.y - try_y
                    break
                }
            }
            if (state != states.climbwall && (!(scr_solid(other.x, y))))
                x = other.x
            image_index = 0
            vsp = 3
            flash = true
        }
        else if ((state == states.minecart || state == states.minecartspin) && sprite_get_bbox_bottom(mask_index) <= other.bbox_bottom)
        {
            movespeed++
            movespeed = clamp(movespeed, 12, 15)
            flash = true
            Dashpad_buffer = 25
            xscale = sign(other.image_xscale)
            image_index = 0
            sprite_index = spr_pl_minecartfastland
            if (state == states.minecartspin)
                state = states.minecart
            scr_sound(sfx_dashpad)
        }
    }
}
