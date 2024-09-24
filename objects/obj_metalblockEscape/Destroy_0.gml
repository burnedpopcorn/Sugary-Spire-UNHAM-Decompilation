if (ds_list_find_index(global.saveroom, id) == -1)
{
    var rep = 3 + (sprite_width / 32 - 1) + (sprite_height / 32 - 1)
    repeat rep
    {
        with (instance_create((x + (random_range(0, sprite_width))), (y + (random_range(0, sprite_height))), obj_metaldebris))
            sprite_index = spr_metalblockEscape_Debrisnew
    }
    with (obj_camera)
    {
        shake_mag = 20
        shake_mag_acc = 40 / room_speed
    }
    scr_sound(sound_metaldestroy)
    ds_list_add(global.saveroom, id)
}
