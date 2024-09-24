if ((!instance_exists(playerID)) || playerID.vsp > 2 || (playerID.state != states.uppercut && playerID.tauntstoredstate != states.uppercut))
{
    instance_destroy()
    return;
}
x = playerID.x
y = playerID.y
image_xscale = playerID.xscale
