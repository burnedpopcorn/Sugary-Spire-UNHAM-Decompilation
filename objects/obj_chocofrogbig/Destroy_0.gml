if (ds_list_find_index(global.saveroom, id) == -1)
{
    instance_create((x + sprite_width / 2), (y + sprite_height / 2), obj_poofeffect)
    with (instance_create((x + sprite_width / 2), (y + sprite_height / 2), obj_sausageman_dead))
        sprite_index = other.deadSpr
    if (object_index == obj_chocofrogsmall)
        scr_sound(froghurt1, froghurt2, froghurt3)
    else
        scr_sound(frogdeath1, frogdeath2, frogdeath3)
    ds_list_add(global.saveroom, id)
    global.combo++
    switch global.combo
    {
        case 0:
        case 1:
            create_small_number(x, y, "10")
            var combototal = 10
            global.collect += 10
            global.comboscore += 10
            break
        case 2:
            create_small_number(x, y, "20")
            combototal = 20
            global.collect += 20
            global.comboscore += 20
            break
        case 3:
            create_small_number(x, y, "40")
            combototal = 40
            global.collect += 40
            global.comboscore += 40
            break
        default:
            create_small_number(x, y, "80")
            combototal = 80
            global.collect += 80
            global.comboscore += 80
            break
    }

    switch global.combo
    {
        case 0:
        case 1:
            scr_sound(sound_combo1)
            break
        case 2:
            scr_sound(sound_combo2)
            break
        case 3:
            scr_sound(sound_combo3)
            break
        default:
            scr_sound(sound_combo4)
            break
    }

    global.combotime = 60
    global.style += 4
    global.combofreeze = 30
    obj_player.supercharge++
}
