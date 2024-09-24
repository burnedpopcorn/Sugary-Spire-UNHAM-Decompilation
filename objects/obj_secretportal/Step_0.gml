if active
{
}
if (touched && sprite_index == spr_secretportal_close)
{
    with (obj_player)
    {
        hsp = 0
        vsp = 0
        x = other.x
        y = other.y
        scale_ys = approach(scale_ys, 0, 0.05)
        scale_xs = approach(scale_xs, 0, 0.05)
        fallinganimation = 0
        if (state == states.mach2 || state == states.mach3)
            state = states.normal
    }
}
if (floor(image_index) == (image_number - 1))
{
    switch sprite_index
    {
        case spr_secretportal_close:
            image_index = image_number - 1
            if touched
            {
                if (!instance_exists(obj_fadeout))
                {
                    with (obj_player)
                    {
                        lastTargetDoor = targetDoor
                        targetDoor = "S"
                        if (!other.insecret)
                        {
                            lastroom = room
                            targetRoom = other.targetRoom
                            secretportalID = other.id
                        }
                        else
                            targetRoom = lastroom
                    }
                    if (!insecret)
                    {
                        ds_list_add(global.saveroom, id)
                        if (global.lappingsys == 1 && global.lapcount == 2)
                            ds_list_add(global.escaperoom, id)
                    }
                    instance_create(x, y, obj_fadeout)
                }
            }
            break
    }

}
