if (ds_list_find_index(global.baddieroom, id) == -1)
{
    scr_sound(sfx_glassbreak)
    with (instance_create(x, y, obj_puddle))
        vsp = -4
    with (instance_create(x, y, obj_debris))
    {
        sprite_index = spr_juicedebris
        image_index = 0
    }
    with (instance_create(x, y, obj_debris))
    {
        sprite_index = spr_juicedebris
        image_index = 1
    }
    with (instance_create(x, y, obj_debris))
    {
        sprite_index = spr_juicedebris
        image_index = 2
    }
    with (instance_create(x, y, obj_debris))
    {
        sprite_index = spr_juicedebris
        image_index = 3
    }
    with (instance_create(x, y, obj_debris))
    {
        sprite_index = spr_juicedebris
        image_index = 4
    }
    with (instance_create(x, y, obj_debris))
    {
        sprite_index = spr_juicedebris
        image_index = 5
    }
    with (instance_create(x, y, obj_debris))
    {
        sprite_index = spr_juicedebris
        image_index = 6
    }
    with (instance_create(x, y, obj_debris))
    {
        sprite_index = spr_juicedebris
        image_index = 7
    }
    with (instance_create(x, y, obj_debris))
    {
        sprite_index = spr_juicedebris
        image_index = 8
    }
    with (instance_create(x, y, obj_debris))
    {
        sprite_index = spr_juicedebris
        image_index = 9
    }
}
event_inherited()
