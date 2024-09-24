scr_getinput()
if (((-key_left2) || keyboard_check_pressed(vk_left)) && optionselected > 0)
{
    optionselected -= 1
    scr_sound(sound_step)
}
if ((key_right2 || keyboard_check_pressed(vk_right)) && optionselected < 1)
{
    optionselected += 1
    scr_sound(sound_step)
}
var fusesfx = scr_soundloop(sound_bombfuse)
if ((key_jump2 || keyboard_check(vk_return)) && optionselected && file_exists(global.charsave))
{
    if (deletebuffer > 0)
        deletebuffer--
    cherryshake = (20 - deletebuffer) / 10
    soundvolume = (20 - deletebuffer) * 0.05
    if (!audio_is_playing(fusesfx))
        scr_soundloop(fusesfx)
    audio_sound_gain(fusesfx, (global.soundVolume * soundvolume), 0)
}
if (deletebuffer == 0 && (key_jump2 || keyboard_check(vk_return)) && optionselected && charcherrysprite != spr_charcherry_popout)
{
    charcherryindex = 0
    charcherrysprite = spr_charcherry_popout
}
if ((!optionselected) || ((!key_jump2) && (!keyboard_check(vk_return))))
{
    if (charcherrysprite == spr_charcherry_popout && floor(charcherryindex) > 0)
        cherrybackwards = 1
    if (!cherrybackwards)
        charcherrysprite = spr_charcherry_wait
    deletebuffer = 20
    cherryshake = approach(cherryshake, 0, 4)
    if audio_is_playing(sound_bombfuse)
        audio_stop_sound(sound_bombfuse)
    soundvolume = 0
}
if (optionselected && charcherrysprite == spr_charcherry_popout && floor(charcherryindex) == 15 && deletebuffer == 0)
{
    if file_exists(global.charsave)
        file_delete(global.charsave)
    obj_player.paletteselect = 1
    with (obj_playerhat)
        image_index = 0
    if (!obj_mainfartselect.showpizzano)
    {
        switch obj_mainfartselect.selected
        {
            case 0:
                obj_file1.prevpal = 1
                break
            case 1:
                obj_file2.prevpal = 1
                break
            case 2:
                obj_file3.prevpal = 1
                break
        }

    }
    if audio_is_playing(fusesfx)
        audio_stop_sound(fusesfx)
    obj_menupercent.drawperc = 0
    obj_menupercent.rizzshake = 10
    obj_menupercent.shake = 6
    scr_sound(sound_destroyblock1)
    scr_sound(sound_explosion)
    instance_destroy()
}
if (key_slap2 || keyboard_check_pressed(vk_escape) || ((!optionselected) && (key_jump || keyboard_check_pressed(vk_return))))
{
    scr_sound(sound_enemythrow)
    instance_destroy()
}
