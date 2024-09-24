//function anon@14@gml_Object_obj_menupercent_Create_0(argument0) //anon@14@gml_Object_obj_menupercent_Create_0
function scr_percent(argument0)
{
    var levels = ["entryway", "steamy", "molasses", "mines"]
    var percent = 0
    ini_open(argument0)
    if (ini_read_string("Ranks", levels[0], "none") != "none")
        percent++
    if (ini_read_string("Ranks", levels[1], "none") != "none")
        percent++
    if (ini_read_string("Ranks", levels[2], "none") != "none")
        percent++
    if (ini_read_string("Ranks", levels[3], "none") != "none")
        percent++
    if (ini_read_string("Secret", levels[0], 0) == 1)
        percent++
    if (ini_read_string("Secret", levels[0], 0) == 2)
        percent += 2
    if (ini_read_string("Secret", levels[0], 0) == 3)
        percent += 3
    if (ini_read_string("Secret", levels[1], 0) == 1)
        percent++
    if (ini_read_string("Secret", levels[1], 0) == 2)
        percent += 2
    if (ini_read_string("Secret", levels[1], 0) == 3)
        percent += 3
    if (ini_read_string("Secret", levels[2], 0) == 1)
        percent++
    if (ini_read_string("Secret", levels[2], 0) == 2)
        percent += 2
    if (ini_read_string("Secret", levels[2], 0) == 3)
        percent += 3
    if (ini_read_string("Secret", levels[3], 0) == 1)
        percent++
    if (ini_read_string("Secret", levels[3], 0) == 2)
        percent += 2
    if (ini_read_string("Secret", levels[3], 0) == 3)
        percent += 3
    if (ini_read_string("Confecti", (levels[0] + "1"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[0] + "2"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[0] + "3"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[0] + "4"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[0] + "5"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[1] + "1"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[1] + "2"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[1] + "3"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[1] + "4"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[1] + "5"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[2] + "1"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[2] + "2"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[2] + "3"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[2] + "4"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[2] + "5"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[3] + "1"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[3] + "2"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[3] + "3"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[3] + "4"), 0) != 0)
        percent++
    if (ini_read_string("Confecti", (levels[3] + "5"), 0) != 0)
        percent++
    if (ini_read_string("Treasure", levels[0], 0) != 0)
        percent++
    if (ini_read_string("Treasure", levels[1], 0) != 0)
        percent++
    if (ini_read_string("Treasure", levels[2], 0) != 0)
        percent++
    if (ini_read_string("Treasure", levels[3], 0) != 0)
        percent++
    percent *= 2.5
    if (ini_read_string("Ranks", levels[0], "none") == "p" && ini_read_string("Ranks", levels[1], "none") == "p" && ini_read_string("Ranks", levels[2], "none") == "p" && ini_read_string("Ranks", levels[3], "none") == "p")
        percent++
    if (ini_read_real("Lap3", levels[0], 0) != 0 && ini_read_real("Lap3", levels[2], 0) != 0 && ini_read_real("Lap3", levels[2], 0) != 0 && ini_read_real("Lap3", levels[3], 0) != 0)
        percent++
    if file_exists(argument0)
        ini_write_real("Game", "percent", percent)
    ini_close()
}

self.scr_percent("saveData.ini")
self.scr_percent("saveData_2.ini")
self.scr_percent("saveData_3.ini")
self.scr_percent("saveDataN_1.ini")
self.scr_percent("saveDataN_2.ini")
self.scr_percent("saveDataN_3.ini")
drawperc = 0
rizzindex = 0
rizzshake = 0
shake = 0
