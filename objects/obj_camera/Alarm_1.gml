if (global.panic || global.timetrial)
{
    global.seconds -= 1
    if (global.collect >= 5)
    {
        global.collect -= 5
        with (instance_create(obj_player.x, obj_player.y, obj_pizzaloss))
            sprite_index = choose(spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5)
    }
    if (global.seconds < 0)
    {
        global.seconds = 59
        global.minutes -= 1
    }
}
if global.starrmode
{
    global.seconds -= 1
    if (global.seconds < 0)
    {
        global.seconds = 59
        global.minutes -= 1
    }
}
alarm[1] = 60
