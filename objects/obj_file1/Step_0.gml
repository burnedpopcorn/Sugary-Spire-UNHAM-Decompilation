var asset = layer_sprite_get_id(layer_get_id("Assets_1"), "graphic_3493EB49")
layer_sprite_speed(asset, 0.35)
if (obj_mainfartselect.selected == 0)
    visible = true
else
    visible = false
if (obj_player.character == "N")
{
    if (animation_end() || sprite_index != spr_file1_pizzanoprep)
    {
        if (sprite_index == spr_file1_pizzanoprep && obj_mainfartselect.selected == 0)
        {
            scr_sound(sound_maximumspeedland)
            scr_sound(sound_combo1)
            with (instance_create(820, 300, obj_sausageman_deadtitle))
            {
                image_xscale = -1
                hsp = -20
                paletteselect = other.prevpal
            }
            with (instance_create(820, 300, obj_sausageman_deadtitle))
            {
                sprite_index = spr_file_debris
                image_index = 0
                hsp = -20
            }
        }
        sprite_index = spr_file1_pizzano
    }
}
else if (sprite_index != spr_file1confirm)
    sprite_index = spr_file1
