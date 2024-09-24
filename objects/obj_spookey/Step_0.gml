var moveX = obj_player.x + obj_player.xscale * -30
var moveY = obj_player.y - 40
if (gotodoor && instance_exists(obj_keydoor))
{
    if (image_xscale == 1)
        moveX = obj_keydoor.x + 50 * image_xscale
    else if (image_xscale == -1)
        moveX = obj_keydoor.x - 50 * image_xscale
    moveY = obj_keydoor.y + 45
}
var movespeed = (distance_to_point(moveX, moveY)) / 200
var d = point_direction(x, y, moveX, moveY)
if (sprite_index != spr_spookey_appear)
{
    hsp = lengthdir_x((18 * movespeed + 0.5), d)
    vsp = lengthdir_y((18 * movespeed + 0.5), d)
    if gotodoor
    {
        x = approach(x, moveX, 4)
        y = approach(y, moveY, 0.85)
        depth = obj_player.depth + 1
    }
    else
    {
        x = approach(x, moveX, hsp)
        y = approach(y, moveY, vsp)
    }
}
if ((!global.key_inv) && (!gotodoor))
    instance_destroy()
if (animation_end() && sprite_index == spr_spookey_appear)
    sprite_index = spr_spookey_idle
if place_meeting(x, (y - 60), obj_keydoor)
{
    if (obj_player.state == states.actor && gotodoor)
    {
        global.key_inv = false
        with (obj_player)
        {
            scr_sound(sound_unlockingdoor)
            state = states.victory
            image_index = 0
            targetDoor = obj_keydoor.targetDoor
            targetRoom = obj_keydoor.targetRoom
            instance_create(x, y, obj_lock)
        }
        obj_camera.chargecamera = 0
        with (obj_keydoor)
        {
            ds_list_add(global.saveroom, id)
            image_index = 0
            sprite_index = spr_doorvisited
            image_speed = 0.35
        }
        gotodoor = false
        global.roomsave = false
    }
}
