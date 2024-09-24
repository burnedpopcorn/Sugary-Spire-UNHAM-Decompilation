use_static = true
static_index = sprite_get_number(spr_tvstatic1204) - 1
static_dir = -1
scr_sound(TVswitchback)
with (obj_player)
{
    if instance_exists(obj_checkpoint)
    {
        var _checkpoint = instance_nearest(x, y, obj_checkpoint)
        x = _checkpoint.x
        y = _checkpoint.y
        instance_create(_checkpoint.x, _checkpoint.y, obj_poofeffect)
    }
    else
    {
        x = roomstartx
        y = roomstarty
        instance_create(roomstartx, roomstarty, obj_poofeffect)
    }
    visible = true
}
