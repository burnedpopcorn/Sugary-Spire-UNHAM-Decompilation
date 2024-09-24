function scr_playerN_minecartspin() //scr_playerN_minecartspin
{
    move = key_left + key_right
    hsp = movespeed
    if (move != 0)
    {
        if (floor(hsp) != 0)
            xscale = sign(hsp)
        dir = move
    }
    movespeed = approach(movespeed, (dir * 15), 0.5)
    if (scr_solid((x + (-dir)), y) && (!(place_meeting((x + (-dir)), y, obj_destructibles))) && (!(place_meeting((x + (-dir)), y, obj_minecartRail_Slope))))
        movespeed = 0
    if (scr_solid((x + dir), y) && (!(place_meeting((x + dir), y, obj_destructibles))) && (!(place_meeting((x + dir), y, obj_minecartRail_Slope))) && (!(place_meeting((x + dir), y, obj_metalblock))))
    {
        if (move != 0)
            xscale = dir
        movespeed = abs(hsp)
        if grounded
            sprite_index = spr_pizzano_mach3hitwall
        else
            sprite_index = spr_pizzano_mach3hitwallair
        state = states.bump
        hsp = 2.5 * (-xscale)
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create(x, y, obj_bombexplosionharmless)
        audio_stop_sound(sfx_railgrind)
        for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
        {
            with (instance_create((x + (irandom_range(-9, 9))), (y + (irandom_range(-9, 9))), obj_debris))
            {
                sprite_index = spr_minecartdebris
                image_index = i
                vsp = floor(random_range(-5, -9))
                hsp = floor(random_range(-5, 7))
            }
        }
    }
    if ((place_meeting(x, (y + 1), obj_minecartRail) || place_meeting(x, (y + 1), obj_minecartRail_Slope) || scr_solid(x, (y + 1))) && grounded)
    {
        if (move != 0)
            xscale = dir
        movespeed = abs(hsp)
        state = states.minecart
        if (movespeed < 8)
            movespeed = 8
        sprite_index = (movespeed >= 12 ? spr_pl_minecartfastland : spr_pl_minecartland)
        image_index = 0
    }
    if (key_down && vsp < 20)
        vsp += 0.5
    image_speed = 0.35
}

