function parallax_layer(argument0 = undefined)
{
    var return_value;
    return_value[0] = 0;
    return_value[1] = 0;
    
    if (argument0 != -4)
    {
        var _layer = ds_map_find_value(global.ParallaxMap, layer_get_name(argument0));
        
        if (!is_undefined(_layer))
        {
            var _function = ds_map_find_value(global.ParallaxMap, layer_get_name(argument0));
            return _function();
        }
    }
    
    return return_value;
}

function add_parallax_function(argument0, argument1, argument2 = false)
{
    if (argument2 || (argument1 == 0 && is_undefined(ds_map_find_value(global.ParallaxMap, layer_get_name(argument0)))))
        ds_map_set(global.ParallaxMap, argument0, argument1);
    
    return true;
}
