image_xscale += 1
image_yscale += 1
if (image_xscale > 14 && image_yscale > 14)
{
    obj_mainfartselect.abletomove = false
    if (!instance_exists(obj_fadeout))
    {
        obj_player.targetRoom = spireintro
        obj_player.targetDoor = "A"
        instance_create(x, y, obj_fadeout)
    }
    obj_mainfartselect.game_started = 1
    obj_mainfartselect.abletomove = false
}
