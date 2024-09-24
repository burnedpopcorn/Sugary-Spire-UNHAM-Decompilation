if (ds_list_find_index(global.saveroom, id) != -1)
    instance_destroy()
switch global.levelname
{
    case "steamy":
        image_index = 1
        break
    case "molasses":
        image_index = 2
        break
    case "mines":
        image_index = 3
        break
    default:
        image_index = 0
        break
}

