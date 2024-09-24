with (obj_player)
{
    if (state != states.cotton && state != states.cottondrill && state != states.door && state != states.cottonroll && state != states.pizzanoshoulderbash)
    {
        if (grounded && global.lvldesign == 1)
        {
            if (key_up && (state == states.normal || state == states.mach2 || state == states.mach3 || state == states.Sjumpprep))
            {
                hsp = 0
                vsp = 0
                global.combofreeze = 60
                state = states.cotton
                if (character == "P")
                {
                    if chance(0.5)
                        scr_sound(sfx_pizzelletransfo)
                }
                scr_sound(sfx_transfo)
                sprite_index = spr_cottontransfo
                xscale = 1
                if global.realsigma
                    other.visible = true
                else
                    other.visible = false
                x = other.x - other.sprite_xoffset + other.sprite_width / 2
                image_speed = 0.35
                movespeed = 0
            }
        }
        else if (global.lvldesign == 0)
        {
            global.combofreeze = 30
            state = states.cotton
            scr_sound(sfx_transfo)
            instance_create(x, y, obj_poofeffect)
            instance_create(x, y, obj_poofeffectcotton)
            sprite_index = spr_cottonidle
            scr_tip("cotton")
        }
    }
}
