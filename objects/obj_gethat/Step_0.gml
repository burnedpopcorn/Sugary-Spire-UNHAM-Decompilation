if (!finish)
{
    if (!instance_exists(previousID))
    {
        y = floor(lerp(y, (gety - 50), 0.1))
        if (y == (gety - 50) && alarm[0] == -1)
            alarm[0] = 100
    }
}
else
{
    y += movespeed
    movespeed = lerp(movespeed, 12, 0.2)
    if (y >= (gety + 200))
        instance_destroy()
}
