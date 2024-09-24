if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create(x, y, obj_cloudeffect))
    {
        image_speed = 0.35
        sprite_index = spr_smallbreak2_dead
    }
    global.combotime += 10
    global.collect += 10
    create_small_number(x, (y + 16), "10")
    scr_sound(sound_points)
    if (audio_is_playing(sound_destroyblock1) || audio_is_playing(sound_destroyblock2))
    {
        audio_stop_sound(sound_destroyblock1)
        audio_stop_sound(sound_destroyblock2)
    }
    scr_sound(choose(sound_destroyblock1, sound_destroyblock2))
    ds_list_add(global.saveroom, id)
    if (global.lappingsys == 1 && global.lapcount == 2)
        ds_list_add(global.escaperoom, id)
}
