if ((!grounded) || floor(image_index) == (image_number - 1))
    image_speed = 0
else
    image_speed = 0.35
scr_collide()
if (global.lapcount == 2 && global.lappingsys == 1)
{
    if keyboard_check_pressed(vk_anykey)
    {
        for (var i = 0; i < ds_list_size(global.escaperoom); i++)
        {
            var b = ds_list_find_value(global.escaperoom, i)
            var q = ds_list_find_index(global.baddieroom, b)
            var t = 0
            if (q == -1)
            {
                q = ds_list_find_index(global.saveroom, b)
                t = 1
            }
            if (q != -1)
            {
                if (!t)
                    ds_list_delete(global.baddieroom, q)
                else
                    ds_list_delete(global.saveroom, q)
            }
        }
        ds_list_clear(global.escaperoom)
        global.lapcount = 2
        global.panicking = 1
        global.panic = 1
        global.minutes = 0
        global.seconds = 0
        global.collect = global.last_score
        global.treasure = global.last_treasure
        global.secretfound = global.last_secret
        global.maxcombo = global.last_maxcombo
        global.combofreeze = 0
        global.combotime = 0
        global.combo = 0
        global.combodropped = 1
        room = global.last_room
        with (obj_player)
        {
            targetDoor = global.last_door
            state = states.freefall
            if (character == "N")
                sprite_index = spr_pizzano_bodyslamfall
            else
                sprite_index = spr_playerPZ_poundcancel1
        }
    }
}
