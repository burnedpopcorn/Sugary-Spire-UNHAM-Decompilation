obj_player.image_index = 0
obj_player.image_speed = 0.35
if (obj_player.character == "N")
    obj_player.sprite_index = spr_pizzano_sleepstart
else
    obj_player.sprite_index = spr_player_slipnslidestart
obj_player.state = states.puddle
obj_player.vsp = -11
obj_player.grounded = false
instance_destroy()
