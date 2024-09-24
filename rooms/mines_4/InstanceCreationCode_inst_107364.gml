flags.do_once_per_save = true
//function anon@43@gml_RoomCC_mines_4_6_Create() //anon@43@gml_RoomCC_mines_4_6_Create
condition = function()
{
    return (ds_list_find_index(global.saveroom, 107312) != -1 && (!global.minesProgress));
}

//function anon@250@gml_RoomCC_mines_4_6_Create() //anon@250@gml_RoomCC_mines_4_6_Create
output = function()
{
    global.minesProgress = true
    obj_music.fadeoff = 0
    audio_stop_all_music()
}

