if global.panic
{
    if (global.collectsound == 10)
        sound = scr_sound(bellcollectsmall)
    audio_sound_pitch(sound, random_range(0.95, 1.1))
    global.collectsound = 0
    global.collect += 10
    global.pizzameter += 1
    create_small_number((x + 16), y, "10")
    global.combofreeze = 30
    global.combotime += 15
    with (instance_create(x, y, obj_collecteffect))
    {
        sprite_index = other.sprite_index
        choosed = true
    }
    instance_destroy()
}
