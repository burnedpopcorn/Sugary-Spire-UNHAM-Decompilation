if (obj_player.state != states.freefall && obj_player.state != states.actor)
    instance_destroy()
x = obj_player.x
y = obj_player.y + plusy
depth = obj_player.depth - 6
