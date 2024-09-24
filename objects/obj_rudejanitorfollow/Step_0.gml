if (obj_player.x != x)
    drawxscale = (-(sign(x - obj_player.x)))
switch state
{
    case states.normal:
        scr_confecti_normal()
        break
    case states.titlescreen:
        scr_confecti_taunt()
        break
    case states.hookshot:
        scr_confecti_appear()
        break
}

if (room == rank_room)
    visible = false
if (room == room_treasure)
    visible = true
