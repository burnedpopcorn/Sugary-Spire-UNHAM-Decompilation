event_inherited()
image_speed = 0.35
if (!global.panic)
    sprite_index = spr_rudejanitor_idle
else if global.panic
    sprite_index = spr_rudejanitor_panicidle
grabbed = false
hsp = 0
vsp = 0
grav = 0.5
flash = true
unpickable = false
hp = 0
grounded = true
state = states.normal
playerid = obj_player
mask_index = spr_player_mask
depth = -5
platformid = -4
hsp_carry = 0
vsp_carry = 0
thrown = false
