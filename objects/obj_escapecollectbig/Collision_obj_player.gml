if global.panic
{
    if (global.collectsound == 10)
        sound = scr_sound(bellcollectbig)
    audio_sound_pitch(sound, random_range(0.95, 1.1))
    global.collectsound = 0
    global.collect += 100
    global.pizzameter += 5
    scr_queue_tvanim(obj_tv.happytvspr, 50)
    create_small_number(x, y, "100")
    global.combofreeze = 30
    global.combotime += 60
    if (obj_player.character == "P")
    {
        if chance(0.25)
            scr_sound(sfx_voicecollect1PZ, sfx_voicecollect2PZ, sfx_voicecollect3PZ, sfx_voicecollect4PZ)
    }
    else if chance(0.25)
        scr_sound(sfx_pizzanocollect1, sfx_pizzanocollect2, sfx_pizzanocollect3, sfx_pizzanocollect4)
    with (instance_create(x, y, obj_collecteffect))
    {
        sprite_index = other.sprite_index
        choosed = true
    }
    instance_destroy()
}
