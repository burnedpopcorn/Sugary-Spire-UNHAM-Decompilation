switch global.levelname
{
    case "entryway":
        tvbgindex = 0
        break
    case "steamy":
        tvbgindex = 1
        break
    case "molasses":
        tvbgindex = 2
        break
    case "mines":
        tvbgindex = 3
        break
    default:
        tvbgindex = 5
}

if (room == outer_room1 || room == outer_room2 || room == hub_room1 || room == tutorial_1 || room == tutorial_2 || room == tutorial_3 || room == tutorial_4 || room == tutorial_5 || room == tutorial_6 || room == tutorial_7 || room == tutorial_8 || room == tutorial_9 || room == tutorial_10)
    tvbgindex = 5
if instance_exists(obj_secretfound)
    tvbgindex = 4
if (room == steamy_1)
{
    global.srank = 36500
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
}
if (room == entryway_1 || room == entrywaynew_1)
{
    global.srank = 17000
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
}
if (room == molasses_1)
{
    global.srank = 31500
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
}
if (room == mines_1)
{
    global.srank = 35000
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
}
