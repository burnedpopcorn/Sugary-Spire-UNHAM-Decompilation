depth = obj_tv.depth + 1
if (timer > 0)
    timer--
else
{
    timer = timer_max
    if (comboscore > 0)
    {
        if (combominus <= 1)
            combominus = 1
        comboscore -= round(combominus)
        if (comboscore < 0)
            comboscore = 0
        var colspr = [spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5]
        with (instance_create(-100, -100, obj_collecteffect))
        {
            drawx = 820
            drawy = 250
            pal_index = irandom_range(1, sprite_get_width(spr_candy_pal))
        }
        comboscoredisplay++
    }
    else if (alarm[1] == -1)
        alarm[1] = 50
}
if (global.combotime > 0 && global.combo > 0 && (!startgoto))
    y = approach(y, (ystart + 90), 10)
title_index += 0.35
if (title_index >= 2)
    title_index = frac(title_index)
if (room == rank_room || room == timesuproom)
    instance_destroy()
if (scalealpha == 1)
    scorealpha = approach(scorealpha, 1, 0.1)
scalealpha = approach(scalealpha, 1, 0.1)
if startlerp
{
    y = lerp(y, 70, 0.1)
    movespeed = approach(movespeed, 0.5, 0.1)
}
if (comboscoredisplay == comboscoremax && (!startgoto))
{
    startgoto = 1
    alarm[1] = 100
}
if startlerp
    veryalpha = approach(veryalpha, 0, 0.1)
if (movespeed == 0.5)
    instance_destroy()
if (global.combo >= 125)
    very = 1
