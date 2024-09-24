var panicspr = sprite_get_name(startspr) + "panic"
if (global.panic && sprite_exists(asset_get_index(panicspr)) && sprite_index != spr_gummybear_papertauntpanic)
{
    var text = string_concat(id, " Sprite Changed to: ", panicspr)
    trace(text)
    sprite_index = asset_get_index(panicspr)
    image_speed = 0.35
}
if (ds_list_find_index(global.saveroom, id) != -1 && (sprite_index == spr_gummybear_papertauntpanic || sprite_index == spr_gummybear_paper || sprite_index == spr_gummybear_paperpanic))
    sprite_index = spr_gummybear_papertauntpanic
