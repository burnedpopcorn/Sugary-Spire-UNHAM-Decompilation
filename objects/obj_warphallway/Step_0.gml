with (obj_player)
{
    if (hsp > 0 && x > (room_width + 64))
        x = -64
    if (hsp < 0 && x < -64)
        x = room_width + 64
    if (vsp > 0 && y > (room_height + 64))
        y = -64
    if (vsp < 0 && y < -64)
        y = room_height + 64
    if (place_meeting(x, y, other) && grounded && vsp > 0 && other.grounded && other.vsp > 0 && key_up)
    {
        with (other)
        {
            setting = (!setting)
            vsp = -3
            var lay_id = layer_get_id("Tiles_2")
            var lay_id2 = layer_get_id("Tiles_2B")
            if instance_exists(obj_platform)
            {
                if (obj_platform.image_yscale == 1)
                    obj_platform.y = 432
                else if (obj_platform.image_yscale == -1)
                    obj_platform.y = 416
                obj_platform.image_yscale *= -1
            }
            if setting
            {
                angle = lerp(angle, 180, 0.2)
                layer_set_visible(lay_id, 0)
                layer_set_visible(lay_id2, 1)
            }
            else
            {
                angle = lerp(angle, 270, 0.2)
                layer_set_visible(lay_id, 1)
                layer_set_visible(lay_id2, 0)
            }
        }
    }
}
angle = scr_warp(angle, 0, 270)
scr_collide()
