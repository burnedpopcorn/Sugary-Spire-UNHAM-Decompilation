if active
{
    with (obj_player)
    {
        state = states.actor
        hsp = 0
        vsp = 0
        visible = false
    }
}
if (floor(image_index) == (image_number - 1))
{
    switch sprite_index
    {
        case spr_lapportal_appearPZ:
            scr_sound(sfx_lapexit)
            sprite_index = spr_lapportalentrancePZ
            break
        case spr_lapportalentrancePZ:
            sprite_index = spr_lapportal_disappearPZ
            image_index = 0
            with (obj_player)
            {
                state = states.freefall
                if (character == "N")
                    sprite_index = spr_pizzano_bodyslamfall
                else
                    sprite_index = spr_player_bodyslamfall
                vsp = 9
                visible = true
            }
            active = false
            break
        case spr_lapportal_disappearPZ:
            instance_create(0, 0, obj_lap2visual)
            instance_destroy()
            break
    }

}
