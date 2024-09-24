function scr_instakill() //scr_instakill
{
    if (other.baddieID.state == states.meteorpep)
        return;
    var hx = other.baddieID.x
    var hy = other.baddieID.y
    if (state == states.mach3 && sprite_index != spr_playerPZ_Sjumpcancel && sprite_index != spr_playerPZ_mach3hit && character == "P")
    {
        sprite_index = spr_playerPZ_mach3hit
        image_index = 0
    }
    suplexmove = 1
    scr_sound(sound_punch)
    if (!other.baddieID.important)
    {
        global.combotime = 60
        global.hit++
    }
    if ((!grounded) && state != states.freefall && state != states.Sjump && (sprite_index != spr_dive || character == "N") && (key_jump2 || input_buffer_jump < 8))
    {
        suplexmove = 0
        vsp = -11
    }
    if (state != states.hitenemy)
    {
        tauntstoredmovespeed = movespeed
        tauntstoredsprite = sprite_index
        tauntstoredstate = state
        tauntstoredvsp = vsp
    }
    other.baddieID.hitLag = 5
    other.baddieID.hitX = hx
    other.baddieID.hitY = hy
    if (global.hitstun == 1)
        hitLag = 5
    hitX = x
    hitY = y
    other.baddieID.alarm[3] = 3
    other.baddieID.state = states.meteorpep
    other.baddieID.image_xscale = (-xscale)
    repeat (3)
    {
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
    }
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = 3 / room_speed
    }
    other.baddieID.hithsp = xscale * (movespeed + 2)
    if (abs(other.baddieID.hithsp) < 10)
        other.baddieID.hithsp = xscale * 10
    other.baddieID.hitvsp = -5
    state = states.hitenemy
    if instance_exists(obj_coneball)
        hitstunconeballspeed = obj_coneball.maxspeed
    if global.panic
    {
        hitstunminutes = global.minutes
        hitstunseconds = global.seconds
    }
}

