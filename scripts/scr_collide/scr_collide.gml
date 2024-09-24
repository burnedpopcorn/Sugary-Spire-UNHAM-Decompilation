var _temp_local_var_3;
function scr_collide() //scr_collide
{
    grounded = false
    slopeMax = 2
    var _temp_local_var_3 = abs(vsp)
    if (abs(vsp) <= 0)
    {
    }
    else
    {
        while (true)
        {
            if (!(scr_solid(x, (y + sign(vsp)))))
            {
                y += sign(vsp)
                var _temp_local_var_3 = (abs(vsp) - 1)
                if (abs(vsp) - 1)
                    continue
                break
            }
            else
                vsp = 0
        }
    }
    var _temp_local_var_3 = abs(hsp)
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
                    if (!(scr_solid((x + sign(hsp)), (y - _z))))
                        _check = false
                    _z--
                }
                if (scr_solid((x + sign(hsp)), y) && _check && (!(scr_solid((x + sign(hsp)), (y - i)))))
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
                            if (!(scr_solid((x + sign(hsp)), (y - _z))))
                                _check = false
                            _z--
                        }
                        if (scr_solid((x + sign(hsp)), y) && _check && (!(scr_solid((x + sign(hsp)), (y - i)))))
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
                    if scr_solid((x + sign(hsp)), (y + _z))
                        _check = false
                    _z++
                }
                if ((!(scr_solid((x + sign(hsp)), y))) && _check && scr_solid((x + sign(hsp)), (y + (i + 1))))
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
                            if scr_solid((x + sign(hsp)), (y + _z))
                                _check = false
                            _z++
                        }
                        if ((!(scr_solid((x + sign(hsp)), y))) && _check && scr_solid((x + sign(hsp)), (y + (i + 1))))
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
            if (!(scr_solid((x + sign(hsp)), y)))
            {
                x += sign(hsp)
                var _temp_local_var_3 = (abs(hsp) - 1)
                if (abs(hsp) - 1)
                    continue
                break
            }
            else
                hsp = 0
        }
    }
    if (vsp < 10)
        vsp += grav
    grounded = scr_solid(x, (y + 1))
}

