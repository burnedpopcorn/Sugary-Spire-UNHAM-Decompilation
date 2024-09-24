if (room != rank_room && room != hub_room1 && room != hub_public && room != outer_room1 && room != outer_room2 && room != scootercutsceneidk && room != rm_verify && room != secrets_await && room != hub_start && room != hub_hall && room != hub_new && room != devroom && room != rm_credits && room != hub_bikinibottom)
{
    global.gamepaused = 0
    pause = 0
    instance_activate_all()
    scr_playerreset()
    with (obj_tv)
        tvsprite = spr_tvoff
    global.levelname = -4
    with (obj_player)
    {
        backtohub = 1
        x = hubx
        y = huby
        var roomname = room_get_name(room)
        if (string_letters(roomname) == "tutorial" || room == outer_room1 || room == outer_room2)
        {
            room = hub_new
            image_index = 0
            hsp = 0
            vsp = 0
            state = states.comingoutdoor
            x = 530
            y = 1362
        }
        else
        {
            room = hub_new
            state = states.backtohub
            hsp = 0
            vsp = -18
            sprite_index = spr_player_outofcontrolfall
            if (character == "N")
                sprite_index = spr_pizzano_outofcontrolfall
            grounded = false
            image_alpha = 0
            image_index = 0
            scr_sound(bananaslip)
        }
    }
    with (instance_create(x, y, obj_fadeout))
    {
        fadealpha = 1
        fadein = true
    }
}
else if (room == hub_room1 || room == hub_public || room == outer_room1 || room == outer_room2 || room == scootercutsceneidk || room == secrets_await || room == devroom || room == hub_start || room == hub_hall || room == hub_new || room == rm_credits || room == hub_bikinibottom)
{
    global.gateclosed = 0
    global.gamepaused = 0
    pause = 0
    instance_activate_all()
    scr_playerreset()
    room = realtitlescreen
    with (obj_player)
    {
        scr_characterspr()
        state = states.titlescreen
    }
    with (obj_tv)
        tvsprite = spr_tvoff
    with (obj_player)
        targetDoor = "A"
    with (instance_create(x, y, obj_fadeout))
    {
        fadealpha = 1
        fadein = true
    }
    global.levelname = -4
}
else
    scr_sound(sound_enemythrow)
