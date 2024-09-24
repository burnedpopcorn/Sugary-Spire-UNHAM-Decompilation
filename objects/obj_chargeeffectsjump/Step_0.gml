image_xscale = obj_player.xscale
if (obj_player.state == states.Sjump && (obj_player.sprite_index == spr_playerPZ_Sjumpcancelstart || obj_player.sprite_index == spr_playerPZ_Sjumpcancel))
    instance_destroy()
x = obj_player.x
y = obj_player.y - 32
if global.realsigma
    y = obj_player.y
depth = obj_player.depth - 6
if (obj_player.state != states.Sjump)
    instance_destroy()
