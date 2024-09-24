function scr_player_freefall() //scr_player_freefall
{
    landAnim = true
    move = key_left + key_right
    if (!grounded)
    {
        if (vsp > 2)
            vsp += 0.5
        if (hsp != xscale && momemtum == 1 && hsp != 0)
        {
            if (move != 0)
            {
                if (move == 1)
                    hsp -= 0.05
                else if (move == -1)
                    hsp += 0.05
            }
        }
        if (hsp == 0)
            momemtum = false
        if (move != dir && move != 0)
        {
            dir = move
            hsp = 0
        }
        if ((move == 0 && momemtum == 0) || scr_solid((x + hsp), y))
        {
            hsp = 0
            mach2 = 0
        }
        if (move != 0 && hsp < 7)
        {
            if (move != 0)
            {
                if (move == 1)
                    hsp += 0.25
                else if (move == -1)
                    hsp -= 0.25
            }
        }
        if (hsp > 7)
        {
            if (move != 0)
            {
                if (move == 1)
                    hsp -= 0.05
                else if (move == -1)
                    hsp += 0.05
            }
        }
        if (scr_solid((x + move), y) && move != 0)
            hsp = 0
        if (sprite_index != spr_playerPZ_poundcancel1 && sprite_index != spr_playerPZ_poundcancel2 && sprite_index != spr_playerPZ_poundcancelprep && sprite_index != spr_pizzano_poundcancel && sprite_index != spr_pizzano_poundcancelprep && sprite_index != spr_pizzano_poundcancelland)
        {
            if (move != 0)
                xscale = move
        }
    }
    if (vsp > 0)
        smashbodyslam++
    if (vsp < 0)
    {
        smashbodyslam = -10
        if (character == "N")
            smashbodyslam = -4
    }
    var plus_y = 0
    if (sprite_index == spr_playerPZ_poundcancel1 || sprite_index == spr_playerPZ_poundcancelprep)
        plus_y = 8
    if (smashbodyslam > 10 && (!instance_exists(obj_groundpoundeffect)))
    {
        with (instance_create_depth(x, (y + plus_y), -6, obj_groundpoundeffect))
            plusy = plus_y
    }
    if (sprite_index == spr_player_bodyslamstart && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_bodyslamfall
    if (sprite_index == spr_playerPZ_poundcancelprep && floor(image_index) == (image_number - 1))
        sprite_index = spr_playerPZ_poundcancel1
    if (sprite_index == spr_pizzano_bodyslamprep && floor(image_index) == (image_number - 1))
        sprite_index = spr_pizzano_bodyslamfall
    if (sprite_index == spr_pizzano_poundcancelprep && floor(image_index) == (image_number - 1))
        sprite_index = spr_pizzano_poundcancel
    if global.cane
        sprite_index = spr_caneslam
    if (grounded && vsp > 0 && (!(place_meeting(x, (y + 1), obj_destructibles))) && (!(place_meeting(x, (y + 1), obj_vertical_hallway))) && (!(place_meeting(x, (y + vsp), obj_vertical_hallway))))
    {
        if (scr_slope() && (!(place_meeting(x, y, obj_dashpad))) && sprite_index != spr_dashpadboost)
        {
            flash = 0
            state = states.machroll
            sprite_index = spr_crouchslip
            if (smashbodyslam >= 100)
                movespeed = 16
            else if (smashbodyslam > 18)
                movespeed = 12
            else
                smashbodyslam = 8
            if place_meeting(x, (y + 1), obj_slope)
            {
                with (instance_place(x, (y + 1), obj_slope))
                    other.xscale = (-sign(image_xscale))
            }
            if place_meeting(x, (y + 1), obj_slopeplatform)
            {
                with (instance_place(x, (y + 1), obj_slopeplatform))
                    other.xscale = (-sign(image_xscale))
            }
        }
        else if ((!scr_slope()) && (!(place_meeting(x, y, obj_dashpad))) && sprite_index != spr_dashpadboost)
        {
            scr_sound(sound_maximumspeedland)
            image_index = 0
            state = states.freefallland
            jumpAnim = 1
            jumpstop = 0
            with (obj_camera)
            {
                shake_mag = 5
                shake_mag_acc = 15 / room_speed
            }
            if (smashbodyslam >= 20)
            {
                with (obj_baddie)
                {
                    if (point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
                    {
                        state = states.cheeseball
                        if (stunned < 100)
                            stunned = 100
                        vsp = -10
                        image_xscale *= -1
                        hsp = 0
                    }
                }
                with (obj_camera)
                {
                    shake_mag = 10
                    shake_mag_acc = 30 / room_speed
                }
            }
            combo = 0
            bounce = 0
            instance_create(x, y, obj_landcloud)
            freefallstart = 0
            if (sprite_index == spr_playerPZ_poundcancel1)
                sprite_index = spr_playerPZ_poundcancel2
            else if (sprite_index == spr_pizzano_bodyslamfall)
                sprite_index = spr_pizzano_bodyslamland
            else if (sprite_index == spr_pizzano_poundcancel)
                sprite_index = spr_pizzano_poundcancelland
            else
                sprite_index = spr_player_bodyslamland
        }
    }
    image_speed = 0.35
    if (input_buffer_slap < 8 && (!grounded) && vsp > 10 && instance_exists(obj_groundpoundeffect))
    {
        if (move != 0)
            xscale = move
        movespeed = 10
        machhitAnim = false
        state = states.mach2
        flash = true
        vsp = -7
        sprite_index = spr_mach2jump
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale
        freefallsmash = false
        input_buffer_slap = 8
    }
}

