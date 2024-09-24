image_xscale = obj_player.xscale
if (obj_player.state == states.machroll && obj_player.sprite_index != spr_playerPZ_backslide && obj_player.sprite_index != spr_playerPZ_backslideland)
    instance_destroy()
x = obj_player.x + 16 * image_xscale
if global.realsigma
    x = obj_player.x * image_xscale
y = obj_player.y
depth = obj_player.depth - 6
if (obj_player.state != states.machroll)
    instance_destroy()
