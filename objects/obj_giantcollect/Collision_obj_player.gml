if (global.collectsound == 10)
{
    scr_sound(sound_points)
    scr_sound(sound_pizzacoin)
}
global.collectsound = 0
scr_queue_tvanim(obj_tv.happytvspr, 200)
global.collect += 1000
global.pizzameter += 5
create_small_number(x, y, "1000")
global.combofreeze = 30
global.combotime = 60
if (obj_player.character == "P")
{
    if chance(0.25)
        scr_sound(sfx_voicecollect1PZ, sfx_voicecollect2PZ, sfx_voicecollect3PZ, sfx_voicecollect4PZ)
}
else if chance(0.25)
    scr_sound(sfx_pizzanocollect1, sfx_pizzanocollect2, sfx_pizzanocollect3, sfx_pizzanocollect4)
repeat (15)
{
    with (instance_create((x + (random_range(-60, 60))), (y + (random_range(-60, 60))), obj_collecteffect))
        pal_index = irandom_range(1, sprite_get_width(spr_candy_pal))
}
instance_destroy()
