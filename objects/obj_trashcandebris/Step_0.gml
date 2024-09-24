if (y > (room_height + 96) || y < -96)
    instance_destroy()
x += hsp
if (vsp < 10)
    vsp += 0.5
y += vsp
if (cloudbuffer > 0)
    cloudbuffer--
else
{
    cloudbuffer = 5
    instance_create(x, y, obj_cloudeffect)
}
if bomb
{
    angle += (image_xscale * 5)
    if (place_meeting(x, y, obj_solid) || place_meeting(x, y, obj_baddie))
    {
        with (instance_create(x, y, obj_enemyhurtexplosion))
            sprite_index = spr_bombexplosion
        instance_destroy()
    }
}
