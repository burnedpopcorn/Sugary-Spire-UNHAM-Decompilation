if (got && obj_player.state != states.gottreasure)
    instance_destroy()
if (!got)
    y = wave((ystart - 5), (ystart + 5), 2, 2)
if place_meeting(x, y, obj_player)
{
    var num = instance_place_list(x, y, obj_player, global.instancelist, false)
    for (var i = 0; i < num; i++)
    {
        var _player = ds_list_find_value(global.instancelist, i)
        with (_player)
        {
            treasure_x = x
            treasure_y = y
            treasure_room = room
            ds_list_add(global.saveroom, other.id)
            if (global.lappingsys == 1 && global.lapcount == 2)
                ds_list_add(global.escaperoom, other.id)
            global.treasure = true
            global.combotime = 60
            hsp = 0
            vsp = 0
            if (!other.got)
            {
                other.alarm[0] = 150
                state = states.gottreasure
                scr_sound(sfx_treasure)
            }
            other.got = true
            other.x = x - 18
            other.y = y - 35
            other.effectid = instance_create((other.x + 18), other.y, obj_treasureeffect)
            obj_player.vsp = 0
            other.depth = -20
            other.player = obj_player
            ds_list_clear(global.instancelist)
        }
    }
    ds_list_clear(global.instancelist)
}
if audio_is_playing(sfx_coneball)
    audio_stop_sound(sfx_coneball)
