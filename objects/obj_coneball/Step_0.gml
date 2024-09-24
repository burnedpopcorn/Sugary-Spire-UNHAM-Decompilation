var playerid = obj_player
if (!instance_exists(playerid))
    return;
var _move = true
with (obj_player)
{
    if (state == states.victory || state == states.keyget || state == states.gottreasure || state == states.door || state == states.actor || place_meeting(x, y, obj_secretportal))
        _move = false
}
if (image_alpha >= 1)
{
    if (!instance_exists(obj_fadeout))
    {
        if _move
        {
            var dir = point_direction(x, y, playerid.x, playerid.y)
            if global.nerfconeball
            {
                switch room
                {
                    case molasses_9:
                        maxspeed = 4
                        break
                    case molasses_13:
                    case molasses_6:
                        maxspeed = 5
                        break
                    case molasses_10:
                    case molasses_12:
                    case mines_12:
                        maxspeed = 6
                        break
                    case molasses_11:
                    case molasses_4:
                    case entrywaynew_6b:
                        maxspeed = 7
                        break
                    default:
                        maxspeed = 8
                        break
                }

            }
            if (obj_player.state == states.hitenemy)
                maxspeed = 0
            x = approach(x, obj_player.x, lengthdir_x(maxspeed, dir))
            y = approach(y, obj_player.y, lengthdir_y(maxspeed, dir))
        }
    }
}
else
    image_alpha += 0.01
if (!_move)
    image_alpha = approach(image_alpha, 0, 0.1)
if (playerid.state == states.hitenemy)
    maxspeed = 0
if (_move && place_meeting(x, y, playerid) && playerid.state != states.actor && (!instance_exists(obj_fadeout)) && (!instance_exists(obj_endlevelfade)) && image_alpha >= 1)
{
    with (obj_player)
    {
        targetRoom = timesuproom
        targetDoor = "A"
        if (!instance_exists(obj_fadeout))
        {
            instance_create(x, y, obj_fadeout)
            audio_stop_all()
            scr_sound(mu_timesup)
        }
        state = states.timesup
        instance_destroy(obj_coneball)
        if (global.lapcount == 2 && global.lappingsys == 1)
        {
            obj_tv.message = "Press any key to try again"
            obj_tv.showtext = 1
            obj_tv.alarm[0] = 150
        }
    }
}
if (fire_afterimagetimer > 0)
    fire_afterimagetimer--
if (fire_afterimagetimer <= 0)
{
    with (instance_create(x, y, obj_coneball_effect))
    {
        playerid = other.id
        image_blend = make_colour_rgb(248, 0, 0)
        image_alpha = 1
        sprite_index = other.sprite_index
        image_index = other.image_index
        image_speed = 0
        image_angle = other.image_angle
        image_xscale = other.image_xscale
        image_yscale = other.image_yscale
        playerid = other.id
    }
    fire_afterimagetimer = 6
}
