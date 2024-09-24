function scr_confecti_taunt() //scr_confecti_taunt
{
    sprite_index = spr_taunt
    drawxscale = image_xscale
    if (obj_player.sprite_index != spr_pizzelle_taunt && obj_player.sprite_index != spr_pizzano_taunt)
        state = confectistates.normal;
}

