image_xscale = obj_player.xscale
if (obj_player.state == states.climbwall && obj_player.wallspeed < 12)
    instance_destroy()
x = obj_player.x - 16 * obj_player.xscale
y = obj_player.y - 32
if global.realsigma
    y = obj_player.y
depth = obj_player.depth - 6
if (obj_player.state != states.climbwall)
    instance_destroy()
