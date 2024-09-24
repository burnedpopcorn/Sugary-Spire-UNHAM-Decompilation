var _check = false
if (room == room_gmliveblank && global.GMLIVE_roomstart)
{
    _check = true
    global.GMLIVE_roomstart = false
}
else if (room != room_gmliveblank)
{
    _check = true
    global.GMLIVE_realroom = room
}
if _check
    event_user(0)
if instance_exists(obj_secretfound)
{
    if (!instance_exists(obj_ghostcollectibles))
    {
        instance_create(0, 0, obj_ghostcollectibles)
        trace(instance_number(obj_ghostcollectibles))
    }
}
if (global.panicking == 1)
{
    if (instance_exists(obj_secretportalstart) && global.secretroom == 0)
        scr_escapebgs()
}
if (global.lvldesign == 1)
    scr_changebgs()
