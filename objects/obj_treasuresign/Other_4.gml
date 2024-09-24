ini_open(global.charsave)
levelrank = ini_read_string("Treasure", string(levelsign), 0)
if (levelrank == 0)
    visible = false
else
    visible = true
ini_close()
if (levelrank == "1")
{
    if (levelsign == "entryway")
        image_index = 1
    else if (levelsign == "steamy")
        image_index = 2
    else if (levelsign == "molasses")
        image_index = 3
    else if (levelsign == "mines")
        image_index = 4
}
