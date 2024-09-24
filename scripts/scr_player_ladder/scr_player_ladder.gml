function scr_player_ladder() //scr_player_ladder
{
    jumpAnim = true
    dashAnim = true
    landAnim = false
    moveAnim = true
    stopAnim = true
    crouchslideAnim = true
    crouchAnim = false
    machhitAnim = false
    turning = false
    jumpstop = false
    movespeed = 0
    hsp = 0
    if (character != "N")
    {
        if key_up
        {
            sprite_index = spr_laddermove
            vsp = -6
            image_speed = 0.35
        }
        else if key_down
        {
            sprite_index = spr_ladderdown
            vsp = 6
            image_speed = -0.35
        }
        else
        {
            sprite_index = spr_Ladder
            vsp = 0
        }
    }
    else if key_up
    {
        if (sprite_index == spr_pizzano_laddermid)
            image_index = 7
        else if (sprite_index == spr_Ladder)
            image_index = 0
        sprite_index = spr_laddermove
        vsp = -6
        image_speed = 0.35
    }
    else if key_down
    {
        if (sprite_index == spr_pizzano_laddermid)
            image_index = 1
        else if (sprite_index == spr_Ladder)
            image_index = 10
        sprite_index = spr_ladderdown
        vsp = 6
        image_speed = 0.35
    }
    else
    {
        if (sprite_index == spr_laddermove)
        {
            if (image_index > 3 && image_index < 10)
                sprite_index = spr_pizzano_laddermid
            else if (sprite_index != spr_Ladder)
                sprite_index = spr_Ladder
        }
        else if (sprite_index == spr_ladderdown)
        {
            if (image_index > 0 && image_index < 6)
                sprite_index = spr_pizzano_laddermid
            else if (sprite_index != spr_Ladder)
                sprite_index = spr_Ladder
        }
        vsp = 0
    }
    mach2 = 0
    jumpAnim = true
    dashAnim = true
    landAnim = false
    moveAnim = true
    stopAnim = true
    crouchslideAnim = true
    crouchAnim = true
    machhitAnim = false
    if (!(place_meeting(x, y, obj_ladder)))
    {
        landAnim = false
        jumpAnim = false
        state = states.normal
        image_index = 0
        vsp = 0
    }
    if (input_buffer_jump < 8)
    {
        scr_sound(sound_jump)
        ladderbuffer = 20
        jumpAnim = true
        state = states.jump
        if key_down
            sprite_index = spr_fall
        else
        {
            sprite_index = spr_jump
            vsp = -9
        }
        image_index = 0
        input_buffer_jump = 8
    }
    if (key_down && grounded && (!(place_meeting(x, y, obj_platform))))
    {
        state = states.normal
        image_index = 0
    }
}

