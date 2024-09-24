function scr_player_noclip() //scr_player_noclip
{
    visible = true
    image_blend = c_white
    move = key_left + key_right
    hsp = movespeed
    var modify = 6
    if key_attack
        modify = 12
    if (move != 0)
        movespeed = approach(movespeed, (move * modify), 0.5)
    else
        movespeed = approach(movespeed, 0, 0.6)
    if (move != 0)
        xscale = move
    var move2 = (-((key_up + (-key_down))))
    vsp = wallspeed
    if (move2 != 0)
        wallspeed = approach(wallspeed, (move2 * modify), 0.5)
    else
        wallspeed = approach(wallspeed, 0, 0.65)
    x += hsp
    y += vsp
    image_speed = 0.35
    sprite_index = spr_noclip
    if key_jump
    {
        wallspeed = 0
        movespeed = tauntstoredmovespeed
        if (tauntstoredstate == states.climbwall)
            wallspeed = tauntstoredmovespeed
        sprite_index = tauntstoredsprite
        state = tauntstoredstate
        if (state == states.hurt)
            state = states.normal
        vsp = tauntstoredvsp
        yscale = 1
    }
}

