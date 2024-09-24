var p = false
with (obj_player)
{
    if (targetDoor == "LAP")
    {
        p = true
        state = states.actor
        x = other.x
        y = other.y
        roomstartx = x
        roomstarty = y
        visible = false
    }
}
if (!p)
    instance_destroy()
else
    active = true
if (global.lapcount == 2 && global.lappingsys == 1)
{
    global.last_room = room
    global.last_door = obj_player.targetDoor
}
