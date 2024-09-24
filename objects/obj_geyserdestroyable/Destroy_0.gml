if (ds_list_find_index(global.saveroom, id) == -1)
{
    var rep = 2 + (sprite_width / 32 - 1) + (sprite_height / 32 - 1)
    repeat rep
        instance_create((x + (random_range(0, sprite_width))), (y + (random_range(0, sprite_height))), obj_geyserdestroydebris)
    image_speed = 0.35
    if (audio_is_playing(sound_destroyblock1) || audio_is_playing(sound_destroyblock2))
    {
        audio_stop_sound(sound_destroyblock1)
        audio_stop_sound(sound_destroyblock2)
    }
    scr_sound(choose(sound_destroyblock1, sound_destroyblock2))
    ds_list_add(global.saveroom, id)
}
