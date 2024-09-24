scr_tvsprites()
if showtext
{
    xi = 480 + (random_range(1, -1))
    if (textalpha < 1)
        textalpha += 0.05
}
if (!showtext)
{
    xi = 480 + (random_range(1, -1))
    if (textalpha > 0)
        textalpha -= 0.1
}
if (!((obj_player.state == states.knightpep && obj_player.state == states.knightpepattack && obj_player.state == states.knightpepslopes)))
    once = false
if (obj_player.y < (180 + obj_camera.Cam_y) && obj_player.x > (camera_get_view_width(view_camera[0]) - 350 + obj_camera.Cam_x))
{
    juice_drawY = lerp(juice_drawY, -300, 0.19)
    DrawY = lerp(DrawY, -300, 0.15)
    alpha = 0.5
}
else
{
    juice_drawY = lerp(juice_drawY, 0, 0.19)
    DrawY = lerp(DrawY, 0, 0.15)
    alpha = 1
}
if (global.hurtcounter >= global.hurtmilestone)
{
    showtext = 1
    alarm[0] = 150
    if (obj_player.character == "P")
        character = "Pizzelle"
    else
        character = "Pizzano"
    message = "You have hurt " + string(character) + " " + string(global.hurtmilestone) + " times..."
    global.hurtmilestone += 5
    scr_queue_tvanim(hurttvspr2, 200)
}
if (obj_player.state == states.keyget)
{
    showtext = true
    message = "Key obtained!"
    alarm[0] = 50
}
if staticdraw
    statictimer--
if (statictimer < 0)
    staticdraw = false
var allstate = obj_player.state
switch state
{
    case states.normal:
        if (!instance_exists(obj_secretfound))
        {
            idlespr = idletvspr
            if (obj_player.angry || global.combo >= 50)
                idlespr = angrytvspr
            if global.panic
                idlespr = panictvspr
            if (global.combo >= 3 && (!global.panic) && global.combo < 50)
                idlespr = combotvsprtest
        }
        else
            idlespr = secrettvspr
        var _transfo = true
        switch allstate
        {
            case states.mach1:
            case states.mach2:
            case states.handstandjump:
            case states.machslide:
            case states.climbwall:
            case states.machroll:
            case states.crouchslide:
            case states.mach3:
            case states.knightpepslopes:
            case states.Sjumpland:
                _transfo = false
                var my_mvsp = abs(obj_player.hsp)
                if (allstate == states.climbwall)
                    my_mvsp = abs(obj_player.vsp)
                idlespr = mach2tvspr
                if (my_mvsp >= 8 || allstate == states.handstandjump)
                    idlespr = mach2tvspr
                if (my_mvsp >= 12 || allstate == states.mach3)
                    idlespr = mach3tvspr
                if (my_mvsp >= 16 || obj_player.sprite_index == spr_playerPZ_crazyrun)
                    idlespr = mach4tvspr
                if (allstate == states.machroll)
                    idlespr = machrolltvspr
                if (allstate == states.Sjumpland)
                    idlespr = crashtvspr
                break
            case states.hurt:
                tvsprite = hurttvspr
                break
            case states.minecart:
                tvsprite = minecarttvspr
                break
            case states.fireass:
                tvsprite = firetvspr
                break
            case states.bombpep:
                tvsprite = bombtvspr
                break
            case states.cotton:
            case states.cottondrill:
            case states.cottonroll:
                tvsprite = cottontvspr
                break
            case states.fling:
                tvsprite = orbtvspr
                break
            case states.puddle:
                tvsprite = puddletvspr
                break
            default:
                _transfo = false
                break
        }

        if (!_transfo)
        {
            if (allstate == states.hurt)
                scr_queue_tvanim(hurttvspr, 60)
        }
        switch tvsprite
        {
            case spr_pizzytv_off:
                if visible
                {
                    tvsprite = spr_pizzytv_turnon
                    image_index = 0
                }
                break
            case spr_pizzytv_turnon:
                if (floor(image_index) == (image_number - 1))
                    tvsprite = idletvspr
                break
            case idletvspr:
                idleanim--
                if (idleanim <= 0 && floor(image_index) == (image_number - 1))
                {
                    tvsprite = choose(tvchange1, tvchange2)
                    image_index = 0
                }
                break
            case tvchange1:
            case tvchange2:
                if (floor(image_index) == (image_number - 1))
                {
                    tvsprite = idlespr
                    idleanim = choose(500, 450, 400, 550)
                }
                break
        }

        if (saved_tv_spr != idlespr && (!draw_static))
        {
            saved_tv_spr = idlespr
            draw_static = true
            state = states.barrelfloat
            static_index = 0
        }
        break
    case states.barrelfloat:
        draw_static = true
        saved_tv_spr = idlespr
        if (floor(static_index) >= 4)
        {
            if (expressionsprite != -4)
            {
                state = states.barrelfall
                tvsprite = expressionsprite
            }
            else
            {
                state = states.normal
                tvsprite = saved_tv_spr
            }
            image_index = 0
            draw_static = 0
        }
        break
    case states.barrelfall:
        switch expressionsprite
        {
            case hurttvspr:
                if (allstate != states.hurt)
                    expressiontime--
                break
            default:
                expressiontime--
                break
        }

        if (expressiontime <= 0)
        {
            state = states.barrelfloat
            expressionsprite = -4
            draw_static = true
            static_index = 0
        }
        break
}

if (obj_player.character == "N")
    invsprite = spr_donuthudN
else
    invsprite = spr_donuthud
if (obj_player.character == "P")
{
    if (global.treat || obj_player.sprite_index == spr_player_donutget)
    {
        invindex = 0
        donutplus = lerp(donutplus, -20, 0.2)
    }
    else
    {
        if (invindex == 0)
            donut_shake = 6
        invindex += 0.35
        if (floor(invindex) == sprite_get_number(invsprite))
            invindex = sprite_get_number(invsprite)
    }
    if (floor(invindex) >= sprite_get_number(invsprite) || invindex >= 6)
    {
        donutplus = lerp(donutplus, -500, 0.2)
        invindex = 6
    }
}
if ((global.treat && obj_player.character == "N") || obj_player.sprite_index == spr_pizzano_eatdonut)
{
    if ((obj_player.sprite_index == spr_pizzano_eatdonut && floor(obj_player.image_index) >= 17) || (obj_player.sprite_index != spr_pizzano_eatdonut && obj_player.character == "N"))
    {
        if (floor(obj_player.image_index) == 17 && donut_shake == 0 && obj_player.sprite_index == spr_pizzano_eatdonut)
        {
            donut_shake = 5
            scr_sound(choose(sound_destroyblock1, sound_destroyblock2))
        }
        invindex = 1
    }
    else if ((invindex == 1 && obj_player.sprite_index != spr_pizzano_eatdonut) || (obj_player.sprite_index == spr_pizzano_eatdonut && obj_player.image_index < 17))
        invindex = 0
    donutplus = lerp(donutplus, 0, 0.15)
}
else
    donutplus = lerp(donutplus, -99, 0.2)
if (tvsprite == spr_tvoff && floor(image_index) == (image_number - 1))
    sprite_index = spr_tvturnon
if (tvsprite == spr_pizzytv_turnon && floor(image_index) == (image_number - 1))
    tvsprite = idletvspr
if (tvsprite == spr_tvturnon && floor(image_index) == (image_number - 1))
    tvsprite = idletvspr
sprite_index = tvsprite
var time = floor(target_fill / 60)
var secs = max((time % 60), 0)
if global.panic
{
    if (((global.minutes * 60 + global.seconds) * 60) > 0)
    {
        var _spd = (1 - target_fill / global.maxwave) * (sprite_get_number(spr_coneball_bartimer_roll) * 10)
        roll_index = _spd % sprite_get_number(spr_coneball_bartimer_roll)
        coneball_index += 0.35
        tongue_index += 0.35
        if (coneball_index >= sprite_get_number(coneball_sprite))
            coneball_index = frac(coneball_index)
        if (tongue_index >= sprite_get_number(spr_coneball_bartimertonguesup))
            tongue_index = 0
        timer_y = approach(timer_y, -136, 1)
    }
    else
    {
        if (coneball_sprite == spr_coneball_bartimer)
        {
            coneball_sprite = spr_coneball_bartimesup
            coneball_index = 0
            timer_buffer = 200
        }
        if (coneball_index < (sprite_get_number(coneball_sprite) - 1))
            coneball_index += 0.35
        if (timer_buffer > 0)
            timer_buffer--
        if (timer_buffer == 0)
            timer_y = approach(timer_y, 300, 0.8)
    }
}
else
{
    timer_y = 0
    coneball_sprite = spr_coneball_bartimer
}
