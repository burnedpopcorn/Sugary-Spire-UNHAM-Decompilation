if (sprite_index != spr_confectiboxopen)
{
    var _content = instance_create((x + sprite_width / 2), (y + sprite_height / 2), BoxContent)
    if (object_get_parent(_content.object_index) == par_confecti)
    {
        with (instance_create((x + sprite_width / 2), (y + sprite_height / 2), obj_explosioneffect))
        {
            sprite_index = spr_taunteffect
            depth = -2
        }
        scr_sound(sound_toppingot)
        if (global.toppintotal < 5)
        {
            obj_tv.message = "You are missing " + (string(5 - global.toppintotal)) + " confecti!"
            obj_tv.showtext = 1
            obj_tv.alarm[0] = 150
        }
        if (global.toppintotal == 5)
        {
            obj_tv.message = "You have found all 5 confecti!"
            obj_tv.showtext = 1
            obj_tv.alarm[0] = 150
        }
        global.collect += 1000
        global.combofreeze = 30
        global.combotime = 60
        if (obj_player.character == "P")
        {
            if chance(0.25)
                scr_sound(sfx_voicecollect1PZ, sfx_voicecollect2PZ, sfx_voicecollect3PZ, sfx_voicecollect4PZ)
        }
        else if chance(0.25)
            scr_sound(sfx_pizzanocollect1, sfx_pizzanocollect2, sfx_pizzanocollect3, sfx_pizzanocollect4)
        if (global.toppintotal < 5)
            global.toppintotal += 1
    }
    image_index = 0
    instance_destroy()
}
