var roomname = room_get_name(room)
if (room == rank_room || room == timesuproom || room == rm_initializer || room == rm_verify)
    visible = false
else
    visible = true
if global.panic
    timestop = false
if (!global.panic)
    timestop = true
if (global.seconds == 0 && global.minutes == 0)
    alarm[1] = -1
if (global.seconds < 0)
{
    global.seconds = 59
    global.minutes -= 1
}
if (global.seconds > 59)
{
    global.minutes += 1
    global.seconds -= 59
}
if (global.playseconds > 59)
{
    global.playminutes += 1
    global.playseconds -= 59
}
if (room != realtitlescreen && room != hub_room1 && room != scootercutsceneidk && room != outer_room1 && room != outer_room2 && room != tutorial_1 && room != tutorial_2 && room != palroom && room != tutorial_3 && room != tutorial_4 && room != tutorial_5 && room != tutorial_6 && room != tutorial_7 && room != tutorial_8 && room != tutorial_9 && room != tutorial_10 && room != secrets_await && room != devroom && room != hub_new && room != hub_start && room != hub_hall && room != rank_room && room != rm_initializer && room != rm_verify && room != hub_bikinibottom && room != hub_bikinibottomtest)
{
    if (obj_player.hitLag <= 0)
    {
        global.playtimermiliseconds += 1
        if (global.playtimermiliseconds >= 60)
        {
            global.playtimermiliseconds = 0
            global.playtimerseconds += 1
            if (global.playtimerseconds >= 60)
            {
                global.playtimerseconds = 0
                global.playtimerminutes += 1
                if (global.playtimerminutes >= 60)
                {
                    global.playtimerminutes = 0
                    global.playtimerhour += 1
                }
            }
        }
    }
}
if (global.panic && room != room_treasure)
{
    panicshake = clamp(lerp(1, 2.15, (global.wave / global.maxwave)), 1, 2.15)
    panicshakeacc = 3 / room_speed
}
else
{
    panicshake = 0
    panicshakeacc = 0
}
panicshake = approach(panicshake, 0, panicshakeacc)
if (shake_mag > 0)
{
    shake_mag -= shake_mag_acc
    if (shake_mag < 0)
        shake_mag = 0
}
var lspd = 0.25
cam_angle = lerp(cam_angle, cam_langle, lspd)
cam_zoom = lerp(cam_zoom, cam_lzoom, lspd)
camera_set_view_angle(view_camera[0], cam_angle)
var vw = cam_w * cam_zoom
var vh = cam_h * cam_zoom
camera_set_view_size(view_camera[0], vw, vh)
if (instance_exists(obj_player) && obj_player.state != states.timesup && obj_player.state != states.gameover)
{
    var target = 
    {
        x: global.targetCamX,
        y: global.targetCamY
    }

    var _cam_x = target.x - vw / 2
    var _cam_y = target.y - vh / 2
    var _shake_x = 0
    var _shake_y = 0
    if (obj_player.state == states.mach3 || (obj_player.state == states.minecart && obj_player.movespeed > 10) || obj_player.state == states.machroll)
    {
        var _targetcharge = obj_player.xscale * (obj_player.movespeed / 6 * 50)
        var _tspeed = 2
        if ((_targetcharge > 0 && chargecamera < 0) || (_targetcharge < 0 && chargecamera > 0))
            _tspeed = 8
        if (chargecamera > _targetcharge)
            chargecamera -= _tspeed
        if (chargecamera < _targetcharge)
            chargecamera += _tspeed
    }
    else
    {
        if (chargecamera > 0)
            chargecamera -= 2
        if (chargecamera < 0)
            chargecamera += 2
    }
    _cam_x += chargecamera
    _cam_x = clamp(_cam_x, Camera_xorigin, (Camera_xorigin + Camera_width - vw))
    _cam_y = clamp(_cam_y, Camera_yorigin, (Camera_yorigin + Camera_height - vh))
    _cam_x = clamp(_cam_x, 0, (room_width - vw))
    _cam_y = clamp(_cam_y, 0, (room_height - vh))
    _shake_x += irandom_range((-panicshake), panicshake)
    _shake_y += irandom_range((-panicshake), panicshake)
    if (shake_mag != 0)
    {
        _shake_x += irandom_range((-shake_mag), shake_mag)
        _shake_y += irandom_range((-shake_mag), shake_mag)
    }
    lspd = 0.25
    if global.smoothcam
    {
        Cam_x = lerp(Cam_x, _cam_x, lspd)
        Cam_y = lerp(Cam_y, _cam_y, lspd)
    }
    else
    {
        Cam_x = _cam_x
        Cam_y = _cam_y
    }
    camera_set_view_pos(view_camera[0], (Cam_x + _shake_x), (Cam_y + _shake_y))
}
if (global.panic && global.minutes == 0 && global.seconds == 0 && room != timesuproom && room != room_treasure && string_letters(roomname) != "entrywaysecret" && string_letters(roomname) != "steamysecret" && string_letters(roomname) != "molassessecret" && string_letters(roomname) != "minessecret")
{
    if (!instance_exists(obj_coneball))
        instance_create(obj_player.x, obj_player.x, obj_coneball)
}
if (global.panic && global.screentilt && room != room_treasure)
{
    camera_set_view_angle(view_camera[0], (camera_get_view_angle(view_camera[0]) + (scr_sin((3 * (clamp((global.wave / global.maxwave), 0, 1))), (65 - 5 * (clamp((global.wave / global.maxwave), 0, 1)))))))
    clamp(angle, -5, 5)
    if (angle >= 5)
        angledir = -1
    else if (angle <= -5)
        angledir = 1
    if (angle < 5 && angledir == 1)
        angle += 0.025
    if (angle > -5 && angledir == -1)
        angle -= 0.025
}
else
    camera_set_view_angle(view_camera[0], cam_angle)
if (obj_player.y < (180 + obj_camera.Cam_y) && obj_player.x < (350 + obj_camera.Cam_x))
    DrawY = lerp(DrawY, -300, 0.15)
else
    DrawY = lerp(DrawY, 0, 0.15)
if (global.panicbg && global.panic && room != room_treasure)
    global.wave = clamp(clamp((global.wave + 60 / room_speed), 0, (global.maxwave - (global.minutes * 60 + global.seconds) * 60)), 0, global.maxwave)
Collectshake = approach(Collectshake, 0, (20 / room_speed))
if (global.lapcount > 0 && global.panic)
    lapcounter_y = approach(lapcounter_y, -150, 1)
else
    lapcounter_y = approach(lapcounter_y, 0, 1)
if (room != realtitlescreen && obj_player.hitLag <= 0 && room != spireintro)
{
    global.savetimermiliseconds++
    if (global.savetimermiliseconds >= 60)
    {
        global.savetimermiliseconds = 0
        global.savetimerseconds++
        if (global.savetimerseconds >= 60)
        {
            global.savetimerseconds = 0
            global.savetimerminutes++
            if (global.savetimerminutes >= 60)
            {
                global.savetimerminutes = 0
                global.savetimerhour++
            }
        }
    }
}
if (global.combo > 0)
{
    comboend = true
    var ct = global.combotime
    if (ct <= 40)
    {
        if (alarm[5] == -1)
        {
            if (ct >= 20)
                alarm[5] = 12
            else
                alarm[5] = 5
        }
    }
    else
        combobubblevisible = true
}
else if comboend
{
    comboend = false
    event_perform(ev_alarm, 4)
}
