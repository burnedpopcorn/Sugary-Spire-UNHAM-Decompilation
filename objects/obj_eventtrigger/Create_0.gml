inst_num = instance_number(obj_eventtrigger)
condition = -4
output = -4
reverse_output = -4
//function anon@120@gml_Object_obj_eventtrigger_Create_0() //anon@120@gml_Object_obj_eventtrigger_Create_0
default_condition = function()
{
    return place_meeting(x, y, obj_player);
}

//function anon@198@gml_Object_obj_eventtrigger_Create_0() //anon@198@gml_Object_obj_eventtrigger_Create_0
default_output = function()
{
    show_debug_message("Event Trigger:" + string(id) + " - Has missing Output")
}

flags = 
{
    do_once: true,
    do_save: true,
    do_once_per_save: false,
    saveroom: global.saveroom
}

activated = false
condition = default_condition
output = default_output
reverse_output = -4
