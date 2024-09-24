function scr_rocketfist_pizzano() //scr_rocketfist_pizzano
{
    if (sprite_index == spr_pizzano_sjumpprepside)
    {
        vsp = 0
        hsp = 0
        move = 0
        if (sprite_index == spr_pizzano_sjumpprepside && floor(image_index) == (image_number - 1))
        {
            image_index = 0
            if grounded
                sprite_index = spr_pizzano_mach3
            else
                sprite_index = spr_pizzano_sjumpside
            movespeed = 12
            flash = true
        }
    }
    if (sprite_index != spr_pizzano_sjumpprepside)
    {
        if (((!key_up) && (!key_down)) || (key_up && key_down))
            vsp = approach(vsp, 0, 1)
        move = key_left + key_right
        hsp = xscale * movespeed
        if (move != 0 && move == (-xscale) && movespeed > 8)
            movespeed -= 0.05
        if (move != 0 && move == xscale && movespeed < 20)
            movespeed += 0.1
        if (sprite_index != spr_pizzano_mach3slideboostfist)
        {
            if (input_buffer_jump < 8)
            {
                state = states.pizzanotwirl
                vsp = -12
                input_buffer_jump = 8
            }
            if key_up
                vsp = -5
            if key_down
                vsp = 5
        }
        if (scr_solid((x + xscale), y, true) && (!(place_meeting((x + xscale), y, obj_destructibles))) && sprite_index != spr_pizzano_mach3slideboostfist)
        {
            scr_sound(sound_maximumspeedland)
            with (obj_camera)
            {
                shake_mag = 20
                shake_mag_acc = 40 / room_speed
            }
            image_speed = 0.35
            with (obj_baddie)
            {
                if (point_in_camera(x, y, view_camera[0]) && grounded)
                {
                    stun = true
                    alarm[0] = 200
                    ministun = false
                    vsp = -5
                    hsp = 0
                }
            }
            vsp = -6
            hsp = -6 * xscale
            image_index = 0
            sprite_index = spr_pizzano_mach3hitwallair
            state = states.bump
        }
        if ((!grounded) && hsp != 0 && sprite_index != spr_pizzano_sjumpside && sprite_index != spr_pizzano_mach3hitwallair && sprite_index != spr_pizzano_mach3slideboostfist)
            sprite_index = spr_pizzano_sjumpside
        if (move != 0 && xscale != move && grounded && (!key_down) && Dashpad_buffer <= 0 && sprite_index != spr_pizzano_mach3slideboostfist)
        {
            scr_sound(sound_maximumspeedstop)
            flash = 0
            sprite_index = spr_pizzano_mach3slideboostfist
            image_index = 0
        }
        if (sprite_index == spr_pizzano_mach3slideboostfist)
        {
            if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
                hsp = xscale * movespeed
            else if place_meeting(x, (y + 1), obj_railh)
                hsp = xscale * movespeed - 5
            else if place_meeting(x, (y + 1), obj_railh2)
                hsp = xscale * movespeed + 5
            if (movespeed >= 0 && sprite_index != spr_player_hurtroll)
                movespeed -= 0.4
        }
        if (sprite_index == spr_pizzano_mach3slideboostfist && animation_end())
        {
            movespeed = 12
            sprite_index = spr_pizzano_mach3
            scr_sound(sound_dash2)
            momemtum = true
            image_index = 0
            xscale *= -1
            instance_create(x, y, obj_jumpdust)
        }
        if (input_buffer_slap < 8 && key_up && charged)
        {
            flash = true
            alarm[0] = 240
            image_index = 0
            state = states.Sjump
            sprite_index = spr_pizzano_sjumpprep
            input_buffer_slap = 8
        }
        if (key_down && grounded && sprite_index != spr_pizzano_prepmach3slide && sprite_index != spr_pizzano_mach3slide && sprite_index != spr_pizzano_mach3slideboostfist)
            sprite_index = spr_pizzano_prepmach3slide
        if (sprite_index == spr_pizzano_prepmach3slide && animation_end())
            sprite_index = spr_pizzano_mach3slide
        else if ((!key_down) && grounded && hsp != 0 && (!(scr_solid(x, (y - 1)))) && (sprite_index == spr_pizzano_mach3slide || sprite_index == spr_pizzano_prepmach3slide))
            sprite_index = spr_pizzano_mach3getup
        else if ((!key_down) && grounded && hsp != 0 && (!(scr_solid(x, (y - 1)))) && sprite_index != spr_pizzano_mach3slide && sprite_index != spr_pizzano_prepmach3slide && sprite_index != spr_pizzano_mach3slideboostfist)
            sprite_index = spr_pizzano_mach3
        if (sprite_index == spr_pizzano_mach3getup && animation_end())
            sprite_index = spr_pizzano_mach3
    }
    image_speed = 0.35
}

