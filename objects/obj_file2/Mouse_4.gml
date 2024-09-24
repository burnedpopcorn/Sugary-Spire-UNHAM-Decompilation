if (plushbuffer == 0 && sprite_index != spr_file2_pizzanoprep && (!instance_exists(obj_pizzano_jumpscare)) && (!instance_exists(obj_erasefile)) && visible && obj_player.character == "N")
{
    plushbuffer = 10
    sprite_index = spr_file2_pizzanosquish
    image_index = 0
    scr_sound(sound_plush)
    if (notsavedcount < 6)
        notsavedcount++
    if (notsavedcount == 6)
        plushcount++
    drawcount = 80
    countalpha = 1
    countscale = 1.8
    countshake = 6
    ini_open("optionData.ini")
    ini_write_real("Game", "plushcount", plushcount)
    ini_close()
}
