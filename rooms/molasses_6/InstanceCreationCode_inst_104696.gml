//function anon@12@gml_RoomCC_molasses_6_8_Create() //anon@12@gml_RoomCC_molasses_6_8_Create
condition = function()
{
    return (place_meeting(x, y, obj_player) && obj_player.state == 72);
}

//function anon@123@gml_RoomCC_molasses_6_8_Create() //anon@123@gml_RoomCC_molasses_6_8_Create
output = function()
{
    inst_61588644.alarm[1] = 5
    inst_32550AD4.alarm[1] = 10
    inst_4523D294.alarm[1] = 1
}

/*
output = function()
{
    104704.alarm[1] = 5
    104694.alarm[1] = 10
    104698.alarm[1] = 1
}

