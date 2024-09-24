selected = 0
lightX = 96
abletomove = false
alarm[0] = 10
depth = 250
xi = 480
yi = 600
drawx = room_width / 2
showtext = false
_message = ""
charicon = spr_pizzelle_switch
charindex = 0
icon_y = 0
icon_y_buffer = 0
pizzano_unlocked = 0
char_select = 1
prevcharselect = 1
//function anon@316@gml_Object_obj_mainfartselect_Create_0(argument0) //anon@316@gml_Object_obj_mainfartselect_Create_0
function unlock_pizzano(argument0)
{
    ini_open("optionData.ini")
    if (ini_read_real("Game", "creditsunlocked", 0) == 1)
    {
        if (ini_read_real("Game", "pizzaunlocked", 0) == 0)
        {
            ini_write_real("Game", "pizzaunlocked", 1)
            instance_create(0, 0, obj_pizzanounlocked)
            if (!instance_exists(obj_saveicon))
                instance_create_depth(0, 0, -1000, obj_saveicon)
            else
            {
                with (obj_saveicon)
                    finishbuffer = 200
            }
        }
        pizzano_unlocked = 1
    }
    ini_close()
}

//false.(false).unlock_pizzano(self)
self.unlock_pizzano(false);
// argument wont do anything, so why have one?
game_started = 0
prevselected = 0
showpizzano = 0
menuindex = 0
//function anon@902@gml_Object_obj_mainfartselect_Create_0(argument0) //anon@902@gml_Object_obj_mainfartselect_Create_0
function delete_emptysave(argument0)
{
    ini_open(argument0)
    if ((!ini_section_exists("Ranks")) && (!ini_section_exists("Confecti")) && (!ini_section_exists("Treasure")) && (!ini_section_exists("Secret")) && (!ini_section_exists("Highscore")) && file_exists(argument0))
        file_delete(argument0)
    ini_close()
}

self.delete_emptysave("saveData.ini")
self.delete_emptysave("saveData_2.ini")
self.delete_emptysave("saveData_3.ini")
self.delete_emptysave("saveDataN_1.ini")
self.delete_emptysave("saveDataN_2.ini")
self.delete_emptysave("saveDataN_3.ini")
self.delete_emptysave("saveData_test.ini")
testcode = ""
testcodeconfirm = 0
extrasave = 0
