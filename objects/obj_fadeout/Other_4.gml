if (room == outer_room1 && obj_player.state != states.bossintro)
{
    obj_player.state = states.bossintro
    obj_player.movespeed = 2
    obj_player.xscale = 1
}
if (room == hub_start && global.gateclosed == 0)
{
    obj_player.vsp = 0
    obj_player.xscale = 1
    obj_player.movespeed = 0
    obj_player.state = states.comingoutdoor
    obj_player.image_index = 0
    obj_player.targetDoor = "A"
}
if (xtox == 1 && room == hub_new)
{
    obj_player.x = 160
    obj_player.y = 1984
    xtox = 0
}
