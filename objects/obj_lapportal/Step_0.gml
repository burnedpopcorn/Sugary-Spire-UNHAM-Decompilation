if global.panic
{
    image_alpha = 1
    if (sprite_index == spr_lapportalPZ)
    {
        playerid = noone
        with (obj_player)
        {
            if (other.playerid == noone && place_meeting(x, y, other))
            {
                scr_sound(sfx_lapenter)
                state = states.actor
                visible = false
                if (room == entryway_portal)
                {
                    if (character == "N")
                        other.sprite_index = spr_pizzano_lapportal
                    else
                        other.sprite_index = spr_lapportalendPZ
                }
                else if (character == "N")
                    other.sprite_index = spr_pizzano_lapportalR
                else
                    other.sprite_index = spr_lapportalendRPZ
                other.image_index = 0
                other.playerid = id
                global.collect += 3000
                global.combotime = 60
                global.combofreeze = 30
                create_small_number(x, y, "3000")
                if (ds_list_find_index(global.saveroom, other.id) == -1)
                    ds_list_add(global.saveroom, other.id)
            }
        }
    }
    else if (sprite_index == spr_lapportalendPZ || sprite_index == spr_lapportalendRPZ || sprite_index == spr_pizzano_lapportal || sprite_index == spr_pizzano_lapportalR)
    {
        with (playerid)
        {
            hsp = 0
            vsp = 0
            visible = false
        }
        if (floor(image_index) == (image_number - 1))
        {
            image_index = image_number - 1
            image_speed = 0
            if (!instance_exists(obj_fadeout))
            {
                with (obj_player)
                {
                    targetDoor = "LAP"
                    targetRoom = other.targetRoom
                }
                for (var i = 0; i < ds_list_size(global.escaperoom); i++)
                {
                    var b = ds_list_find_value(global.escaperoom, i)
                    var q = ds_list_find_index(global.baddieroom, b)
                    var t = false
                    if (q == -1)
                    {
                        q = ds_list_find_index(global.saveroom, b)
                        t = true
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
                global.lapcount += 1
                var time_array = scr_laptimes()
                if (global.lappingsys == 0)
                {
                    if (global.minutes >= 0 && global.seconds > 0)
                    {
                        global.minutes += time_array[0]
                        global.seconds += time_array[1]
                    }
                }
                else if (global.lapcount > 1)
                {
                    global.minutes = 0
                    global.seconds = 0
                }
                else if (global.minutes >= 0 && global.seconds > 0)
                {
                    global.minutes += time_array[0]
                    global.seconds += time_array[1]
                }
                if (global.lapcount == 2 && global.lappingsys == 1)
                    global.last_score = global.collect
                global.last_treasure = global.treasure
                global.last_secret = global.secretfound
                global.last_maxcombo = global.maxcombo
                audio_stop_sound(mu_escape)
                audio_stop_sound(mu_pizzano_escape)
                if (global.lappingsys == 1)
                {
                    audio_stop_sound(mu_laplap)
                    audio_stop_sound(mu_lap2Pizzano)
                }
                instance_create(0, 0, obj_fadeout)
            }
            if (global.lappingsys == 1 && global.lapcount == 2)
            {
                obj_tv.message = "Checkpoint set!"
                obj_tv.showtext = 1
                obj_tv.alarm[0] = 150
            }
        }
    }
}
else
    image_alpha = 0.5
