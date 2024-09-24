if (vsp < 12)
    vsp += grav
image_speed = 0
x += hsp
y += floor(vsp)
depth = -999
if (cloudbuffer > 0)
    cloudbuffer--
else
{
    cloudbuffer = 5
    instance_create(x, y, obj_cloudeffect)
}
