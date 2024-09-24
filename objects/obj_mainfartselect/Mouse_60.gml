if ((!testcodeconfirm) || (!abletomove))
    return;
extrasave += 3
ini_open(global.charsave)
obj_player.paletteselect = ini_read_real("Game", "pal", 1)
with (obj_playerhat)
    image_index = ini_read_real("Game", "hat", 0)
ini_close()
obj_menupercent.rizzshake = 8
