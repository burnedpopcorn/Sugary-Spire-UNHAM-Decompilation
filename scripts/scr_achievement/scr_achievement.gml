function scr_hatScript() //scr_hatScript
{
    ini_open(global.charsave)
    var entryway = ini_read_string("Ranks", "entryway", "none")
    var steamy = ini_read_string("Ranks", "steamy", "none")
    var molasses = ini_read_string("Ranks", "molasses", "none")
    var mines = ini_read_string("Ranks", "mines", "none")
    ini_close()
    ini_open("optionData.ini")
    if ((!(ini_read_real("HatsUnlock", "Entryway", false))) && (entryway == "s" || entryway == "p"))
    {
        ini_write_real("HatsUnlock", "Entryway", true)
        with (instance_create(0, 0, obj_gethat))
            hatindex = 1
    }
    if ((!(ini_read_real("HatsUnlock", "Cottontown", false))) && (steamy == "s" || steamy == "p"))
    {
        ini_write_real("HatsUnlock", "Cottontown", true)
        with (instance_create(0, 0, obj_gethat))
            hatindex = 2
    }
    if ((!(ini_read_real("HatsUnlock", "Molasses", false))) && (molasses == "s" || steamy == "p"))
    {
        ini_write_real("HatsUnlock", "Molasses", true)
        with (instance_create(0, 0, obj_gethat))
            hatindex = 3
    }
    if ((!(ini_read_real("HatsUnlock", "Mines", false))) && (mines == "s" || steamy == "p"))
    {
        ini_write_real("HatsUnlock", "Mines", true)
        with (instance_create(0, 0, obj_gethat))
            hatindex = 4
    }
    if ((!(ini_read_real("HatsUnlock", "World1", false))) && entryway != "none" && steamy != "none" && molasses != "none" && mines != "none")
    {
        ini_write_real("HatsUnlock", "World1", true)
        with (instance_create(0, 0, obj_gethat))
            hatindex = 5
    }
    ini_close()
}

