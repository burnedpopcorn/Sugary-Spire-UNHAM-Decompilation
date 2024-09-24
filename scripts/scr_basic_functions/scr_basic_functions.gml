function approach(argument0, argument1, argument2) //approach
{
    return (argument0 + (clamp((argument1 - argument0), (-argument2), argument2)));
}

function chance(argument0) //chance
{
    return argument0 > random(1);
}

function wave(argument0, argument1, argument2, argument3) //wave
{
    var a4 = (argument1 - argument0) * 0.5
    return (argument0 + a4 + (sin((current_time * 0.001 + argument2 * argument3) / argument2 * (2 * pi))) * a4);
}

function Wave(argument0, argument1, argument2, argument3, argument4) //Wave
{
    if (argument4 == undefined)
        argument4 = -4
    a4 = (argument1 - argument0) * 0.5
    var t = current_time
    if (argument4 != -4)
        t = argument4
    return (argument0 + a4 + (sin((t * 0.001 + argument2 * argument3) / argument2 * (2 * pi))) * a4);
}

function distance_to_pos(argument0, argument1, argument2, argument3, argument4, argument5) //distance_to_pos
{
    return (abs(argument0 - argument2) <= argument4 && abs(argument1 - argument3) <= argument5);
}

function try_solid(argument0, argument1, argument2, argument3) //try_solid
{
    var old_x = x
    var old_y = y
    var n = -1
    var cam_speed = 4
    var i = 0
    while (i < argument3)
    {
        x += argument0
        y += argument1
        if (!(scr_solid(x, y)))
        {
            n = i + 1
            break
        }
        else
        {
            i++
            continue
        }
    }
    x = old_x
    y = old_y
    return n;
}

function ledge_bump(argument0, argument1) //ledge_bump
{
    if (argument1 == undefined)
        argument1 = 4
    old_x = x
    old_y = y
    x += (xscale * argument1)
    var ty = try_solid(0, -1, obj_solid, argument0)
    x = old_x
    if (ty != -1)
    {
        y -= ty
        x += xscale
        if scr_solid(x, y)
        {
            x = old_x
            y = old_y
            return true;
        }
        return false;
    }
    return true;
}

function wrap(argument0, argument1, argument2) //wrap
{
    var value = floor(argument0)
    var _min = floor(min(argument1, argument2))
    var _max = floor(max(argument1, argument2))
    var range = _max - _min + 1
    return (((((value - _min) % range) + range) % range) + _min);
}

function animation_end(argument0, argument1) //animation_end
{
    if (argument0 == undefined)
        argument0 = floor(image_index)
    if (argument1 == undefined)
        argument1 = image_number - 1
    return argument0 >= argument1;
}

function draw_sprite_ext_flash(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) //draw_sprite_ext_flash
{
    gpu_set_fog(true, argument7, 0, 1)
    draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
    gpu_set_fog(false, c_black, 0, 0)
    return;
}

function rank_checker(argument0) //rank_checker
{
    if (argument0 == undefined)
        argument0 = global.rank
    value = 0
    switch argument0
    {
        case "p":
            value = 5
            break
        case "s":
            value = 4
            break
        case "a":
            value = 3
            break
        case "b":
            value = 2
            break
        case "c":
            value = 1
            break
        case "d":
            value = 0
            break
    }

    return value;
}

function string_extract(argument0, argument1, argument2) //string_extract
{
    var len = string_length(argument1) - 1
    repeat argument2
        argument0 = string_delete(argument0, 1, ((string_pos(argument1, argument0)) + len))
    argument0 = string_delete(argument0, string_pos(argument1, argument0), string_length(argument0))
    return argument0;
}

function create_small_number(argument0, argument1, argument2, argument3) //create_small_number
{
    if (argument3 == undefined)
        argument3 = 0
    var _smallnumber = instance_create(argument0, argument1, obj_smallnumber)
    with (_smallnumber)
    {
        number = string(argument2)
        color = argument3
    }
    return _smallnumber;
}

function string_get_split(argument0, argument1) //string_get_split
{
    var slot = 0
    var splits = []
    var str2 = ""
    for (i = 1; i < (string_length(argument0) + 1); i++)
    {
        var currStr = string_char_at(argument0, i)
        if (currStr == argument1)
        {
            if (str2 != "")
            {
                splits[slot] = str2
                slot++
            }
            str2 = ""
        }
        else
        {
            str2 = str2 + currStr
            splits[slot] = str2
        }
    }
    if (str2 == "")
        splits[slot] = str2
    return splits;
}

function trace() //trace
{
    var _string = ""
    for (i = 0; i < argument_count; i++)
        _string += string(argument[i])
    show_debug_message(_string)
}

