volume = approach(volume, 1, 0.1)
audio_sound_gain(mu_void, (volume * global.musicVolume), 0)
audio_sound_gain(spireintroN, (volume * global.musicVolume), 0)
if (soundbuffer > 0)
    soundbuffer--
else if (soundcount < 2)
{
    soundbuffer = 170
    soundcount++
    var sound = choose(sfx_voicecollect1PZ, sfx_voicecollect2PZ, sfx_voicecollect3PZ, sfx_voicecollect4PZ)
    if (playerspr == spr_introasset_pizzano)
        sound = choose(sfx_pizzanocollect1, sfx_pizzanocollect2, sfx_pizzanocollect3, sfx_pizzanocollect4)
    scr_sound(sound)
}
scr_getinput()
if (key_slap2 && canskip && (!instance_exists(obj_fadeout)))
{
    canskip = 0
	obj_player.targetRoom = outer_room1
	obj_player.targetDoor = "C"
	obj_player.state = states.bossintro
    obj_player.movespeed = 2
    obj_player.xscale = 1
    instance_create(x, y, obj_fadeout)
    obj_music.voidmusvolume = 1
    obj_player.visible = 1
}
if showtext
{
    xi = 288 + (random_range(1, -1))
    if (textalpha < 1)
        textalpha += 0.05
}
if (!showtext)
{
    xi = 288 + (random_range(1, -1))
    if (textalpha > 0)
        textalpha -= 0.1
}
if (canskip == 1)
{
    message = ["Press ", " to skip cutscene"]
    showtext = 1
    alarm[1] = 225
}
