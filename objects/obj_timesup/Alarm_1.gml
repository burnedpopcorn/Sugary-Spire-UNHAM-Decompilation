room_goto(hub_new)
scr_playerreset()
with (obj_player)
{
    backtohub = 1
    x = hubx
    y = huby
    state = states.backtohub
    hsp = 0
    vsp = -20
    sprite_index = spr_player_outofcontrolfall
    if (character == "N")
        sprite_index = spr_pizzano_outofcontrolfall
    scr_sound(bananaslip)
    grounded = false
    image_alpha = 0
    image_index = 0
    global.levelname = -4
}
