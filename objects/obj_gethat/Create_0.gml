hatindex = 1
bgspr = spr_newhat
hatspr = spr_playerhatsMENU
depth = -900
finish = 0
previousID = -4
if (instance_number(object_index) > 1)
{
    var b = instance_find(object_index, (instance_number(object_index) - 2))
    if instance_exists(b)
        previousID = b
}
geth = 960
gety = 540
x = geth - 80
y = gety + 200
y_buffer = 6
movespeed = 0
