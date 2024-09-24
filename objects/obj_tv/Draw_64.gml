if global.panic
    texty = approach(texty, -85, 1)
else
    texty = 0
if (room == timesuproom || room == hub_room1 || room == hub_start || room == hub_hall || room == hub_new || room == hub_bikinibottom || room == hub_bikinibottomtest || (room == spireintro && obj_spireintro.canskip))
{
    draw_set_font(global.newfont)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    draw_text_color(xi, (476 + texty), string_hash_to_newline(message), c_white, c_white, c_white, c_white, textalpha)
}
if (room != scootercutsceneidk && room != devroom && room != palroom && room != rank_room && room != timesuproom && room != realtitlescreen && room != rm_credits && room != secrets_await && room != hub_room1 && room != hub_new && room != hub_start && room != hub_hall && string_letters(room_get_name(room)) != "tutorial" && room != outer_room1 && room != outer_room2 && room != rm_initializer && room != rm_verify && global.showhud && room != hub_bikinibottom && room != hub_bikinibottomtest)
{
    pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0)
    if global.panic
        draw_sprite_ext(spr_tvbgspanic, tvbgindex, 832, (74 + DrawY), 1, 1, 0, c_white, 1)
    else
        draw_sprite_ext(spr_tvbgs, tvbgindex, 832, (74 + DrawY), 1, 1, 0, c_white, 1)
    if (obj_player.character == "N")
    {
        var spr = spr_pizzytv_empty
        if (sprite_index == spr_tvturnon || sprite_index == spr_pizzytv_turnon)
        {
            pal_swap_reset()
            spr = sprite_index
        }
        draw_sprite_ext(spr, image_index, 832, (74 + DrawY), 1, 1, 0, c_white, 1)
    }
    if (state == states.barrelfloat)
    {
        if (sprite_index == spr_pizzanotv_exprhurt)
        {
            static_index += 0.3
            draw_sprite(spr_pizzytv_whitenoise, static_index, 832, (74 + DrawY))
        }
    }
    draw_sprite_ext(tvsprite, image_index, 832, (74 + DrawY), 1, 1, 0, c_white, 1)
    if (draw_static && sprite_index != spr_pizzanotv_exprhurt)
    {
        pal_swap_reset()
        static_index += 0.3
        draw_sprite_ext(spr_pizzytv_whitenoise, static_index, 832, (74 + DrawY), 1, 1, 0, c_white, 1)
    }
    pal_swap_reset()
    var _shake = 0
    if (donut_shake > 0)
    {
        donut_shake--
        _shake = 2.5
    }
    draw_sprite_ext(invsprite, invindex, (660 + (random_range((-_shake), _shake))), (55 + DrawY + donutplus + (random_range((-_shake), _shake))), 1, 1, 0, c_white, 1)
    if global.panic
    {
        pal_swap_reset()
        draw_sprite_ext(spr_pizzytv_panicline, goo_index, 832, (74 + DrawY), 1, 1, 0, c_white, 1)
    }
    if (screensaverbuffer <= 0 && (!global.panic))
    {
        pal_swap_reset()
        draw_sprite_ext(spr_pizzytv_idlescreensaver, goo_index, 832, (74 + DrawY), 1, 1, 0, c_white, 1)
    }
    draw_set_font(global.newfont)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    clock_index += 0.35
    var _string_length = string_length(string_hash_to_newline(message))
    var w = string_width(_string_length)
    var cx = 330 - w / 2
    if (message == ("You have found " + string(global.secretfound) + " out of 3 secrets!"))
        cx = 290 - w / 2
    if (message == ("You have hurt " + string(character) + " " + string(global.hurtmilestone) + " times..."))
        cx = 295 - w / 2
    if (message == "You have found all 5 confecti!")
        cx = 320 - w / 2
    if (message == "Key obtained!")
        cx = 405 - w / 2
    if (message == "Checkpoint set!")
        cx = 395 - w / 2
    for (var i = 0; i < _string_length; i++)
    {
        var jinglex = irandom_range(1, -1)
        var jingley = irandom_range(-1, 1)
        draw_set_halign(fa_center)
        draw_text_color((cx + jinglex), (476 + jingley + texty), string_char_at(string_hash_to_newline(message), (i + 1)), c_white, c_white, c_white, c_white, textalpha)
        cx += (w / _string_length + 12)
    }
    var _perc = global.combotime / 60
    goo_index += 0.35
    if (global.combo <= 0)
    {
        juice_x = -180
        hand_x = approach(hand_x, 220, 8)
        hand_y = -240
        var _hy = 50
        combo_posX = 0
        juice_posX = 0
    }
    else if (global.combotime > 0 && global.combo > 0)
    {
        draw_set_font(global.combofont)
        draw_set_halign(fa_center)
        draw_set_color(c_white)
        combo_posX = wave(-5, 5, 2, 20)
        juice_posX = wave(-2.5, 2.5, 2, 20)
        var _combo = string(global.combo)
        _string_length = string_length(_combo)
        w = string_width(_string_length)
        var _xx = 780 - w / 2
        if (global.combo < 10)
            _xx = 805 - w / 2
        else if (global.combo >= 10 && global.combo < 100)
            _xx = 790 - w / 2
        else if (global.combo >= 100)
            _xx = 780 - w / 2
        juice_x = approach(juice_x, lerp(juice_x, lerp(-170, -30, _perc), 0.33), 4)
        hand_x = approach(hand_x, 0, 16)
        hand_y = -240
    }
    else if chooseOnecomboend
        draw_sprite_ext(comboendSprite, comboendImage, 832, 74, 1, 1, 0, c_white, (combofade * alpha))
    if (!surface_exists(goo_surface))
    {
        goo_surface = surface_create(780, 214)
        surface_set_target(goo_surface)
        draw_clear_alpha(c_black, 0)
        surface_reset_target()
    }
    else
    {
        surface_set_target(goo_surface)
        draw_clear_alpha(c_black, 0)
        draw_sprite(spr_pizzytv_combometerbg, -1, (426 + hand_x + juice_posX), (300 + hand_y + juice_drawY))
        pal_swap_set(spr_pizzytv_combometerjuicepal, (!global.combodropped), 0)
        draw_sprite(spr_pizzytv_combometerjuicenew, goo_index, (451 + juice_x + juice_posX), (300 + hand_y + juice_drawY))
        pal_swap_reset()
        gpu_set_blendmode(bm_subtract)
        draw_sprite(spr_pizzytv_combometerjuicetemplate, 0, (377 + juice_posX), (300 + hand_y + juice_drawY))
        draw_sprite(spr_pizzytv_combometerjuicetemplate2, 0, (377 + juice_posX), (300 + hand_y + juice_drawY))
        gpu_set_blendmode(bm_normal)
        surface_reset_target()
        draw_surface(goo_surface, (420 + juice_posX), (290 + hand_y + juice_drawY))
    }
    draw_sprite(spr_pizzytv_combometerjuice, goo_index, (856 + hand_x + combo_posX), (350 + hand_y + DrawY))
    if (global.combotime > 0 && global.combo > 0)
    {
        for (i = 0; i < _string_length; i++)
        {
            var _yy = i * -4
            if (ComboShake == true)
            {
                _xx += irandom_range(-2, 2)
                _yy += irandom_range(-2, 2)
            }
            draw_text_color(floor(_xx + 10 + combo_posX), (210 + _yy), string_char_at(_combo, (i + 1)), c_white, c_white, c_white, c_white, alpha)
            draw_sprite_ext(spr_tvcombo, image_index, (850 + combo_posX), 215, 1, 1, 0, c_white, alpha)
            if (global.combo >= 10)
                _xx += (w / _string_length + 12)
        }
    }
    var timerx = 480
    var timery = 605 + timer_y
    var perc = clamp((1 - target_fill / global.maxwave), 0, 1)
    var harry_ypos = -12 * perc
    var dist = clamp((perc * 268), 0, 268)
    if global.panic
    {
        target_fill = lerp(target_fill, ((global.minutes * 60 + global.seconds) * 60), 0.03)
        if (coneball_sprite != spr_coneball_bartimesup)
        {
            draw_sprite_ext(spr_coneball_bartimer, coneball_index, (timerx + 135), (timery - 20), 1, 1, 0, c_white, 1)
            draw_sprite_ext(spr_coneball_bartimertongue, coneball_index, (timerx + 7), (timery + 3), 1, 1, 0, c_white, 1)
            draw_sprite_part(spr_coneball_bartimer_rolltrail, 0, 0, 0, (dist + 50), 113, (timerx - 182), (timery - 46))
            draw_sprite_ext(spr_coneball_bartimer_roll, roll_index, (timerx - 140 + dist), (timery + harry_ypos + 36), 1, 1, 0, c_white, 1)
            draw_sprite_ext(spr_coneball_bartimerfront, coneball_index, (timerx + 135), (timery - 20), 1, 1, 0, c_white, 1)
        }
        else if (coneball_sprite == spr_coneball_bartimesup)
            draw_sprite_ext(spr_coneball_bartimertonguesup, floor(coneball_index), timerx, timery, 1, 1, 0, c_white, 1)
        if (coneball_sprite == spr_coneball_bartimesup)
            draw_sprite_ext(coneball_sprite, floor(coneball_index), (timerx + 135), (timery - 20), 1, 1, 0, c_white, 1)
        if (global.seconds < 10)
        {
            draw_set_color(c_white)
            draw_set_font(global.panictimerfont)
            draw_text(480, (585 + timer_y), string_hash_to_newline(string(global.minutes) + ":0" + string(global.seconds)))
        }
        else if (global.seconds >= 10)
        {
            draw_set_color(c_white)
            draw_set_font(global.panictimerfont)
            draw_text(480, (585 + timer_y), string_hash_to_newline(string(global.minutes) + ":" + string(global.seconds)))
        }
        draw_sprite(spr_timer_clock, clock_index, 430, (600 + timer_y))
        draw_set_font(global.panictimerfont)
        draw_set_halign(fa_center)
        draw_set_color(c_white)
    }
}
