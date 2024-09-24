if (sprite_index != spr_candybegin && sprite_index != spr_candyidle && sprite_index != spr_candyup && sprite_index != spr_candytransitionup && state != states.noclip)
{
    if (!instance_exists(obj_technicaldifficulty))
        instance_create(x, y, obj_technicaldifficulty)
    if instance_exists(obj_train)
    {
        with (obj_train)
        {
            x = xstart
            y = ystart
            movespeed = 10
            image_index = 0
            sprite_index = spr_spray
            go = 0
        }
    }
    state = states.hurt
    alarm[8] = 60
    alarm[7] = 120
    hurted = 1
    sprite_index = spr_hurt
    movespeed = 0
    vsp = -3
    visible = false
    global.combofreeze = 60
}
