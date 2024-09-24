if (active && ds_list_find_index(global.saveroom, id) == -1)
{
    if (sprite_index != spr_secretportal_close)
    {
        sprite_index = spr_secretportal_close
        image_index = 0
        scr_sound(sfx_secretenternew)
    }
    if (!touched)
    {
        with (obj_camera)
            lock = true
    }
    global.combofreeze = 30
    playerid = other.id
    other.x = x
    other.y = y - 30
    other.vsp = 0
    other.hsp = 0
    other.cutscene = true
    if (!touched)
    {
        other.secretstoredstate = other.state
        other.secretstoredmovespeed = other.movespeed
        other.secretstoredhsp = other.hsp
        other.secretstoredvsp = other.vsp
        other.secretstoredsprite = other.sprite_index
        other.state = states.secretportal
        other.hsp = 0
        other.vsp = 0
        other.image_speed = 0.35
        if (other.secretstoredstate != states.cotton && other.secretstoredstate != states.cottondrill && other.secretstoredstate != states.cottondrill)
            other.sprite_index = other.spr_hurt
        else
            other.sprite_index = other.spr_cottonfall
    }
    touched = true
}
