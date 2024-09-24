if (ds_list_find_index(global.baddieroom, id) == -1 || important)
{
    repeat (3)
    {
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
    }
    instance_create(x, (y + 30), obj_bangeffect)
    camera_shake(3, 3)
    if (object_index != obj_googlyjuice)
    {
        with (instance_create(x, y, obj_sausageman_dead))
            sprite_index = other.deadspr
    }
    if (object_index != obj_googlyjuice)
    {
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

        if chance(0.1)
            scr_sound(sfx_scream1, sfx_scream2, sfx_scream3, sfx_scream4, sfx_scream5, sfx_scream6)
    }
    if (!important)
    {
        global.combo++
        create_small_number(x, y, string(10 + (floor(global.combo * 0.5))))
        var combototal = 10 + (floor(global.combo * 0.5))
        global.collect += combototal
        global.comboscore += combototal
        global.combotime = 60
        global.style += 4
        global.combofreeze = 30
        obj_player.supercharge++
    }
    ds_list_add(global.baddieroom, id)
    if (panicEscape || (global.lappingsys == 1 && global.lapcount == 2))
        ds_list_add(global.escaperoom, id)
}
