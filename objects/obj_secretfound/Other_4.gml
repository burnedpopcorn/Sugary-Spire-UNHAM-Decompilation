if (ds_list_find_index(global.saveroom, id) == -1)
{
    global.secretfound++
    with (obj_tv)
    {
        message = "You have found " + string(global.secretfound) + " out of 3 secrets!"
        showtext = 1
        alarm[0] = 150
    }
    scr_sound(sound_secretgot)
    ds_list_add(global.saveroom, id)
    if (global.lappingsys == 1 && global.lapcount == 2)
        ds_list_add(global.escaperoom, id)
}
global.secretroom = 1
