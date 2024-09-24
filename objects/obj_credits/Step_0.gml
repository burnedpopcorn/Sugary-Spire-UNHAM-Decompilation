draw_set_font(global.creditsfontnew)
if (y <= ((-string_height(creditsText)) + 540))
    can_goUp = false
if (obj_player.key_jump2 && (!instance_exists(obj_fadeout)))
{
    scr_playerreset()
    obj_player.targetDoor = "A"
    obj_player.targetRoom = hub_new
    audio_stop_all()
    instance_create(x, y, obj_fadeout)
}
if can_goUp
    vspeed = lerp(vspeed, -0.525, 0.1)
else
    vspeed = lerp(vspeed, 0, 0.2)
