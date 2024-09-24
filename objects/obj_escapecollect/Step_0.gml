if (collectvanish == true && collectboxid.activated == true)
{
    x = xstart
    y = ystart
    instance_create((x + sprite_width / 2), (y + sprite_height / 2), obj_cloudeffect)
    repeat (3)
        instance_create((x + sprite_width / 2 + (random_range(-5, 5))), (y + sprite_height / 2 + (random_range(-5, 5))), obj_cloudeffect)
    collectvanish = false
    in_the_void = false
}
if (global.collectsound < 10)
    global.collectsound += 1
if (collectvanish == false && global.panic)
{
    if (distance_to_object(obj_player) < 26 && gotowardsPlayer == false)
        gotowardsPlayer = true
}
if global.panic
    image_alpha = 1
if (gotowardsPlayer == true)
{
    move_towards_point(obj_player.x, obj_player.y, movespeed)
    movespeed++
}
