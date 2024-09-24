scr_getinput()
if (pizzellebuffer < 400)
{
    if chance(0.5)
        pizzellebuffer++
    if chance(0.25)
        pizzellebuffer += 2
    if chance(0.125)
        pizzellebuffer += 5
}
else
{
    obj_player.state = states.titlescreen
    room_goto(rm_verify)
    audio_stop_sound(mu_spireloading)
    scr_sound(sound_secretgot)
}
if chance(0.03)
    pizzellebuffer += 10
if chance(0.005)
    pizzellebuffer += 25
if (key_jump2 || key_slap2)
{
    obj_player.state = states.titlescreen
    room_goto(rm_verify)
    audio_stop_sound(mu_spireloading)
    scr_sound(sound_secretgot)
}
