function scr_player_machroll() //scr_player_machroll
{
    if (!(place_meeting(x, (y + 1), obj_railh)))
        hsp = xscale * movespeed
    else if place_meeting(x, (y + 1), obj_railh)
        hsp = xscale * movespeed - 5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = xscale * movespeed + 5
    mach2 = 100
    machslideAnim = true
    move = key_right + key_left
    if (movespeed < 8)
        movespeed = 8
    if (input_buffer_crouch > 0)
        input_buffer_crouch--
    if ((!key_down) && (!(scr_solid((x + 27), (y - 32)))) && (!(scr_solid((x - 27), (y - 32)))) && (!(scr_solid(x, (y - 32)))) && (!(scr_solid(x, (y - 16)))) && grounded && input_buffer_crouch == 0)
    {
        scr_sound(sound_rollgetup)
        if (character == "N")
            sprite_index = spr_pizzano_rollgetup
        else
            sprite_index = spr_playerPZ_rollgetup
        image_index = 0
        mach2 = 35
        if (movespeed >= 12)
            state = states.mach3
        else
            state = states.mach2
    }
    if (scr_solid((x + 1), y) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_slopeplatform))) && (!(place_meeting((x + sign(hsp)), y, obj_slopeplatform))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        hsp = 0
        image_speed = 0.35
        combo = 0
        state = states.bump
        hsp = 0
        vsp = 0
        mach2 = 0
        image_index = 0
        if (character == "N")
            sprite_index = spr_pizzano_wallsplat
        else
            sprite_index = spr_playerPZ_wallsplat
        instance_create((x + 10), (y + 10), obj_bumpeffect)
    }
    if (scr_solid((x - 1), y) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_slopeplatform))) && (!(place_meeting((x + sign(hsp)), y, obj_minecartRail_Slope))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        hsp = 0
        image_speed = 0.35
        combo = 0
        state = states.bump
        hsp = 0
        vsp = 0
        mach2 = 0
        image_index = 0
        if (character == "N")
            sprite_index = spr_pizzano_wallsplat
        else
            sprite_index = spr_playerPZ_wallsplat
        instance_create((x - 10), (y + 10), obj_bumpeffect)
    }
    if ((!instance_exists(obj_cloudeffect)) && grounded)
        instance_create(x, (y + 43), obj_cloudeffect)
    if (sprite_index == spr_playerPZ_backslideland || sprite_index == spr_playerPZ_backslide || sprite_index == spr_pizzano_crouchslide)
        image_speed = 0.35
    else
        image_speed = 0.8
    if (character == "P")
    {
        if (grounded && movespeed < 12)
            sprite_index = spr_machroll
        else if (grounded && movespeed >= 12 && sprite_index != spr_playerPZ_backslide && sprite_index != spr_playerPZ_backslideland && sprite_index != spr_playerPZ_rollgetup)
            sprite_index = spr_playerPZ_backslideland
    }
    else if (grounded && sprite_index != spr_pizzano_rollgetup)
        sprite_index = spr_machroll
    if (sprite_index == spr_playerPZ_backslideland && floor(image_index) == (image_number - 1))
        sprite_index = spr_playerPZ_backslide
    if (sprite_index == spr_playerPZ_rollgetup && floor(image_index) == (image_number - 1))
        sprite_index = spr_playerPZ_backslideland
    if (sprite_index == spr_pizzano_rollgetup && floor(image_index) == (image_number - 1))
        sprite_index = spr_machroll
    else if (sprite_index != spr_dive && sprite_index != spr_playerPZ_poundcancel1 && sprite_index != spr_playerPZ_poundcancel2 && (!grounded))
    {
        sprite_index = spr_dive
        vsp = 10
    }
    if (input_buffer_jump < 8 && sprite_index == spr_dive && (!grounded))
    {
        if (character == "N")
            sprite_index = spr_pizzano_poundcancelprep
        else
            sprite_index = spr_player_bodyslamstart
        vsp = -7
        state = states.freefallprep
        input_buffer_jump = 8
    }
    if (scr_solid((x + xscale), y) && (sprite_index == spr_dive || sprite_index == spr_pizzano_twirl) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        if (character == "N")
            sprite_index = spr_pizzano_wallsplat
        else
            sprite_index = spr_playerPZ_wallsplat
        state = states.bump
    }
    if (sprite_index == spr_dive && vsp < 10)
        vsp = 10
    if ((!instance_exists(obj_chargeeffectslide)) && (sprite_index == spr_playerPZ_backslide || sprite_index == spr_playerPZ_backslideland))
        instance_create((x + 32 * xscale), y, obj_chargeeffectslide)
}

