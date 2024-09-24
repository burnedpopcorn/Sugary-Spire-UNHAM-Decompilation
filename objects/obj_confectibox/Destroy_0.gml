if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create((x + 32), (y + 32), obj_debris))
    {
        sprite_index = spr_confecticagedebris
        image_index = 0
    }
    repeat (3)
    {
        with (instance_create((x + 32), (y + 32), obj_debris))
        {
            sprite_index = spr_confecticagedebris
            image_index = irandom_range(1, 3)
        }
    }
    if audio_is_playing(toppinhelp)
        audio_stop_sound(toppinhelp)
    ds_list_add(global.saveroom, id)
}
