has_won = false
flags.do_once = false
flags.do_save = false
//function anon@78@gml_RoomCC_mines_13_7_Create() //anon@78@gml_RoomCC_mines_13_7_Create
condition = function()
{
    return (place_meeting(x, y, obj_train) && obj_train.sprite_index != spr_spraydie);
}

//function anon@197@gml_RoomCC_mines_13_7_Create() //anon@197@gml_RoomCC_mines_13_7_Create
output = function()
{
    if (obj_player.x >= obj_train.x)
    {
        with (obj_player)
        {
            if (character == "N")
            {
                if (!grounded)
                    sprite_index = spr_pizzano_mach3hitwallair
                else
                    sprite_index = spr_pizzano_mach3hitwall
            }
            else
                sprite_index = spr_player_mach3hitwall
            hsp = 2.5 * (-xscale)
            vsp = -3
            mach2 = 0
            image_index = 0
            instance_create(x, y, obj_bombexplosionharmless)
            if (state == states.minecart)
            {
                for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
                {
                    with (instance_create((x + (irandom_range(-9, 9))), (y + (irandom_range(-9, obj_gnome))), obj_debris))
                    {
                        sprite_index = spr_minecartdebris
                        image_index = i
                        vsp = floor(random_range(-5, -9))
                        hsp = floor(random_range(-5, 7))
                    }
                }
            }
            state = states.bump
        }
    }
    else
    {
        with (109527)
            alarm[1] = 1
        with (109530)
            instance_destroy()
        has_won = true
    }
    with (obj_train)
    {
        if (sprite_index != spr_spraydie)
        {
            camera_shake(40, 50)
            image_index = 0
            sprite_index = spr_spraydie
        }
    }
}

