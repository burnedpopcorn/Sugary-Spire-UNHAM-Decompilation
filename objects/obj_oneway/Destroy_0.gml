if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = spr_onewayblockdead
    if (audio_is_playing(sound_destroyblock1) || audio_is_playing(sound_destroyblock2))
    {
        audio_stop_sound(sound_destroyblock1)
        audio_stop_sound(sound_destroyblock2)
    }
    scr_sound(choose(sound_destroyblock1, sound_destroyblock1))
    ds_list_add(global.saveroom, id)
    if (global.lappingsys == 1 && global.lapcount == 2)
        ds_list_add(global.escaperoom, id)
}
if instance_exists(solidid)
{
    with (solidid)
        instance_destroy()
}
