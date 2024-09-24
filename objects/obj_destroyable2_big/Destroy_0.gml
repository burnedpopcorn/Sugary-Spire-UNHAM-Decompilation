if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create((x + 32), (y + 32), obj_cloudeffect))
    {
        image_speed = 0.35
        sprite_index = spr_bigbreak2_dead
    }
    if (audio_is_playing(sound_destroyblock1) || audio_is_playing(sound_destroyblock2))
    {
        audio_stop_sound(sound_destroyblock1)
        audio_stop_sound(sound_destroyblock2)
    }
    scr_sound(choose(sound_destroyblock1, sound_destroyblock2))
    ds_list_add(global.saveroom, id)
    if (global.lappingsys == 1 && global.lapcount == 2)
        ds_list_add(global.escaperoom, id)
    create_small_number(x, (y + 16), "100")
    global.collect += 100
    with (instance_create(x, y, obj_collecteffect))
    {
        sprite_index = spr_collectsliceNEW
        choosed = true
    }
    global.combofreeze = 4
    global.combotime += 50
    scr_sound(sound_points)
}
