function scr_player_hitenemy() //scr_player_hitenemy
{
    hsp = 0
    vsp = 0
    x = hitX + (random_range(-4, 4))
    y = hitY + (random_range(-4, 4))
    hitLag--
    image_speed = 0
    if instance_exists(obj_coneball)
        obj_coneball.maxspeed = 0
    if global.panic
    {
        global.minutes = hitstunminutes
        global.seconds = hitstunseconds
    }
    if (hitLag <= 0)
    {
        x = hitX
        y = hitY
        movespeed = tauntstoredmovespeed
        sprite_index = tauntstoredsprite
        state = tauntstoredstate
        vsp = tauntstoredvsp
        image_speed = 0.35
        if instance_exists(obj_coneball)
            obj_coneball.maxspeed = hitstunconeballspeed
    }
}

