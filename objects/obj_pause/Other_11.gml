var roomname = room_get_name(room)
if scr_roomreset(true)
{
    global.gamepaused = 0
    instance_activate_all()
    scr_playerreset()
    pause = false
    room = obj_player.startroom
    with (obj_player)
    {
        targetDoor = "A"
        targetRoom = startroom
    }
    with (instance_create(x, y, obj_fadeout))
    {
        fadealpha = 1
        fadein = true
    }
}
else
    scr_sound(sound_enemythrow)
