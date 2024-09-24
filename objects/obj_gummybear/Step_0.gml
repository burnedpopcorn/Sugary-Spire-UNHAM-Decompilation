var tauntspr = sprite_get_name(startspr) + "taunt"
switch sprite_get_name(startspr)
{
    case "spr_gummybearM":
    case "spr_gummybearW":
    case "spr_gummybearMcoffee":
        switch state
        {
            case states.normal:
                if (!global.panic)
                {
                    if (randombuffer > 0)
                        randombuffer--
                    else
                    {
                        randombuffer = 80 + irandom(50)
                        var _move = irandom(100)
                        image_xscale = choose(-1, 1)
                        if (_move > 50)
                        {
                            if (sprite_get_name(startspr) == "spr_gummybearMcoffee")
                                movespeed = 2
                            else
                                movespeed = 1
                        }
                        else
                            movespeed = 0
                    }
                    hsp = movespeed * image_xscale
                    if ((place_meeting((x + sign(hsp)), y, obj_solid) || place_meeting((x + sign(hsp)), y, obj_hallway) || (!(place_meeting((x + sign(hsp)), (y + 2), obj_solid)))) && (!(place_meeting((x + sign(hsp)), (y + 2), obj_platform))) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting(x, (y + 3), obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_slopeplatform))) && (!(place_meeting(x, (y + 3), obj_slopeplatform))))
                        image_xscale *= -1
                    if (movespeed == 0)
                        image_index = 0
                }
                else
                {
                    hsp = image_xscale * 8
                    if (randombuffer > 0)
                        randombuffer--
                    else if (randombuffer <= 0 && (!(place_meeting((x + sign(hsp)), (y + 2), obj_solid))))
                    {
                        randombuffer = 80 + (irandom_range(-40, 80))
                        image_xscale = choose(-1, 1)
                    }
                    if ((place_meeting((x + sign(hsp)), y, obj_solid) || place_meeting((x + sign(hsp)), y, obj_hallway)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
                        image_xscale *= -1
                }
                if (obj_player.state == states.backbreaker && point_in_camera(x, y, view_camera[0]) && obj_player.sprite_index == obj_player.spr_player_taunt)
                {
                    goalsprite = sprite_index
                    if sprite_exists(asset_get_index(tauntspr))
                    {
                        var text = string_concat(id, " Sprite Changed to: ", tauntspr)
                        trace(text)
                        sprite_index = asset_get_index(tauntspr)
                        image_index = 0
                    }
                    state = states.titlescreen
                    goalhsp = hsp
                    goalvsp = vsp
                    hsp = 0
                    vsp = 0
                    if chance(0.001)
                        scr_sound(sound_beargoooooooal)
                }
                break
            case states.titlescreen:
                if sprite_exists(asset_get_index(tauntspr))
                {
                    sprite_index = asset_get_index(tauntspr)
                    image_index = 0
                }
                if (obj_player.state != states.backbreaker)
                {
                    state = states.normal
                    hsp = goalhsp
                    vsp = goalvsp
                    sprite_index = goalsprite
                    text = string_concat(id, " Sprite Changed to: ", sprite_get_name(startspr))
                    trace(text)
                }
                break
        }

        break
    case "spr_gummybear_paper":
        if global.panic
            tauntspr = sprite_get_name(startspr) + "tauntpanic"
        if (sprite_index != spr_gummybear_papertauntpanic)
        {
            if (x != obj_player.x)
                image_xscale = (-(sign(x - obj_player.x)))
        }
        switch state
        {
            case states.normal:
                if (obj_player.state == states.backbreaker && point_in_camera(x, y, view_camera[0]) && obj_player.sprite_index == obj_player.spr_player_taunt && sprite_index != spr_gummybear_papertauntpanic)
                {
                    goalsprite = sprite_index
                    if global.panic
                    {
                        instance_create(0, 0, obj_flash)
                        scr_sound(sfx_becomeknight)
                        ds_list_add(global.saveroom, id)
                    }
                    if sprite_exists(asset_get_index(tauntspr))
                    {
                        text = string_concat(id, " Sprite Changed to: ", tauntspr)
                        trace(text)
                        sprite_index = asset_get_index(tauntspr)
                        image_index = 0
                    }
                    state = states.titlescreen
                    goalhsp = hsp
                    goalvsp = vsp
                    hsp = 0
                    vsp = 0
                    if chance(0.001)
                        scr_sound(sound_beargoooooooal)
                }
                break
            case states.titlescreen:
                if sprite_exists(asset_get_index(tauntspr))
                {
                    sprite_index = asset_get_index(tauntspr)
                    image_index = 0
                }
                if (obj_player.state != states.backbreaker && (!global.panic))
                {
                    state = states.normal
                    hsp = goalhsp
                    vsp = goalvsp
                    sprite_index = goalsprite
                    text = string_concat(id, " Sprite Changed to: ", sprite_get_name(startspr))
                    trace(text)
                }
                break
        }

        break
    case "spr_gummybear_drill":
        image_speed = 0.35
        break
}

scr_collide()
