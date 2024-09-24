if global.key_inv
{
    vsp = -15
    hsp = random_range(-4, 4)
}
hsp = 0
vsp = 0
inv_frame = false
if (global.lvldesign == 0)
    grav = 0.4
else
    grav = 0
image_speed = 0.35
if global.key_inv
    instance_destroy()
if (global.lvldesign == 1)
{
    sprite_index = spr_spookey_idlewaiting
    depth = -100
}
