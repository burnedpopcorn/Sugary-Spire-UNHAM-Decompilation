if (obj_mainfartselect.selected == 2)
    visible = true
else
    visible = false
if (obj_player.character == "N")
{
    if (animation_end() || sprite_index != spr_file3_pizzanoprep)
    {
        if (sprite_index == spr_file3_pizzanoprep && obj_mainfartselect.selected == 2)
        {
            scr_sound(sound_maximumspeedland)
            scr_sound(sound_combo1)
            with (instance_create(160, 320, obj_sausageman_deadtitle))
            {
                image_xscale = 1
                hsp = 20
                paletteselect = other.prevpal
            }
            with (instance_create(160, 280, obj_sausageman_deadtitle))
            {
                sprite_index = spr_file_debris
                image_index = 2
                hsp = 20
            }
            with (instance_create(160, 320, obj_sausageman_deadtitle))
            {
                sprite_index = spr_file_debris
                image_index = 3
                hsp = 20
            }
        }
        sprite_index = spr_file3_pizzano
    }
}
else if (sprite_index != spr_file3confirm)
    sprite_index = spr_file3
