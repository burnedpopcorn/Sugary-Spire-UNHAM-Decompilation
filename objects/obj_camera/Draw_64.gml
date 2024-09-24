var shakeX = irandom_range((-Collectshake), Collectshake)
var shakeY = irandom_range((-Collectshake), Collectshake)
var spr_w = sprite_get_width(spr_ranks_hudfill_pz)
var spr_h = sprite_get_height(spr_ranks_hudfill_pz)
var spr_xo = sprite_get_xoffset(spr_ranks_hudfill_pz)
var spr_yo = sprite_get_yoffset(spr_ranks_hudfill_pz)
var perc = 0
var rank_ix = 0
var _score = global.collect
bobbing = wave(2, -2, 3, 0)
if (room != scootercutsceneidk && room != rm_credits && room != devroom && room != palroom && room != rank_room && room != realtitlescreen && room != secrets_await && room != hub_room1 && string_letters(room_get_name(room)) != "tutorial" && room != outer_room1 && room != outer_room2 && room != hub_new && room != hub_start && room != hub_hall && room != rm_initializer && global.showhud && room != hub_bikinibottom && room != hub_bikinibottomtest)
{
    if global.heatmeter
    {
        pal_swap_set(spr_heatpal, heatpal, 0)
        draw_sprite_part_ext(spr_heatmeterunder, obj_stylebar.image_index, 0, 0, (global.style * 4.25), sprite_get_height(spr_heatmeterunder), (-6 + shakeX), (8 + DrawY + shakeY), 1, 1, c_white, 1)
        draw_sprite_ext(spr_heatmeter, obj_stylebar.image_index, (128 + shakeX), (96 + shakeY + DrawY), 1, 1, 0, c_white, 1)
    }
    draw_sprite_ext(spr_cakehud, obj_stylebar.image_index, (128 + shakeX), (96 + shakeY + DrawY), 1, 1, 0, c_white, 1)
    if (global.collect > global.crank)
        draw_sprite_ext(spr_cranktopping, obj_stylebar.image_index, (128 + shakeX), (96 + shakeY + DrawY), 1, 1, 0, c_white, 1)
    if (global.collect > global.brank)
        draw_sprite_ext(spr_branktopping, obj_stylebar.image_index, (128 + shakeX), (96 + shakeY + DrawY), 1, 1, 0, c_white, 1)
    if (global.collect > global.arank)
        draw_sprite_ext(spr_aranktopping, obj_stylebar.image_index, (128 + shakeX), (96 + shakeY + DrawY), 1, 1, 0, c_white, 1)
    if (global.collect > global.srank)
        draw_sprite_ext(spr_sranktopping, obj_stylebar.image_index, (128 + shakeX), (96 + shakeY + DrawY), 1, 1, 0, c_white, 1)
    shader_reset()
    draw_set_font(global.collectfont)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    var cs = 0
    with (obj_comboend)
        cs += comboscore
    var sc = _score - global.comboscore - cs
    if (sc < 0)
        sc = 0
    var _string = string(sc)
    var _string_length = string_length(_string)
    if (lastcollect != sc)
    {
        for (var i = 0; i < _string_length; i++)
            color_array[i] = irandom_range(1, pal_width)
        lastcollect = sc
    }
    var w = string_width(_string_length)
    var _xx = 140 - w / 2
    if (sc < 10)
        _xx = 170 - w / 2
    else if (sc >= 10 && sc < 100)
        _xx = 150 - w / 2
    else if (sc >= 100 && sc < 1000)
        _xx = 135 - w / 2
    else if (sc >= 1000 && sc < 10000)
        _xx = 122 - w / 2
    else if (sc >= 10000 && sc < 100000)
        _xx = 105 - w / 2
    else if (sc >= 100000 && sc < 1000000)
        _xx = 87 - w / 2
    else if (sc >= 1000000)
        _xx = 60 - w / 2
    for (i = 0; i < _string_length; i++)
    {
        var _yyoffset = ((i % 2) == 0 ? -4 : 0)
        pal = color_array[i]
        pal_swap_set(spr_palcandle, pal, 0)
        if (prevcollect != sc)
        {
            plusY = (sc > prevcollect ? -5 : 5)
            prevcollect = sc
        }
        plusY = approach(plusY, 0, 0.6)
        draw_text((_xx + shakeX), (29 + obj_stylebar.hudbounce + _yyoffset + DrawY + shakeY + plusY), string_char_at(_string, (i + 1)))
        if (sc >= 10 && sc < 100)
            _xx += (w / _string_length * 2)
        else if (sc < 1000 && sc >= 100)
            _xx += (w / _string_length * 3)
        else if (sc < 10000 && sc >= 1000)
            _xx += (w / _string_length * 3.2)
        else if (sc < 100000 && sc >= 10000)
            _xx += (w / _string_length * 4.6)
        else if (sc < 1000000 && sc >= 100000)
            _xx += (w / _string_length * 6)
        else if (sc >= 1000000)
            _xx += (w / _string_length * 7.4)
    }
    if (_score >= global.srank)
    {
        if (global.combodropped == 0 && global.secretfound > 2 && global.lapcount > 0 && global.treasure > 0)
            rank_ix = 5
        else
            rank_ix = 4
    }
    else if (_score >= global.arank)
        rank_ix = 3
    else if (_score >= global.brank)
        rank_ix = 2
    else if (_score >= global.crank)
        rank_ix = 1
    if (previousrank != rank_ix)
    {
        previousrank = rank_ix
        rank_scale = 3
    }
    rank_scale = approach(rank_scale, 1, 0.2)
    if (room != hub_room1 && room != rm_credits && room != outer_room1 && room != outer_room2 && room != tutorial_1 && room != tutorial_2 && room != tutorial_3 && room != tutorial_4 && room != tutorial_5 && room != tutorial_6 && room != tutorial_7 && room != tutorial_8 && room != tutorial_9 && room != tutorial_10 && room != secrets_await && room != hub_new && room != hub_start && room != hub_hall && room != hub_bikinibottom && room != hub_bikinibottomtest)
        draw_sprite_ext(spr_ranks_hud_pz, rank_ix, (263 + shakeX), (60 + shakeY + DrawY), rank_scale, rank_scale, 0, c_white, 1)
    switch rank_ix
    {
        case 4:
            perc = 1
            break
        case 3:
            perc = (_score - global.arank) / (global.srank - global.arank)
            break
        case 2:
            perc = (_score - global.brank) / (global.arank - global.brank)
            break
        case 1:
            perc = (_score - global.crank) / (global.brank - global.crank)
            break
        default:
            perc = _score / global.crank
    }

    var t = spr_h * perc
    var top = spr_h - t
    if (room != hub_room1 && room != rm_credits && room != outer_room1 && room != outer_room2 && room != tutorial_1 && room != tutorial_2 && room != tutorial_3 && room != tutorial_4 && room != tutorial_5 && room != tutorial_6 && room != tutorial_7 && room != tutorial_8 && room != tutorial_9 && room != tutorial_10 && room != secrets_await && room != hub_new && room != hub_start && room != hub_hall && room != hub_bikinibottom && room != hub_bikinibottomtest)
        draw_sprite_part(spr_ranks_hudfill_pz, rank_ix, 0, top, spr_w, (spr_h - top), (263 + shakeX - spr_xo), (60 + shakeY + DrawY - spr_yo + top))
}
draw_set_font(global.font)
draw_set_halign(fa_center)
draw_set_color(c_white)
if global.debugmode
{
    draw_set_font(global.font)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    draw_text(260, 450, angle)
    draw_text(325, 450, angledir)
    draw_text(100, 400, obj_player.x)
    draw_text(100, 450, obj_player.y)
    var roomname = string_upper(room_get_name(global.GMLIVE_realroom))
    draw_text(150, 0, roomname)
}
if global.debugmode
{
    draw_set_font(font_dev)
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    draw_text(0, 50, obj_player.state)
    roomname = string_upper(room_get_name(room))
    draw_text(0, 100, roomname)
    var spritename = string_upper(sprite_get_name(obj_player.sprite_index))
    draw_text(0, 150, spritename)
}
if (global.lapcount > 0 && global.panic && global.lappingsys == 0 && global.showhud)
{
    var _laps = string(global.lapcount + 1)
    draw_set_font(global.lapfont)
    draw_set_color(c_white)
    draw_sprite(spr_lapcounter, image_index, 64, (640 + bobbing + lapcounter_y))
    draw_text(63, (640 + bobbing + lapcounter_y), _laps)
}
if (room != realtitlescreen && room != hub_room1 && room != scootercutsceneidk && room != outer_room1 && room != outer_room2 && room != tutorial_1 && room != tutorial_2 && room != palroom && room != tutorial_3 && room != tutorial_4 && room != tutorial_5 && room != tutorial_6 && room != tutorial_7 && room != tutorial_8 && room != tutorial_9 && room != tutorial_10 && room != rm_credits && room != secrets_await && room != devroom && room != hub_new && room != hub_start && room != hub_hall && global.timer && global.timertype != 1 && global.showhud && room != hub_bikinibottom && room != hub_bikinibottomtest)
{
    var tiny = ":"
    var tinier = ":"
    var tinyish = ":"
    if (global.playtimerseconds < 10)
        tiny = ":0"
    if (global.playtimermiliseconds < 10)
        tinier = ":0"
    if (global.playtimerminutes < 10)
        tinyish = ":0"
    draw_set_color(c_white)
    draw_set_halign(fa_left)
    draw_set_font(global.timerfont)
    draw_text(826, 512, string_hash_to_newline(string(global.playtimerhour) + string(tinyish) + string(global.playtimerminutes) + string(tiny) + string(global.playtimerseconds) + string(tinier) + string(global.playtimermiliseconds)))
}
if (global.timer && global.timertype > 0 && global.showhud && room != realtitlescreen && room != rank_room)
{
    var tiny2 = ":"
    var tinier2 = ":"
    var tinyish2 = ":"
    if (global.savetimerseconds < 10)
        tiny2 = ":0"
    if (global.savetimermiliseconds < 10)
        tinier2 = ":0"
    if (global.savetimerminutes < 10)
        tinyish2 = ":0"
    draw_set_color(c_white)
    draw_set_halign(fa_left)
    draw_set_font(global.timerfont)
    var plustimery = 0
    if (global.timertype == 2 && room != hub_room1 && room != scootercutsceneidk && room != outer_room1 && room != outer_room2 && room != tutorial_1 && room != tutorial_2 && room != palroom && room != tutorial_3 && room != tutorial_4 && room != tutorial_5 && room != tutorial_6 && room != tutorial_7 && room != tutorial_8 && room != tutorial_9 && room != tutorial_10 && room != rm_credits && room != secrets_await && room != devroom && room != hub_new && room != hub_start && room != hub_hall && room != hub_bikinibottom && room != hub_bikinibottomtest)
        plustimery = 17
    draw_text(826, (512 - plustimery), string_hash_to_newline(string(global.savetimerhour) + string(tinyish2) + string(global.savetimerminutes) + string(tiny2) + string(global.savetimerseconds) + string(tinier2) + string(global.savetimermiliseconds)))
}
