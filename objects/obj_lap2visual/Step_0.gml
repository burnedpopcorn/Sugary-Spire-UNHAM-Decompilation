if down
{
    var ty = 24
    y = approach(y, ty, movespeed)
    if (y >= ty && alarm[0] == -1)
        alarm[0] = 80
}
else
{
    ty = (-sprite_height)
    y = approach(y, ty, movespeed)
    if (y <= ty)
        instance_destroy()
}
x = -100
if (global.lapcount <= 1)
    sprite_index = spr_lap2PZ
else if (global.lapcount > 1 && global.lappingsys == 0)
    sprite_index = spr_lapextraPZ
else if (global.lapcount > 1 && global.lappingsys == 1)
    sprite_index = spr_lap3PZ
if global.showhud
    visible = 1
else
    visible = 0
