function scr_tip(argument0 = "none")
{
    ini_open(global.charsave);
    
    if (ini_read_real("Tip", argument0, 0) == 1)
    {
        ini_close();
        exit;
    }
    
    var b = -4;
    
    with (instance_create(0, 0, obj_transfotip))
    {
        type = argument0;
        b = id;
    }
    
    ini_write_real("Tip", argument0, true);
    ini_close();
    return b;
    trace(string(b) + ": " + string(argument0));
}
