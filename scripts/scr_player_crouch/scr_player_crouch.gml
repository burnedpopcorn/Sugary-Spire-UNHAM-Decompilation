function scr_player_crouch() //scr_player_crouch
{
    move = key_left + key_right
    if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
        hsp = move * movespeed
    else if place_meeting(x, (y + 1), obj_railh)
        hsp = move * movespeed - 5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = move * movespeed + 5
    if (mask_index == spr_player_mask || mask_index == spr_crouchmask)
        mask_index = spr_crouchmask
    turning = false
    movespeed = 4
    if ((!grounded) && (!key_jump))
    {
        jumpAnim = false
        state = states.crouchjump
        movespeed = 4
        crouchAnim = true
        image_index = 0
    }
    if (input_buffer_jump < 8 && grounded && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
    {
        scr_sound(sound_jump)
        vsp = -8
        state = states.crouchjump
        movespeed = 4
        image_index = 0
        crouchAnim = true
        jumpAnim = true
        input_buffer_jump = 8
    }
    if (grounded && (!key_down) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && (!key_jump))
    {
        state = states.normal
        movespeed = false
        crouchAnim = true
        jumpAnim = true
        image_index = 0
        if (mask_index == spr_player_mask || mask_index == spr_crouchmask)
            mask_index = spr_player_mask
    }
    if (!crouchAnim)
    {
        if (move == 0)
        {
            if (!shotgunAnim)
                sprite_index = spr_crouch
            else
                sprite_index = spr_shotgun_duck
        }
        if (move != 0)
            sprite_index = spr_crawl
    }
    if crouchAnim
    {
        if (move == 0)
        {
            if (!shotgunAnim)
                sprite_index = spr_couchstart
            else
                sprite_index = spr_shotgun_goduck
            if (floor(image_index) == (image_number - 1))
                crouchAnim = false
        }
    }
    if (move != 0)
    {
        xscale = move
        crouchAnim = false
    }
    if (key_taunt2 && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
    {
        taunttimer = 20
        tauntstoredmovespeed = movespeed
        tauntstoredsprite = sprite_index
        tauntstoredstate = state
        tauntstoredvsp = vsp
        state = states.backbreaker
        if (global.tauntcount < 10 && place_meeting(x, y, obj_exitgate) && global.panic == true && global.combotime > 0)
        {
            global.tauntcount++
            global.collect += 25
            create_small_number((x + 16), y, "25")
            global.combofreeze = 30
            global.combotime += 10
            with (instance_create(x, y, obj_collecteffect))
            {
                sprite_index = spr_taunteffect
                image_index = 9
                choosed = true
            }
            scr_sound(sound_points)
        }
        if (supertauntcharged && key_up)
        {
            image_index = 0
            if (character == "N")
                sprite_index = choose(spr_pizzano_supertaunt1, spr_pizzano_supertaunt2)
            else
                sprite_index = choose(spr_player_supertaunt1, spr_player_supertaunt2, spr_player_supertaunt3)
        }
        else
        {
            image_index = irandom_range(0, sprite_get_number(spr_player_taunt))
            sprite_index = spr_player_taunt
        }
        if (sprite_index == spr_player_supertaunt1 || sprite_index == spr_player_supertaunt2 || sprite_index == spr_player_supertaunt3 || sprite_index == spr_pizzano_supertaunt1 || sprite_index == spr_pizzano_supertaunt2)
        {
            with (instance_create(x, y, obj_taunteffect))
                scr_sound(sfx_supertaunt)
        }
        else
            instance_create(x, y, obj_taunteffect)
    }
    image_speed = 0.3
}

