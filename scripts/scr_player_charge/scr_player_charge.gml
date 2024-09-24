function scr_player_charge() //scr_player_charge
{
    if (windingAnim < 2000)
        windingAnim++
    if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
        hsp = xscale * movespeed
    else if place_meeting(x, (y + 1), obj_railh)
        hsp = xscale * movespeed - 5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = xscale * movespeed + 5
    if (!key_attack)
        movespeed -= 0.25
    else
    {
        if (movespeed < 10)
            movespeed++
        movespeed = clamp(movespeed, 0, 24)
    }
    move2 = key_right2 + key_left2
    move = key_right + key_left
    crouchslideAnim = true
    if ((!key_jump2) && (!jumpstop) && vsp < 0.5)
    {
        vsp /= 2
        jumpstop = true
    }
    if (movespeed <= 0)
        state = states.grab
    if (input_buffer_slap < 8)
    {
        sprite_index = spr_player_swingdingend
        state = states.finishingblow
        image_index = 0
        hsp = 0
        movespeed = 0
        input_buffer_slap = 8
    }
    if (grounded && vsp > 0)
        jumpstop = false
    if (input_buffer_jump < 8 && grounded)
    {
        scr_sound(sound_jump)
        vsp = -10
    }
    if (scr_solid((x + xscale), y) && (!(place_meeting((x + xscale), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_slopeplatform))) && (!(place_meeting((x + xscale), y, obj_minecartRail_Slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
        xscale *= -1
    image_speed = 0.65
    if ((!instance_exists(obj_dashcloud)) && grounded)
        instance_create(x, y, obj_dashcloud)
    if (key_down && (!grounded))
    {
        sprite_index = spr_player_piledriverstart
        vsp = -6
        state = states.superslam
        image_index = 0
        image_speed = 0.35
    }
}

