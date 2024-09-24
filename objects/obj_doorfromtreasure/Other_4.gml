event_inherited()
switch global.levelname
{
    case "entryway":
        targetRoom = entryway_8
        if global.layout
            targetRoom = entrywaynew_8
        targetDoor = "A"
        break
    case "steamy":
        targetRoom = steamy_12
        targetDoor = "B"
        break
    case "molasses":
        targetRoom = molasses_9
        targetDoor = "C"
        break
    case "mines":
        targetRoom = mines_6
        targetDoor = "D"
        break
}

