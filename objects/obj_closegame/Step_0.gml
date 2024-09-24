scr_getinput()
var move = key_left2 + key_right2
if (move != 0)
{
    optionselected += move
    optionselected = clamp(optionselected, 0, 1)
}
if (prevselected != optionselected)
{
    prevselected = optionselected
    scr_sound(sound_step)
}
if (key_jump2 || keyboard_check_pressed(vk_return))
{
    switch optionselected
    {
        case 0:
            scr_sound(sound_enemythrow)
            instance_destroy()
            break
        case 1:
            scr_sound(sound_explosion)
            game_end()
            break
    }

}
if (key_slap2 || key_start2)
{
    scr_sound(sound_enemythrow)
    instance_destroy()
}
