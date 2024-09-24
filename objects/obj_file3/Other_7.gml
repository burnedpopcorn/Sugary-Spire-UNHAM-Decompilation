if (!visible)
    return;
if (sprite_index == spr_file3confirm && (!instance_exists(obj_fadeout)))
{
    obj_player.targetRoom = spireintro
    obj_player.targetDoor = "A"
    instance_create(x, y, obj_fadeout)
}
