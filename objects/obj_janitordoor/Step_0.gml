if ((obj_player.state == states.normal || obj_player.state == states.mach1 || obj_player.state == states.mach2 || obj_player.state == states.mach3 || obj_player.state == states.Sjumpprep) && obj_player.key_up && obj_player.grounded && global.rudejanitor == 1 && image_index == 0 && place_meeting(x, y, obj_player))
{
    ds_list_add(global.saveroom, id)
    if (global.lappingsys == 1 && global.lapcount == 2)
        ds_list_add(global.escaperoom, id)
    scr_sound(sound_unlockingdoor)
    scr_sound(Cheers)
    with (obj_player)
    {
        targetRoom = other.targetRoom
        targetDoor = other.targetDoor
    }
    if global.rudejanitor
    {
        obj_rudejanitorfollow.visible = false
        with (instance_create((obj_player.x - 30), obj_player.y, obj_rudejanitoranim))
        {
            sprite_index = spr_rudejanitor_opendoor
            image_index = 0
            image_speed = 0.35
        }
        obj_player.state = states.victory
        obj_player.sprite_index = obj_player.spr_victory
        obj_player.image_index = 0
    }
    image_index = 1
}
if ((place_meeting(x, y, obj_player) && floor(obj_player.image_index) == (obj_player.image_number - 1) && (obj_player.state == states.victory || obj_player.state == states.door)) || ((obj_player.state == states.normal || obj_player.state == states.mach1 || obj_player.state == states.mach2 || obj_player.state == states.mach3 || obj_player.state == states.Sjumpprep) && obj_player.key_up && obj_player.grounded && image_index == 1 && place_meeting(x, y, obj_player)))
{
    with (obj_player)
    {
        mach2 = 0
        image_index = 0
        state = states.door
        obj_player.targetDoor = other.targetDoor
        obj_player.targetRoom = other.targetRoom
        state = states.door
        if (!instance_exists(obj_fadeout))
        {
            obj_rudejanitorfollow.visible = true
            instance_create(x, y, obj_fadeout)
        }
    }
}
if place_meeting(x, y, obj_doorA)
    targetDoor = "A"
if place_meeting(x, y, obj_doorB)
    targetDoor = "B"
if place_meeting(x, y, obj_doorC)
    targetDoor = "C"
if place_meeting(x, y, obj_doorD)
    targetDoor = "D"
if place_meeting(x, y, obj_doorE)
    targetDoor = "E"
