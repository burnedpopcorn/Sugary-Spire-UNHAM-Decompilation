with (obj_player)
{
    if (place_meeting(x, y, other.id) && key_up && grounded && (state == states.normal || state == states.Sjumpprep || state == states.mach1 || state == states.mach2 || state == states.mach3 || state == states.machtumble || state == states.pizzano) && (!instance_exists(obj_fadeout)) && state != states.door && state != states.victory && state != states.comingoutdoor)
    {
        mach2 = 0
        image_index = 0
        obj_camera.chargecamera = 0
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        state = states.door
        global.roomsave = false
        if (other.id == 106644)
        {
            hubx = other.x - other.sprite_xoffset + other.sprite_width / 2
            huby = other.y - other.sprite_yoffset + other.sprite_height / 2
        }
        if (other.object_index == obj_creditsdoor)
        {
            ini_open("optionData.ini")
            if (ini_read_real("Game", "creditsunlocked", 0) == 0)
            {
                ini_write_real("Game", "creditsunlocked", 1)
                if (!instance_exists(obj_saveicon))
                    instance_create_depth(0, 0, -1000, obj_saveicon)
                else
                {
                    with (obj_saveicon)
                        finishbuffer = 200
                }
            }
            ini_close()
        }
    }
}
