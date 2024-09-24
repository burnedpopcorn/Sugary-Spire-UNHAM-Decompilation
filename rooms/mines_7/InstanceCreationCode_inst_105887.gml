//function anon@9@gml_RoomCC_mines_7_14_Create() //anon@9@gml_RoomCC_mines_7_14_Create
output = function()
{
    with (105663)
    {
        if (!(ds_list_find_index(global.saveroom, id) != -1))
        {
            instance_create(x, y, obj_cloudeffect)
            repeat (3)
                instance_create((x + (random_range(-5, 5))), (y + (random_range(-5, 5))), obj_cloudeffect)
            instance_destroy()
        }
    }
    with (105662)
    {
        if (!(ds_list_find_index(global.saveroom, id) != -1))
        {
            instance_create(x, y, obj_cloudeffect)
            repeat (3)
                instance_create((x + (random_range(-5, 5))), (y + (random_range(-5, 5))), obj_cloudeffect)
            instance_destroy()
        }
    }
}

