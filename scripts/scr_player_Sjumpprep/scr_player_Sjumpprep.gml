function scr_player_Sjumpprep() //scr_player_Sjumpprep
{
    combo = 0
    mach2 = 0
    move = key_left + key_right
    if (sprite_index == spr_superjumpprep)
    {
        if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
            hsp = xscale * movespeed
        else if place_meeting(x, (y + 1), obj_railh)
            hsp = xscale * movespeed - 5
        else if place_meeting(x, (y + 1), obj_railh2)
            hsp = xscale * movespeed + 5
        if (movespeed >= 0)
            movespeed -= 0.8
    }
    if (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft)
    {
        if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
            hsp = move * 2
        else if place_meeting(x, (y + 1), obj_railh)
            hsp = move * 2 - 5
        else if place_meeting(x, (y + 1), obj_railh2)
            hsp = move * 2 + 5
    }
    if (sprite_index != spr_superjumpprep)
    {
        if (sign(hsp) == 0)
            sprite_index = spr_superjumppreplight
        if (sign(hsp) == 1)
        {
            if (xscale == 1)
                sprite_index = spr_superjumpright
            if (xscale == -1)
                sprite_index = spr_superjumpleft
        }
        if (sign(hsp) == -1)
        {
            if (xscale == 1)
                sprite_index = spr_superjumpleft
            if (xscale == -1)
                sprite_index = spr_superjumpright
        }
    }
    start_running = true
    alarm[4] = 14
    jumpAnim = true
    dashAnim = true
    landAnim = false
    machslideAnim = true
    moveAnim = true
    stopAnim = true
    crouchslideAnim = true
    crouchAnim = true
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_superjumpprep)
        sprite_index = spr_superjumppreplight
    if ((!key_up) && (grounded || Sjumpcan_doublejump) && (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpleft || sprite_index == spr_superjumpright) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
    {
        scr_sound(sound_superjumprelease)
        instance_create(x, y, obj_explosioneffect)
        sprite_index = spr_superjump
        state = states.Sjump
        vsp = -12
        movespeed = 12
        Sjumpcan_doublejump = false
        audio_stop_sound(sfx_superjumphold)
        audio_stop_sound(sound_superjumpcharge2)
    }
    if ((!audio_is_playing(sfx_superjumphold)) && (!audio_is_playing(sound_superjumpcharge1)))
    {
        if (sprite_index != spr_superjumpprep && sprite_index != spr_superjump)
            scr_sound(sfx_superjumphold)
    }
    image_speed = 0.35
}

