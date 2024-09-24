function scr_shell_openconsole() //scr_shell_openconsole
{
    global.shellactivate = true
}

function scr_shell_closeconsole() //scr_shell_closeconsole
{
    if instance_exists(obj_pause)
    {
        obj_pause.canmove = false
        obj_pause.alarm[0] = 3
        obj_pause.key_jump = false
    }
    if instance_exists(obj_mainfartselect)
    {
        obj_mainfartselect.abletomove = false
        obj_mainfartselect.alarm[0] = 3
    }
    global.shellactivate = false
}

function scr_fartcommand(argument0) //scr_fartcommand
{
    if (argument0 == undefined)
        argument0 = "BALLS"
    switch argument0
    {
        case "fart":
        case "poop":
        case "crap":
        case "fard":
        case "shart":
        case "shit":
        case "brap":
            return true;
    }

}

function scr_shell_roomstart() //scr_shell_roomstart
{
    toggle_collision_function()
}

