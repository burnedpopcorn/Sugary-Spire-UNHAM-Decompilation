with (obj_player)
{
    if (room == rank_room)
    {
        obj_player.x = lerp(obj_player.x, 480, 0.1)
        obj_player.y = lerp(obj_player.y, 270, 0.1)
    }
}
obj_camera.visible = false
if (fadealpha > 1)
{
    fadein = true
    if (room != rank_room)
        room = rank_room
    ini_open(global.charsave)
    global.savetimermiliseconds = ini_read_real("Game", "savetimermiliseconds", 0)
    global.savetimerseconds = ini_read_real("Game", "savetimerseconds", 0)
    global.savetimerminutes = ini_read_real("Game", "savetimerminutes", 0)
    global.savetimerhour = ini_read_real("Game", "savetimerhour", 0)
    ini_close()
}
if (!fadein)
    fadealpha += 0.1
else if (fadein == 1)
    fadealpha -= 0.1
bgspeed--
if (waitbuffer != 0)
    waitbuffer--
if (waitbuffer == 0)
{
    if (bgwaitalpha != 1)
        bgwaitalpha += 0.1
}
if (flashbuffer > 0)
    flashbuffer--
