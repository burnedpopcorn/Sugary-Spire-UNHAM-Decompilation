if (obj_mainfartselect.selected == 1)
    visible = true
else if instance_exists(obj_pizzano_jumpscare)
    visible = false
else
    visible = false
image_speed = 0.35
if (obj_player.character == "N")
{
    if (animation_end() || (sprite_index != spr_file2_pizzanoprep && sprite_index != spr_file2_pizzanosquish))
    {
        if (sprite_index == spr_file2_pizzanoprep && obj_mainfartselect.selected == 1)
        {
            scr_sound(sound_maximumspeedland)
            scr_sound(sound_combo1)
            with (instance_create(476, 321, obj_sausageman_deadtitle))
            {
                hsp = -20
                image_xscale = -1
                paletteselect = other.prevpal
            }
            with (instance_create(476, 321, obj_sausageman_deadtitle))
            {
                sprite_index = spr_file_debris
                image_index = 1
                hsp = 20
            }
        }
        if (sprite_index != spr_file2_pizzanosquish)
            sprite_index = spr_file2_pizzano
    }
}
else if (sprite_index != spr_file2confirm)
    sprite_index = spr_file2
if (plushbuffer > 0)
    plushbuffer--
