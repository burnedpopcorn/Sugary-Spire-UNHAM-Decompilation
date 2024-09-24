function scr_player_machslide() //scr_player_machslide
{
    if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
        hsp = xscale * movespeed
    else if place_meeting(x, (y + 1), obj_railh)
        hsp = xscale * movespeed - 5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = xscale * movespeed + 5
    move = key_right + key_left
    if (movespeed >= 0 && sprite_index != spr_player_hurtroll)
        movespeed -= 0.4
    if (sprite_index == spr_player_hurtroll && grounded)
        sprite_index = spr_player_crouchslide
    if (sprite_index == spr_player_crouchslide && movespeed <= 0)
        state = states.normal
    if (sprite_index == spr_machslidestart && floor(image_index) == (image_number - 1) && character == "P")
        sprite_index = spr_playerPZ_machslide
    if (sprite_index == spr_machslidestart && floor(image_index) == (image_number - 1) && character == "N")
        sprite_index = spr_pizzano_machslide
    if ((sprite_index == spr_playerPZ_machslide || sprite_index == spr_pizzano_machslide) && floor(image_index) == (image_number - 1))
        sprite_index = spr_machslideend
    if (sprite_index == spr_pizzano_outofcontrolfall && grounded && character == "N")
        sprite_index = spr_pizzano_sleepend
    if ((sprite_index == spr_machslideend || sprite_index == spr_pizzano_sleepend) && floor(image_index) == (image_number - 1))
    {
        state = states.normal
        sprite_index = spr_idle
    }
    image_speed = 0.35
    landAnim = false
    if (scr_solid((x + xscale), y) && (sprite_index == spr_machslidestart || sprite_index == spr_machslideend) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_slopeplatform))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        if (character == "N")
            sprite_index = spr_pizzano_wallsplat
        else
            sprite_index = spr_playerPZ_wallsplat
        state = states.bump
    }
    if (floor(movespeed) == 0 && (sprite_index == spr_machslide || sprite_index == spr_player_crouchslide || sprite_index == spr_pizzano_sleepend))
    {
        image_index = 0
        if (sprite_index == spr_machslide)
            machslideAnim = true
        movespeed = 0
        state = states.normal
        movespeed = 4
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_machslideboost && mach2 != 0)
    {
        if (!grounded)
        {
            if (character == "N")
                sprite_index = spr_pizzano_machboostfall
            else
                sprite_index = spr_playerPZ_mach2fall
        }
        else
        {
            movespeed = 10
            momemtum = true
            state = states.mach2
            image_index = 0
            xscale *= -1
            instance_create(x, y, obj_jumpdust)
            hsp = movespeed * xscale
        }
    }
    if (grounded && (sprite_index == spr_playerPZ_mach2fall || sprite_index == spr_pizzano_machboostfall) && mach2 != 0)
    {
        movespeed = 10
        momemtum = 1
        state = states.normal
        image_index = 0
        xscale *= -1
        instance_create(x, y, obj_jumpdust)
    }
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_playerPZ_machslideboost3 || sprite_index == spr_pizzano_mach3boost) && mach2 != 0)
    {
        if (!grounded)
        {
            if (character == "N")
                sprite_index = spr_pizzano_mach3boostfall
            else
                sprite_index = spr_playerPZ_machslideboost3fall
        }
        else
        {
            movespeed = 12
            if (character == "N")
                sprite_index = spr_pizzano_mach3grounded
            else
                sprite_index = spr_player_mach4
            scr_sound(sound_dash2)
            momemtum = true
            state = states.mach3
            image_index = 0
            xscale *= -1
            instance_create(x, y, obj_jumpdust)
            hsp = movespeed * xscale
        }
    }
    if (grounded && (sprite_index == spr_playerPZ_machslideboost3fall || sprite_index == spr_pizzano_mach3boostfall) && mach2 != 0)
    {
        movespeed = 12
        if (character == "N")
            sprite_index = spr_pizzano_mach3grounded
        else
            sprite_index = spr_player_mach4
        scr_sound(sound_dash2)
        momemtum = true
        state = states.mach3
        image_index = 0
        xscale *= -1
        instance_create(x, y, obj_jumpdust)
        hsp = movespeed * xscale
    }
    if (mach2 == 0)
    {
        if ((!instance_exists(obj_slidecloud)) && grounded)
            instance_create(x, y, obj_slidecloud)
    }
    else if (mach2 >= 35)
    {
        if ((!instance_exists(obj_dashcloud)) && grounded)
            instance_create(x, y, obj_dashcloud)
    }
    else if (mach2 >= 100)
    {
        if ((!instance_exists(obj_dashcloud2)) && grounded)
            instance_create(x, y, obj_dashcloud2)
    }
}

