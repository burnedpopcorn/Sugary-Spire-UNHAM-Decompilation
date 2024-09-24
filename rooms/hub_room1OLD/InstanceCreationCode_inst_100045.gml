//function anon@27@gml_RoomCC_hub_room1OLD_11_Create() //anon@27@gml_RoomCC_hub_room1OLD_11_Create
condition = function()
{
    return (!instance_exists(108022));
}

//function anon@96@gml_RoomCC_hub_room1OLD_11_Create() //anon@96@gml_RoomCC_hub_room1OLD_11_Create
output = function()
{
    if instance_exists(107951)
    {
        with (107951)
            Region_active = false
    }
}

