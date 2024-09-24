with (obj_player)
{
    if (state == states.cotton || state == states.cottondrill || state == states.cottonroll)
    {
        scr_sound(sfx_cottongone)
        if (character == "P")
        {
            if chance(0.5)
                scr_sound(sfx_voiceidle2PZ)
        }
        scr_sound(sfx_detransfo)
        state = states.normal
        sprite_index = spr_idle
        instance_create(x, y, obj_poofeffect)
        image_index = 0
    }
}
