if (fadealpha > 1)
{
    fadein = true
    if instance_exists(obj_player)
    {
        if room_exists(obj_player.targetRoom)
        {
            room_goto(obj_player.targetRoom)
            if (room != realtitlescreen)
            {
                ini_open(global.charsave)
                if (obj_player.targetRoom == outer_room1)
                {
                    global.savetimermiliseconds = ini_read_real("Game", "savetimermiliseconds", 0)
                    global.savetimerseconds = ini_read_real("Game", "savetimerseconds", 0)
                    global.savetimerminutes = ini_read_real("Game", "savetimerminutes", 0)
                    global.savetimerhour = ini_read_real("Game", "savetimerhour", 0)
                    global.playtimerhour = 0
                    global.playtimermiliseconds = 0
                    global.playtimerminutes = 0
                    global.playtimerseconds = 0
                }
                ini_write_real("Game", "savetimermiliseconds", global.savetimermiliseconds)
                ini_write_real("Game", "savetimerseconds", global.savetimerseconds)
                ini_write_real("Game", "savetimerminutes", global.savetimerminutes)
                ini_write_real("Game", "savetimerhour", global.savetimerhour)
                ini_close()
            }
        }
        else
            room_goto(rm_missing)
    }
}
if (!fadein)
    fadealpha += 0.1
else if fadein
    fadealpha -= 0.1
if instance_exists(obj_player)
{
    with (obj_player)
    {
        if (other.fadein && (obj_player.state == states.door || obj_player.state == states.victory) && (place_meeting(x, y, par_door) || place_meeting(x, y, obj_startgate)))
        {
            state = states.comingoutdoor
            image_index = 0
        }
        if (other.fadein && obj_player.state == states.door && (obj_player.sprite_index == spr_player_downpizzabox || obj_player.sprite_index == spr_player_uppizzabox || obj_player.sprite_index == spr_pizzano_downpizzabox || obj_player.sprite_index == spr_pizzano_uppizzabox))
            state = states.crouchjump
        if (baddiegrabbedID != noone && state != states.door && state != states.victory)
        {
            with (baddiegrabbedID)
            {
                persistent = true
                x = obj_player.x
                y = obj_player.y - 40
                if (obj_player.state == states.charge)
                    y = obj_player.y
            }
        }
    }
}
if (fadein && fadealpha < 0)
{
    instance_destroy()
    with (obj_player.baddiegrabbedID)
        persistent = false
}
