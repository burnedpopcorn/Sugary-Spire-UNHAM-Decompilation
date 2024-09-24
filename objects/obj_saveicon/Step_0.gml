if (!finish)
{
    drawy = lerp(drawy, 0, 0.145)
    if (finishbuffer > 0)
        finishbuffer--
}
else
{
    drawy = lerp(drawy, 120, 0.1)
    if (drawy >= 120)
        instance_destroy()
}
if (finishbuffer > 0)
    finish = false
else
    finish = true
iconindex += 0.35
if (floor(iconindex) == (sprite_get_number(spr_collectslice) - 3))
    iconindex = frac(iconindex)
