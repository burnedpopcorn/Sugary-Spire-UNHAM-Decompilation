with (instance_nearest(x, y, obj_player))
{
    if ((place_meeting((x + hsp), y, other.id) || place_meeting((x + xscale), y, other.id)) && ((state == states.cotton && (sprite_index == spr_cottonattack || sprite_index == spr_cottonPizzano_drillup || sprite_index == spr_cottonPizzano_wallclimb || sprite_index == spr_cottonPizzano_fastfall || sprite_index == spr_cottonwalk)) || state == states.cottonroll || state == states.fireass))
    {
        with (other.id)
            instance_destroy()
    }
    if (((place_meeting(x, (y + vsp), other.id) && vsp > 0) || place_meeting(x, (y + 1), other.id)) && (state == states.cottondrill || (state == states.cotton && sprite_index == spr_cottonPizzano_fastfall)))
    {
        with (other.id)
            instance_destroy()
    }
    if ((place_meeting((x + hsp), y, other.id) || place_meeting((x + xscale), y, other.id)) && (state == states.minecart || ((state == states.mach3 || state == states.handstandjump || state == states.pizzano) && ischaracter == 2 && hsp != 0 && global.levelname == "mines")))
    {
        with (other.id)
            instance_destroy()
    }
}
