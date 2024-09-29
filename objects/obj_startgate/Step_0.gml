//start_parallax = distance_to_object(obj_player) < 150
showtext = false
if (place_meeting(x, y, obj_player) && (!instance_exists(obj_titlecard)) && obj_player.state != states.backtohub && sprite_index != spr_levelgateclosed)
{
    showtext = true
    switch level
    {
        case "entryway":
            with (obj_tv)
            {
                message = "Crunchy Construction"
                showtext = true
                alarm[0] = 2
            }
            break
        case "tutorial":
            with (obj_tv)
            {
                message = "Tutorial"
                showtext = true
                alarm[0] = 2
            }
            break
        case "steamy":
            with (obj_tv)
            {
                message = "Cottontown"
                showtext = true
                alarm[0] = 2
            }
            break
        case "unownsteamy":
            with (obj_tv)
            {
                message = "UNOWNTOWN"
                showtext = true
                alarm[0] = 2
            }
            break
        case "mines":
            with (obj_tv)
            {
                message = "Sugarshack Mines"
                showtext = true
                alarm[0] = 2
            }
            break
        case "molasses":
            with (obj_tv)
            {
                message = "Molasses Swamp"
                showtext = true
                alarm[0] = 2
            }
            break
        case "timetrial":
            with (obj_tv)
            {
                message = "TIME TRIAL"
                showtext = true
                alarm[0] = 2
            }
            break
        case "fudge":
            with (obj_tv)
            {
                message = "MT FUDGETOP"
                showtext = true
                alarm[0] = 2
            }
            break
        case "dance":
            with (obj_tv)
            {
                message = "SEX"
                showtext = true
                alarm[0] = 2
            }
            break
        case "sucrose":
            with (obj_tv)
            {
                message = "SUCROSE SNOWSTORM"
                showtext = true
                alarm[0] = 2
            }
            break
        case "martian":
            with (obj_tv)
            {
                message = "MARTIAN FREEZER"
                showtext = true
                alarm[0] = 2
            }
            break
        case "mechanical":
            with (obj_tv)
            {
                message = "MECHANICAL MADNESS"
                showtext = true
                alarm[0] = 2
            }
            break
        case "stormy":
            with (obj_tv)
            {
                message = "COTTONSTORM"
                showtext = true
                alarm[0] = 2
            }
            break
        default:
            with (obj_tv)
            {
                message = "PLACEHOLDER"
                showtext = true
                alarm[0] = 2
            }
            break
    }

}
if (obj_player.character == "N")
{
    switch title_sprite
    {
        case spr_crunchytitle:
            title_sprite = spr_crunchytitlePizzano
            break
        case spr_cottontowntitle:
            title_sprite = spr_cottontowntitlePizzano
            break
        case spr_molassestitle:
            title_sprite = spr_molassestitlePizzano
            break
        case spr_sugarshacktitle:
            title_sprite = spr_sugarshacktitlePizzano
            break
    }

}
if (prevshowtext != showtext)
{
    prevshowtext = showtext
    sigma = (!sigma)
}
if sigma
{
    drawalpha = approach(drawalpha, 1, 0.2)
    drawy = floor(lerp(drawy, y, 0.2))
}
else
{
    drawalpha = approach(drawalpha, 0, 0.2)
    drawy = floor(lerp(drawy, (y - 20), 0.2))
}
switch level
{
    case "entryway":
        if global.layout
            targetRoom = entrywaynew_1
        else
            targetRoom = entryway_1
        break
}

