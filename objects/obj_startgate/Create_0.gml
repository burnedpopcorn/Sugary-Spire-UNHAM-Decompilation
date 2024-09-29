image_index = 1
image_speed = 0
depth = 49
level = "placeholder"
showtext = false
parallax_array = []
old_depth = depth
gate_surf = surface_create(sprite_get_width(sprite_index), sprite_get_height(sprite_index))
//start_parallax = false
white_alpha = 1
function add_gate_parallax(argument0, argument1)//@gml_Object_obj_startgate_Create_0(argument0, argument1) //add_gate_parallax@gml_Object_obj_startgate_Create_0
{
    return 
    {
        _sprite: argument0,
        _speed: argument1,
        _x: 0
    };
}

confecti_sprs[0] = 
{
    sprite: spr_marshmellow_taunt,
    image: choose(0, 1)
}

confecti_sprs[1] = 
{
    sprite: spr_chocolate_taunt,
    image: choose(0, 1)
}

confecti_sprs[2] = 
{
    sprite: spr_crack_taunt,
    image: choose(0, 1)
}

confecti_sprs[3] = 
{
    sprite: spr_gummyworm_taunt,
    image: choose(0, 1)
}

confecti_sprs[4] = 
{
    sprite: spr_candy_taunt,
    image: choose(0, 1)
}

titlecard_sprite = spr_crunchytitlecard
titlecard_index = 0
title_sprite = spr_crunchytitle
title_index = 0
title_music = mu_crunchytitleloud
drawalpha = 0
drawy = y
prevshowtext = showtext
sigma = 0
closed = 0
start = 0
