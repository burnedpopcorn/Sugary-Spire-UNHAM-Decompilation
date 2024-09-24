depth = 4
image_speed = 0.35
deadSpr = spr_chocofrogsmalldead
if (instance_place((x + 1), y, object_index) && instance_place((x + 1), (y + 1), object_index) && instance_place(x, (y + 1), object_index))
{
    with (instance_create((x - 16), (y - 32), obj_chocofrogmid))
    {
        with (instance_place(x, y, obj_chocofrogsmall))
        {
            ds_list_add(global.saveroom, id)
            instance_destroy()
        }
    }
}
