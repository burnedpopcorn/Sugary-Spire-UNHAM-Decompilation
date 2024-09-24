image_xscale = obj_player.xscale
if (obj_player.state != states.mach3 && obj_player.state != states.minecart)
    instance_destroy()
if (obj_player.state != states.minecart)
{
    if (obj_player.ischaracter == 1)
        x = obj_player.x + 16 * image_xscale
    else if (obj_player.sprite_index == spr_pizzano_wallclimbspincancelstart || obj_player.sprite_index == spr_pizzano_wallclimbspincancel)
        x = obj_player.x + 16 * image_xscale
    else
        x = obj_player.x
}
else if (obj_player.state == states.minecart || obj_player.ischaracter == 2)
    x = obj_player.x + 32 * obj_player.xscale
if (obj_player.sprite_index == spr_pizzano_wallclimbspincancelstart || obj_player.sprite_index == spr_pizzano_wallclimbspincancel)
    y = obj_player.y - 5
else
    y = obj_player.y
depth = obj_player.depth - 6
if (obj_player.state == states.machroll || obj_player.sprite_index == spr_player_dive || (obj_player.state == states.minecart && obj_player.movespeed < 12))
    instance_destroy()
