function scr_player_handstandjump() //scr_player_handstandjump
{
    switch character
    {
        case "P":
            move = key_left + key_right
            landAnim = false
            mach2 = 35
            hsp = xscale * movespeed
            grav = 0
            momemtum = true
            dir = xscale
            if (movespeed < 12)
            {
                if (image_index < 2)
                    movespeed = 12
            }
            if (movespeed <= 12)
            {
                if (image_index > 7)
                    movespeed -= 0.025
            }
            if (move != xscale && move != 0)
            {
                state = states.jump
                image_index = 0
                sprite_index = spr_player_suplexdashCancel
                jumpAnim = true
                momemtum = false
                mach2 = 0
                xscale *= -1
                if audio_is_playing(sound_suplex1)
                    audio_stop_sound(sound_suplex1)
            }
            if (floor(image_index) == (image_number - 1))
            {
                state = states.normal
                grav = 0.5
                flash = false
            }
            if key_down
            {
                if grounded
                {
                    grav = 0.5
                    sprite_index = spr_crouchslip
                    machhitAnim = false
                    state = states.crouchslide
                    if audio_is_playing(sound_suplex1)
                        audio_stop_sound(sound_suplex1)
                    input_buffer_crouch = 16
                }
                else
                {
                    grav = 0.5
                    image_index = 1
                    state = states.freefallprep
                    sprite_index = spr_playerPZ_poundcancelprep
                    vsp = -5
                }
            }
            if (input_buffer_jump < 8 && grounded)
            {
                if (movespeed < 10)
                    movespeed = 10
                sprite_index = spr_playerPZ_longjump
                instance_create(x, y, obj_jumpdust)
                state = states.mach2
                vsp = -11
                if audio_is_playing(sound_suplex1)
                    audio_stop_sound(sound_suplex1)
                hsp = movespeed * xscale
                input_buffer_jump = 8
            }
            if (scr_solid((x + xscale), y) && (((!(scr_slope((x + xscale), y))) && (!(place_meeting((x + xscale), y, obj_minecartRail_Slope))) && (!grounded)) || ((!(scr_slope_ext((x + xscale), y))) && grounded)) && (!(place_meeting((x + xscale), y, obj_destructibles))))
            {
                if grounded
                {
                    grav = 0.5
                    movespeed = 0
                    state = states.bump
                    hsp = 0
                    vsp = -4
                    mach2 = 0
                    image_index = 0
                    machslideAnim = true
                    machhitAnim = false
                    sprite_index = spr_playerPZ_suplexbump
                    instance_create((x + 10 * xscale), (y + 10), obj_bumpeffect)
                    if audio_is_playing(sound_suplex1)
                        audio_stop_sound(sound_suplex1)
                    scr_sound(sound_bump)
                }
                else
                {
                    sprite_index = spr_playerPZ_wallclimb
                    image_index = 0
                    state = states.climbwall
                    if (movespeed <= 0)
                        wallspeed = 9
                    else
                    {
                        wallspeed = movespeed
                        if (movespeed < 9)
                            wallspeed = 9
                    }
                    scr_sound(sfx_climbwallstart)
                    grabclimbbuffer = 10
                }
            }
            image_speed = 0.3
            if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
                instance_create(x, y, obj_slidecloud)
            break
    }

    if (key_attack && floor(image_index) == (image_number - 1) && sprite_index != spr_player_bump)
    {
        if (movespeed < 10)
            movespeed = 10
        mach2 = 20
        state = states.mach2
        sprite_index = spr_mach
    }
    if (key_down && (!grounded) && sprite_index != spr_dive)
    {
        sprite_index = spr_dive
        vsp = 10
        state = states.machroll
        input_buffer_jump = 8
    }
    if (!global.starrmode)
    {
        if (input_buffer_slap < 8 && (!key_down))
        {
            sprite_index = spr_player_machtumble
            image_index = 0
            image_speed = 0.2
            vsp = -3
            state = states.machtumble
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale
            input_buffer_slap = 8
        }
    }
}

