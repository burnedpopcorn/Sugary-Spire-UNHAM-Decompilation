if (pos_x == "POO")
    pos_x = other.x
with (other)
{
    var bbox_size = abs(bbox_right - bbox_left)
    global.combofreeze = 30
    if instance_exists(obj_fadeout)
    {
        if obj_fadeout.xtox
        {
            obj_player.x = 160
            obj_player.y = 1984
        }
        else if (!obj_fadeout.xtox)
            x = other.pos_x
    }
    else
        x = other.pos_x
    y = other.y + other.sprite_height / 2
    var _x1 = clamp(x, (other.x + bbox_size), (other.bbox_right - bbox_size))
    var xpos_difference = _x1 - other.x
    var xpos = xpos_difference / other.image_xscale
    var hallxscale = other.hallwayxscale
    if (room == hub_bikinibottom)
        hallxscale = 2
    var xpos_offset = xpos * hallxscale
    targetDoor = other.targetDoor
    targetRoom = other.targetRoom
    vertical = true
    verticaloffset = xpos_offset
    hallwaydirection = sign(other.image_yscale)
    if (!instance_exists(obj_fadeout))
    {
        scr_sound(sound_door)
        if (room == hub_bikinibottomtest)
        {
            with (instance_create(x, y, obj_fadeout))
                xtox = 1
        }
        else
            instance_create(x, y, obj_fadeout)
    }
}
