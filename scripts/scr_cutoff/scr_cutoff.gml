function scr_cutoff(argument0) //scr_cutoff
{
    if (!argument0)
    {
        with (instance_create(x, y, obj_cutoff))
            image_yscale = -1
        instance_create(x, (y + 32), obj_cutoff)
        with (instance_create(x, y, obj_cutoff))
            image_angle = -90
        with (instance_create((x + 32), (y + 32), obj_cutoff))
            image_angle = 90
    }
    else if (image_xscale == 2 && image_yscale == 2)
    {
        with (instance_create((x + 32), y, obj_cutoff))
        {
            image_yscale = -1
            argument0 = 1
            sprite_index = spr_cutoffbig
        }
        with (instance_create((x + 96), y, obj_cutoff))
        {
            image_yscale = -1
            argument0 = 1
            sprite_index = spr_cutoffbig
        }
        with (instance_create((x + 32), (y + 128), obj_cutoff))
        {
            argument0 = 1
            sprite_index = spr_cutoffbig
        }
        with (instance_create((x + 96), (y + 128), obj_cutoff))
        {
            argument0 = 1
            sprite_index = spr_cutoffbig
        }
        with (instance_create((x + 128), (y + 32), obj_cutoff))
        {
            image_angle = 90
            argument0 = 1
            sprite_index = spr_cutoffbig
        }
        with (instance_create((x + 128), (y + 96), obj_cutoff))
        {
            image_angle = 90
            argument0 = 1
            sprite_index = spr_cutoffbig
        }
        with (instance_create(x, (y + 32), obj_cutoff))
        {
            image_angle = -90
            argument0 = 1
            sprite_index = spr_cutoffbig
        }
        with (instance_create(x, (y + 96), obj_cutoff))
        {
            image_angle = -90
            image_index = 1
            image_xscale = -1
        }
        with (instance_create(x, (y + 128), obj_cutoff))
        {
            image_angle = -90
            image_index = 0
            image_xscale = -1
        }
    }
    else if (id != 110959)
    {
        if (id != 101081 && id != 106042 && id != 110959 && id != 110826 && id != 110924)
        {
            with (instance_create((x + 32), y, obj_cutoff))
            {
                image_yscale = -1
                argument0 = 1
                sprite_index = spr_cutoffbig
            }
        }
        if (id != 101087 && id != 106045 && id != 110961 && id != 110827 && id != 110925)
        {
            with (instance_create((x + 32), (y + 64), obj_cutoff))
            {
                argument0 = 1
                sprite_index = spr_cutoffbig
            }
        }
        with (instance_create((x + 64), (y + 32), obj_cutoff))
        {
            image_angle = 90
            argument0 = 1
            sprite_index = spr_cutoffbig
        }
        with (instance_create(x, (y + 32), obj_cutoff))
        {
            image_angle = -90
            argument0 = 1
            sprite_index = spr_cutoffbig
        }
    }
}

