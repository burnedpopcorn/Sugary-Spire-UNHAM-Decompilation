if ((ds_list_find_index(global.saveroom, id) != -1 && (!global.panic)) || (global.gateclosed == 1 && room == hub_start))
    sprite_index = spr_exitgateclosed
