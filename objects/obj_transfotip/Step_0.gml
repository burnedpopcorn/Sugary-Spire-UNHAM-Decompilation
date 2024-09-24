if (!finish)
{
    alpha = approach(alpha, 1, 0.1)
    if obj_tv.showtext
        finish = true
}
else
{
    alpha = approach(alpha, 0, 0.1)
    if (alpha == 0)
        instance_destroy()
}
if (sign(obj_player.xscale) == -1)
{
    movexscale = key_get(global.key_left)
    movesprite = keysprite_get(global.key_left)
}
else if (sign(obj_player.xscale) == 1)
{
    movexscale = key_get(global.key_right)
    movesprite = keysprite_get(global.key_right)
}
