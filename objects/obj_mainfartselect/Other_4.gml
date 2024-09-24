with (obj_player)
{
    character = "P"
    other.showpizzano = 0
    global.savefile = other.selected + 1
    global.charsave = "saveData.ini"
    other.prevselected = 0
    ini_open(global.charsave)
    paletteselect = ini_read_real("Game", "pal", 1)
    with (obj_playerhat)
        image_index = ini_read_real("Game", "hat", 0)
    ini_close()
    backtohub = 0
    if (state == states.backtohub)
        state = states.titlescreen
    obj_player.visible = false
}
