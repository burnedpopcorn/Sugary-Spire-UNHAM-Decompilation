var _temp_local_var_4;
function scr_collide_player() //scr_collide_player
{
    if (state == states.backtohub || state == states.bossintro || state == states.noclip || state == states.hitenemy)
        return;
    grounded = false
    grinding = false
    var _temp_local_var_4 = abs(vsp)
    if (abs(vsp) <= 0)
    {
    }
    else
    {
        while (true)
        {
            if ((!(scr_solid_player(x, (y + sign(vsp))))) || (scr_solid_player(x, y) && (!(place_meeting(x, y, obj_destructibles))) && (!(place_meeting(x, y, obj_minecartRail))) && vsp < 0))
            {
                y += sign(vsp)
                var _temp_local_var_4 = (abs(vsp) - 1)
                if (abs(vsp) - 1)
                    continue
                break
            }
            else
                vsp = 0
        }
    }
    var _temp_local_var_4 = abs(hsp)
    if (abs(hsp) <= 0)
    {
    }
    else
    {
        while (true)
        {
            var MaxIncline = 3
            var i = MaxIncline
            if (i > 0)
            {
                var _check = true
                var _z = i - 1
                repeat (i - 1)
                {
                    if (!(scr_solid_player((x + sign(hsp)), (y - _z))))
                        _check = false
                    _z--
                }
                if (scr_solid_player((x + sign(hsp)), y) && _check && (!(scr_solid_player((x + sign(hsp)), (y - i)))))
                    y -= i
                else
                {
                    i--
                    while (i > 0)
                    {
                        var _check = true
                        var _z = i - 1
                        repeat (i - 1)
                        {
                            if (!(scr_solid_player((x + sign(hsp)), (y - _z))))
                                _check = false
                            _z--
                        }
                        if (scr_solid_player((x + sign(hsp)), y) && _check && (!(scr_solid_player((x + sign(hsp)), (y - i)))))
                        {
                            y -= i
                            break
                        }
                        else
                        {
                            i--
                            continue
                        }
                    }
                }
            }
            var MaxDecline = 3
            i = 1
            if (i < (MaxDecline + 1))
            {
                _check = true
                _z = 1
                repeat i
                {
                    if scr_solid_player((x + sign(hsp)), (y + _z))
                        _check = false
                    _z++
                }
                if ((!(scr_solid_player((x + sign(hsp)), y))) && _check && scr_solid_player((x + sign(hsp)), (y + (i + 1))))
                    y += i
                else
                {
                    i++
                    while (i < (MaxDecline + 1))
                    {
                        _check = true
                        _z = 1
                        repeat i
                        {
                            if scr_solid_player((x + sign(hsp)), (y + _z))
                                _check = false
                            _z++
                        }
                        if ((!(scr_solid_player((x + sign(hsp)), y))) && _check && scr_solid_player((x + sign(hsp)), (y + (i + 1))))
                        {
                            y += i
                            break
                        }
                        else
                        {
                            i++
                            continue
                        }
                    }
                }
            }
            if (!(scr_solid_player((x + sign(hsp)), y)))
            {
                x += sign(hsp)
                var _temp_local_var_4 = (abs(hsp) - 1)
                if (abs(hsp) - 1)
                    continue
                break
            }
            else
                hsp = 0
        }
    }
    if (vsp < 20)
        vsp += grav
    grounded = scr_solid_player(x, (y + 1))
}

