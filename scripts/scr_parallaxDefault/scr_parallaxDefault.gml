function scr_default_parallax(argument0) //scr_default_parallax
{
    if (argument0 == undefined)
        argument0 = false
    bg = undefined
    bg = function()
	//function anon@73@scr_default_parallax_scr_parallaxDefault() //anon@73@scr_default_parallax_scr_parallaxDefault
    {
        var _camera = new camera_get_position_struct(view_camera[0])
        var array = -4
        array[0] = _camera.centeredcam_x * 0.25
        array[1] = _camera.centeredcam_y * 0.25
        return array;
    }

    add_parallax_function("Backgrounds_1", bg, argument0)
    bg = function()
	//function anon@342@scr_default_parallax_scr_parallaxDefault() //anon@342@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        array = -4
        array[0] = _camera.centeredcam_x * 0.15
        array[1] = _camera.centeredcam_y * 0.15
        return array;
    }

    add_parallax_function("Backgrounds_2", bg, argument0)
    bg = function()
	//function anon@611@scr_default_parallax_scr_parallaxDefault() //anon@611@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        array = -4
        array[0] = _camera.centeredcam_x * 0.05
        array[1] = _camera.centeredcam_y * 0.05
        return array;
    }

    add_parallax_function("Backgrounds_3", bg, argument0)
    bg = function()
	//function anon@880@scr_default_parallax_scr_parallaxDefault() //anon@880@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        array = -4
        array[0] = _camera.centeredcam_x * 0.005
        array[1] = _camera.centeredcam_y * 0.005
        return array;
    }

    add_parallax_function("Backgrounds_4", bg, argument0)
    bg = function()
	//function anon@1151@scr_default_parallax_scr_parallaxDefault() //anon@1151@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        var back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_5"))
        array = -4
        array[0] = _camera.centeredcam_x * 0.0005
        array[1] = _camera.cam_y - (clamp((_camera.cam_y * 0.0005 * (540 / room_height)), 0, (sprite_get_height(layer_background_get_sprite(back_id)) - 540)))
        return array;
    }

    add_parallax_function("Backgrounds_5", bg, argument0)
    bg = function()
	//function anon@1606@scr_default_parallax_scr_parallaxDefault() //anon@1606@scr_default_parallax_scr_parallaxDefault
    {
        var foregroundoffsety = room_height - sprite_get_height(layer_background_get_sprite(back_id))
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_foregroundLow"))
        array = -4
        array[0] = _camera.centeredcam_x * 1.5
        array[1] = clamp((_camera.centeredcam_y * 0.9 + camera_get_view_height(view_camera[0]) - sprite_get_height(layer_background_get_sprite(back_id))), foregroundoffsety, (foregroundoffsety + 8))
        return array;
    }

    add_parallax_function("Backgrounds_foregroundLow", bg, argument0)
    bg = function()
	//function anon@2226@scr_default_parallax_scr_parallaxDefault() //anon@2226@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        array = -4
        array[0] = _camera.centeredcam_x * 1.5
        array[1] = _camera.centeredcam_x * 1.5
        return array;
    }

    add_parallax_function("Backgrounds_foreground", bg, argument0)
    bg = function()
	//function anon@2502@scr_default_parallax_scr_parallaxDefault() //anon@2502@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        array = -4
        var lay_y = 0
        if instance_exists(obj_parallax)
        {
            for (var i = 0; i < array_length(obj_parallax.layers); i++)
            {
                if (obj_parallax.layers[i] != undefined)
                {
                    with (obj_parallax.layers[i])
                    {
                        if (layer_get_name(layer_id) == "Backgrounds_long1")
                            lay_y = layer_yoffset
                    }
                }
            }
        }
        array[0] = _camera.centeredcam_x * 0.25
        array[1] = (clamp((_camera.centeredcam_y * 0.15 + lay_y), (lay_y - 192), (lay_y + 32))) - lay_y
        return array;
    }

    add_parallax_function("Backgrounds_long1", bg, argument0)
    bg = function()
	//function anon@3170@scr_default_parallax_scr_parallaxDefault() //anon@3170@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        array = -4
        lay_y = 0
        if instance_exists(obj_parallax)
        {
            for (i = 0; i < array_length(obj_parallax.layers); i++)
            {
                if (obj_parallax.layers[i] != undefined)
                {
                    with (obj_parallax.layers[i])
                    {
                        if (layer_get_name(layer_id) == "Backgrounds_long2")
                            lay_y = layer_yoffset
                    }
                }
            }
        }
        array[0] = _camera.centeredcam_x * 0.15
        array[1] = (clamp((_camera.centeredcam_y * 0.15 + lay_y), (lay_y - 192), (lay_y + 32))) - lay_y
        return array;
    }

    add_parallax_function("Backgrounds_long2", bg, argument0)
    bg = function()
	//function anon@3838@scr_default_parallax_scr_parallaxDefault() //anon@3838@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_Ground1"))
        array = -4
        var _height = room_height - sprite_get_height(layer_background_get_sprite(back_id))
        array[0] = _camera.centeredcam_x * 0.25
        array[1] = clamp((_camera.cam_y * 0.25 + camera_get_view_height(view_camera[0]) - sprite_get_height(layer_background_get_sprite(back_id))), _height, (_height + 8))
        return array;
    }

    add_parallax_function("Backgrounds_Ground1", bg, argument0)
    bg = function()
	//function anon@4410@scr_default_parallax_scr_parallaxDefault() //anon@4410@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_Ground2"))
        array = -4
        _height = room_height - sprite_get_height(layer_background_get_sprite(back_id))
        array[0] = _camera.centeredcam_x * 0.15
        array[1] = clamp((_camera.cam_y * 0.15 + camera_get_view_height(view_camera[0]) - sprite_get_height(layer_background_get_sprite(back_id))), _height, (_height + 8))
        return array;
    }

    add_parallax_function("Backgrounds_Ground2", bg, argument0)
    bg = function()
	//function anon@4982@scr_default_parallax_scr_parallaxDefault() //anon@4982@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_H1"))
        array = -4
        array[0] = _camera.centeredcam_x * 0.25
        array[1] = _camera.cam_y - (clamp((_camera.cam_y * 0.25 * (540 / room_height)), 0, (sprite_get_height(layer_background_get_sprite(back_id)) - 540)))
        return array;
    }

    add_parallax_function("Backgrounds_H1", bg, argument0)
	bg = function()
    //function anon@5435@scr_default_parallax_scr_parallaxDefault() //anon@5435@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_H2"))
        array = -4
        array[0] = _camera.centeredcam_x * 0.15
        array[1] = _camera.cam_y - (clamp((_camera.cam_y * 0.15 * (540 / room_height)), 0, (sprite_get_height(layer_background_get_sprite(back_id)) - 540)))
        return array;
    }

    add_parallax_function("Backgrounds_H2", bg, argument0)
	bg = function()
    //function anon@5888@scr_default_parallax_scr_parallaxDefault() //anon@5888@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_H3"))
        array = -4
        array[0] = _camera.centeredcam_x * 0.05
        array[1] = _camera.cam_y - (clamp((_camera.cam_y * 0.05 * (540 / room_height)), 0, (sprite_get_height(layer_background_get_sprite(back_id)) - 540)))
        return array;
    }

    add_parallax_function("Backgrounds_H3", bg, argument0)
	bg = function()
    //function anon@6341@scr_default_parallax_scr_parallaxDefault() //anon@6341@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_H4"))
        array = -4
        array[0] = _camera.centeredcam_x * 0.005
        array[1] = _camera.cam_y - (clamp((_camera.cam_y * 0.005 * (540 / room_height)), 0, (sprite_get_height(layer_background_get_sprite(back_id)) - 540)))
        return array;
    }

    add_parallax_function("Backgrounds_H4", bg, argument0)
	bg = function()
    //function anon@6796@scr_default_parallax_scr_parallaxDefault() //anon@6796@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_V1"))
        array = -4
        array[0] = _camera.cam_x - (clamp((_camera.cam_x * 0.25 * (960 / room_width)), 0, (sprite_get_width(layer_background_get_sprite(back_id)) - 960)))
        array[1] = _camera.centeredcam_y * 0.25
        return array;
    }

    add_parallax_function("Backgrounds_V1", bg, argument0)
	bg = function()
    //function anon@7247@scr_default_parallax_scr_parallaxDefault() //anon@7247@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_V2"))
        array = -4
        array[0] = _camera.cam_x - (clamp((_camera.cam_x * 0.15 * (960 / room_width)), 0, (sprite_get_width(layer_background_get_sprite(back_id)) - 960)))
        array[1] = _camera.centeredcam_y * 0.15
        return array;
    }

    add_parallax_function("Backgrounds_V2", bg, argument0)
	bg = function()
    //function anon@7698@scr_default_parallax_scr_parallaxDefault() //anon@7698@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_sun"))
        array = -4
        array[0] = _camera.cam_x - (clamp((_camera.cam_x * 0.8 * (960 / room_width)), 0, (sprite_get_width(layer_background_get_sprite(back_id)) - 960)))
        array[1] = _camera.cam_y - (clamp((_camera.cam_y * 0.6 * (540 / room_height)), 0, (sprite_get_height(layer_background_get_sprite(back_id)) - 540)))
        return array;
    }

    add_parallax_function("Backgrounds_sun", bg, argument0)
	bg = function()
    //function anon@8252@scr_default_parallax_scr_parallaxDefault() //anon@8252@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_far"))
        array = -4
        array[0] = _camera.cam_x - (clamp((_camera.cam_x * 0.3 * (960 / room_width)), 0, (sprite_get_width(layer_background_get_sprite(back_id)) - 960)))
        array[1] = _camera.cam_y - (clamp((_camera.cam_y * 0.3 * (540 / room_height)), 0, (sprite_get_height(layer_background_get_sprite(back_id)) - 540)))
        return array;
    }

    add_parallax_function("Backgrounds_far", bg, argument0)
	bg = function()
    //function anon@8806@scr_default_parallax_scr_parallaxDefault() //anon@8806@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_far1"))
        array = -4
        array[0] = _camera.cam_x - (clamp((_camera.cam_x * 0.25 * (960 / room_width)), 0, (sprite_get_width(layer_background_get_sprite(back_id)) - 960)))
        array[1] = _camera.cam_y - (clamp((_camera.cam_y * 0.25 * (540 / room_height)), 0, (sprite_get_height(layer_background_get_sprite(back_id)) - 540)))
        return array;
    }

    add_parallax_function("Backgrounds_far1", bg, argument0)
	bg = function()
    //function anon@9364@scr_default_parallax_scr_parallaxDefault() //anon@9364@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_far2"))
        array = -4
        array[0] = _camera.cam_x - (clamp((_camera.cam_x * 0.15 * (960 / room_width)), 0, (sprite_get_width(layer_background_get_sprite(back_id)) - 960)))
        array[1] = _camera.cam_y - (clamp((_camera.cam_y * 0.15 * (540 / room_height)), 0, (sprite_get_height(layer_background_get_sprite(back_id)) - 540)))
        return array;
    }

    add_parallax_function("Backgrounds_far2", bg, argument0)
	bg = function()
    //function anon@9922@scr_default_parallax_scr_parallaxDefault() //anon@9922@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_far3"))
        array = -4
        array[0] = _camera.cam_x - (clamp((_camera.cam_x * 0.05 * (960 / room_width)), 0, (sprite_get_width(layer_background_get_sprite(back_id)) - 960)))
        array[1] = _camera.cam_y - (clamp((_camera.cam_y * 0.05 * (540 / room_height)), 0, (sprite_get_height(layer_background_get_sprite(back_id)) - 540)))
        return array;
    }

    add_parallax_function("Backgrounds_far3", bg, argument0)
	bg = function()
    //function anon@10480@scr_default_parallax_scr_parallaxDefault() //anon@10480@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        array = -4
        array[0] = _camera.cam_x
        array[1] = _camera.cam_y
        return array;
    }

    add_parallax_function("Backgrounds_still", bg, argument0)
	bg = function()
    //function anon@10723@scr_default_parallax_scr_parallaxDefault() //anon@10723@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        array = -4
        array[0] = _camera.cam_x * 0.25
        array[1] = _camera.cam_y
        return array;
    }

    add_parallax_function("Backgrounds_stillh", bg, argument0)
	bg = function()
    //function anon@10974@scr_default_parallax_scr_parallaxDefault() //anon@10974@scr_default_parallax_scr_parallaxDefault
    {
        array = -4
        array[0] = 0
        array[1] = 0
        return array;
    }

    add_parallax_function("Backgrounds_stilld", bg, argument0)
	bg = function()
    //function anon@11129@scr_default_parallax_scr_parallaxDefault() //anon@11129@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        array = -4
        array[0] = _camera.cam_x
        array[1] = 0
        return array;
    }

    add_parallax_function("Backgrounds_cloud", bg, argument0)
	bg = function()
    //function anon@11360@scr_default_parallax_scr_parallaxDefault() //anon@11360@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        array = -4
        array[0] = 0
        array[1] = _camera.cam_y * 0.99
        return array;
    }

    add_parallax_function("Backgrounds_moon", bg, argument0)
	bg = function()
    //function anon@11597@scr_default_parallax_scr_parallaxDefault() //anon@11597@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_cloudsentry"))
        array = -4
        array[0] = _camera.cam_x - (clamp((_camera.cam_x * 0.3 * (960 / room_width)), 0, (sprite_get_width(layer_background_get_sprite(back_id)) - 960)))
        array[1] = _camera.cam_y - (clamp((_camera.cam_y * 0.6 * (540 / room_height)), 0, (sprite_get_height(layer_background_get_sprite(back_id)) - 540)))
        return array;
    }

    add_parallax_function("Backgrounds_cloudsentry", bg, argument0)
	bg = function()
    //function anon@12167@scr_default_parallax_scr_parallaxDefault() //anon@12167@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_scloudsentry"))
        array = -4
        array[0] = _camera.cam_x - (clamp((_camera.cam_x * 1.5 * (960 / room_width)), 0, (sprite_get_width(layer_background_get_sprite(back_id)) - 960)))
        array[1] = _camera.cam_y - (clamp((_camera.cam_y * 0.05 * (540 / room_height)), 0, (sprite_get_height(layer_background_get_sprite(back_id)) - 540)))
        return array;
    }

    add_parallax_function("Backgrounds_scloudsentry", bg, argument0)
	bg = function()
    //function anon@12740@scr_default_parallax_scr_parallaxDefault() //anon@12740@scr_default_parallax_scr_parallaxDefault
    {
        _camera = new camera_get_position_struct(view_camera[0])
        back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_still1"))
        array = -4
        array[0] = _camera.cam_x - (clamp((_camera.cam_x * 0.15 * (960 / room_width)), 0, (sprite_get_width(layer_background_get_sprite(back_id)) - 960)))
        array[1] = _camera.cam_y - (clamp((_camera.cam_y * 0.15 * (540 / room_height)), 0, (sprite_get_height(layer_background_get_sprite(back_id)) - 540)))
        return array;
    }

    add_parallax_function("Backgrounds_still1", bg, argument0)
    bg = undefined
}

