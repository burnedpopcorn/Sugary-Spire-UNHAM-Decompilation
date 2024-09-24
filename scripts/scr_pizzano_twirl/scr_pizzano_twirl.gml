function scr_pizzano_twirl() //scr_pizzano_twirl
{
    sprite_index = spr_pizzano_twirl
    move = key_left + key_right
    hsp = xscale * movespeed
    if (move == xscale && movespeed < 12)
        movespeed += 0.5
    else if (move != xscale && movespeed > 0)
        movespeed -= 0.25
    if (grounded && (!key_attack))
    {
        state = states.normal
        image_index = 0
        mach2 = 0
        jumpstop = false
    }
    else if (grounded && key_attack)
    {
        state = states.mach2
        image_index = 0
        sprite_index = spr_mach
        jumpstop = false
        if (move != 0)
            xscale = move
    }
    if (key_down && (!grounded))
    {
        vsp = 10
        state = states.machroll
        input_buffer_jump = 8
    }
    if ((!key_jump) && (((!grounded) && place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_slopeplatform)))) || (grounded && place_meeting((x + hsp), (y - 32), obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && (place_meeting(x, (y + 1), obj_slope) || place_meeting(x, (y + 1), obj_slopeplatform)))))
    {
        wallspeed = movespeed
        state = states.climbwall
        hsp = 0
    }
    if (input_buffer_slap < 8 && character == "N" && charged && (!key_up))
    {
        flash = true
        state = states.rocketfistpizzano
        sprite_index = spr_pizzano_sjumpprepside
        image_index = 0
        movespeed = 0
        mach2 = 0
        charged = false
        input_buffer_slap = 8
    }
    if (character == "N" && input_buffer_slap < 8 && (!key_down) && (!suplexmove) && (!shotgunAnim) && global.cane != true && obj_player.character != "G")
    {
        scr_sound(sound_suplex1)
        instance_create(x, y, obj_slaphitbox)
        suplexmove = true
        vsp = 0
        instance_create(x, y, obj_jumpdust)
        image_index = 0
        sprite_index = choose(spr_pizzano_kungfu1, spr_pizzano_kungfu2)
        state = states.pizzano
        if (movespeed < 10)
            movespeed = 10
        input_buffer_slap = 8
    }
    if key_taunt2
    {
        taunttimer = 20
        tauntstoredmovespeed = movespeed
        tauntstoredsprite = sprite_index
        tauntstoredstate = state
        tauntstoredvsp = vsp
        state = states.backbreaker
        if (supertauntcharged && key_up)
        {
            image_index = 0
            if (character == "N")
                sprite_index = spr_pizzano_supertaunt1
            else
                sprite_index = choose(spr_player_supertaunt1, spr_player_supertaunt2, spr_player_supertaunt3)
        }
        else
        {
            image_index = irandom_range(0, sprite_get_number(spr_player_taunt))
            sprite_index = spr_player_taunt
        }
        if (sprite_index == spr_player_supertaunt1 || sprite_index == spr_player_supertaunt2 || sprite_index == spr_player_supertaunt3 || sprite_index == spr_pizzano_supertaunt1)
        {
            with (instance_create(x, y, obj_taunteffect))
                scr_sound(sfx_supertaunt)
        }
        else
            instance_create(x, y, obj_taunteffect)
    }
}

