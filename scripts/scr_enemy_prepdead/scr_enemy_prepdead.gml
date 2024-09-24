function scr_enemy_prepdead() //scr_enemy_prepdead
{
    x = hitX + (random_range(-6, 6))
    y = hitY + (random_range(-6, 6))
    hitLag--
    sprite_index = stunfallspr
    if (hitLag <= 0)
    {
        x = hitX
        y = hitY
        var _state = obj_player.state
        if (_state == states.hitenemy)
            _state = obj_player.tauntstoredstate
        if (_state == states.mach2 || _state == states.tumble || (_state == states.machslide && obj_player.sprite_index != spr_playerPZ_machslideboost3fall && obj_player.sprite_index != spr_pizzano_mach3boostfall))
            thrown = false
        else
            thrown = true
        vsp = hitvsp
        hsp = hithsp
        global.hit += 1
        if (other.object_index == obj_pizzaball)
            global.golfhit += 1
        if thrown
            global.combotime = 60
        global.heattime = 60
        alarm[1] = 5
        instance_destroy()
        stunned = 200
        state = states.cheeseball
        if (obj_player.tauntstoredstate != states.punch && obj_player.tauntstoredstate != states.freefall && obj_player.tauntstoredstate != states.superslam)
        {
            var f = 15
            if (obj_player.tauntstoredstate == states.mach3)
                f = 25
            if (abs(hithsp) > abs(hitvsp))
            {
                if (abs(hithsp) < f)
                    hithsp = sign(hithsp) * f
            }
            else if (abs(hitvsp) < f)
                hitvsp = sign(hitvsp) * f
        }
        else
        {
            hithsp = 20 * (-image_xscale)
            hitvsp = -7
            hsp = hithsp
            vsp = hitvsp
            flash = false
            state = states.cheeseball
            thrown = true
        }
        if (_state == states.mach2 || _state == states.tumble)
            stunned *= 5
    }
}

