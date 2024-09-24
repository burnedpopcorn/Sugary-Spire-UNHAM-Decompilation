function scr_queue_tvanim(argument0, argument1) //scr_queue_tvanim
{
    if (argument0 == undefined)
        argument0 = undefined
    if (argument1 == undefined)
        argument1 = 150
    with (obj_tv)
    {
        if (expressionsprite != argument0 && argument0 != idletvspr)
        {
            expressionsprite = argument0
            draw_static = true
            state = states.barrelfloat
            static_index = 0
            expressiontime = argument1
        }
    }
}

function scr_forceplay_tvanim(argument0, argument1) //scr_forceplay_tvanim
{
    if (argument0 == undefined)
        argument0 = undefined
    if (argument1 == undefined)
        argument1 = 150
    obj_tv.tvsprite = ds_queue_dequeue(argument0)
    obj_tv.tvlength = ds_queue_dequeue(argument1)
    ds_queue_clear(global.newhudtvanim)
}

