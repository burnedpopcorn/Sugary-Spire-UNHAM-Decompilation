if (sprite_index != spr_spookey_appear)
{
    if (vsp == 0)
        sprite_index = spr_spookey_idle
    else
        sprite_index = (x != xprevious ? spr_spookey_move : spr_spookey_idle)
    if ((xprevious - x) != 0)
        image_xscale = (-(sign(xprevious - x)))
    else if (obj_player.hsp == 0)
        image_xscale = obj_player.xscale
}
