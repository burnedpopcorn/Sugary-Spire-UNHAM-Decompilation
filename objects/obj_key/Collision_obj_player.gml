if (global.lvldesign == 0)
{
    if obj_player.grounded
    {
        if ((!inv_frame) && obj_player.state != states.knightpep && obj_player.state != states.cheeseball && obj_player.state != states.boxxedpep && obj_player.state != states.cheesepep && obj_player.state != states.knightpepattack && obj_player.state != states.knightpepslopes && obj_player.state != states.hurt)
        {
            instance_destroy()
            global.key_inv = true
            obj_player.key_particles = true
            obj_player.alarm[7] = 30
        }
        if ((!global.keyget) && obj_player.state != states.knightpep && obj_player.state != states.knightpepattack && obj_player.state != states.boxxedpep && obj_player.state != states.cheesepep && obj_player.state != states.knightpepslopes)
        {
            scr_sound(sound_toppingot)
            obj_player.state = states.keyget
            obj_player.image_index = 0
            global.keyget = true
            with (instance_create(x, y, obj_keyfollow))
                visible = false
            if (obj_player.character == "P")
                scr_queue_tvanim(spr_pizzytv_exprcollect, 200)
            else if (obj_player.character == "N")
                scr_queue_tvanim(spr_pizzanotv_happy, 200)
        }
    }
}
else if (global.lvldesign == 1)
{
    if ((!inv_frame) && obj_player.state != states.knightpep && obj_player.state != states.cheeseball && obj_player.state != states.boxxedpep && obj_player.state != states.cheesepep && obj_player.state != states.knightpepattack && obj_player.state != states.knightpepslopes && obj_player.state != states.hurt)
    {
        instance_destroy()
        global.key_inv = true
        obj_player.key_particles = true
        obj_player.alarm[7] = 30
    }
    if ((!global.keyget) && obj_player.state != states.knightpep && obj_player.state != states.knightpepattack && obj_player.state != states.boxxedpep && obj_player.state != states.cheesepep && obj_player.state != states.knightpepslopes)
    {
        scr_sound(sound_toppingot)
        global.keyget = true
        with (instance_create(x, (y - 30), obj_explosioneffect))
        {
            sprite_index = spr_taunteffect
            depth = -2
        }
        with (instance_create(x, y, obj_spookey))
            sprite_index = spr_spookey_appear
        if (obj_player.character == "P")
            scr_queue_tvanim(spr_pizzytv_spookey, 200)
        else if (obj_player.character == "N")
            scr_queue_tvanim(spr_pizzanotv_spookey, 200)
    }
}
