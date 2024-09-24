if (vsp < 12)
    vsp += grav
if (sprite_index == spr_breakable_debris)
    image_speed = 0.35
else
    image_speed = 0
x += hsp
y += floor(vsp)
depth = -999
if (sprite_index != spr_treasure)
    image_angle += rot
else
    image_angle = 0
