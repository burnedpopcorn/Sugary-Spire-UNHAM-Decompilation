var __result;
function __background_get_element(argument0) //__background_get_element
{
    __result[0] = -1
    __result[1] = -1
    __result[2] = -1
    var __fgstring = "Compatibility_Foreground_"
    var __bgstring = "Compatibility_Background_"
    var __fglen = string_length(__fgstring)
    var __bglen = string_length(__bgstring)
    var __layerlist = layer_get_all()
    var __layerlistlength = array_length_1d(__layerlist)
    var __layerid = -1
    var __isforeground = 0
    var __i = 0
    while (__i < __layerlistlength)
    {
        var __layername = layer_get_name(__layerlist[__i])
        if (string_pos(__fgstring, __layername) > 0)
        {
            var __slotchr = string_char_at(__layername, (__fglen + 1))
            if (__slotchr == "")
            {
                __i++
                continue
            }
            else
            {
                var __slot = real(__slotchr)
                if (__slot == argument0)
                {
                    __layerid = __layerlist[__i]
                    __isforeground = 1
                    break
                }
                else
                {
                    __i++
                    continue
                }
            }
        }
        else if (string_pos(__bgstring, __layername) > 0)
        {
            __slotchr = string_char_at(__layername, (__bglen + 1))
            if (__slotchr == "")
            {
                __i++
                continue
            }
            else
            {
                __slot = real(__slotchr)
                if (__slot == argument0)
                {
                    __layerid = __layerlist[__i]
                    __isforeground = 0
                    break
                }
                else
                {
                    __i++
                    continue
                }
            }
        }
        else
        {
            __i++
            continue
        }
    }
    if (__layerid != -1)
    {
        if (global.layergetel != layer_get_all_elements(__layerid) && layer_get_all_elements(__layerid))
            global.layergetel = layer_get_all_elements(__layerid)
        var __elslength = array_length_1d(global.layergetel)
        for (__i = 0; __i < __elslength; __i++)
        {
            if (layer_get_element_type(global.layergetel[__i]) == 1)
            {
                __result[0] = global.layergetel[__i]
                __result[1] = __layerid
                __result[2] = __isforeground
            }
        }
    }
    else
    {
        var __newback = __background_set_element(argument0, 0, 0, -1, 0, 0, 1, 1, 1, 1, 0, 0, 0, c_white, 1)
        __result[0] = __newback[0]
        __result[1] = __newback[1]
        __result[2] = 0
    }
    return __result;
}
