var time_array;
function scr_escapetimes(argument0) //scr_escapetimes
{
    if (argument0 == undefined)
        argument0 = room
    var seconds = 0
    var minutes = 0
    switch argument0
    {
        case steamy_12:
            minutes = 4
            seconds = 0
            break
        case entryway_11:
            minutes = 2
            seconds = 30
            break
        case entrywaynew_11:
            minutes = 3
            seconds = 0
            break
        case molasses_9:
            minutes = 5
            seconds = 0
            break
        case mines_11:
            minutes = 4
            seconds = 50
            break
        default:
            minutes = 0
            seconds = 10
            break
    }

    time_array[0] = minutes
    time_array[1] = seconds
    return time_array;
}

function scr_laptimes(argument0) //scr_laptimes
{
    if (argument0 == undefined)
        argument0 = room
    seconds = 0
    minutes = 0
    switch argument0
    {
        case entryway_portal:
            minutes = 0
            seconds = 45
            break
        case steamy_1:
            minutes = 1
            seconds = 0
            break
        case molasses_1:
            minutes = 1
            seconds = 20
            break
        case mines_1:
            minutes = 1
            seconds = 10
            break
        default:
            minutes = 0
            seconds = 45
            break
    }

    time_array[0] = minutes
    time_array[1] = seconds
    return time_array;
}

