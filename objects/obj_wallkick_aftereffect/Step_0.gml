if (playerid.state != states.jump && playerid.sprite_index != spr_playerPZ_scooterspinstart && playerid.sprite_index != spr_playerPZ_scooterspin)
    vanish = true
if vanish
{
    if (gonealpha > 0)
        gonealpha -= 0.15
    else if (gonealpha <= 0)
        instance_destroy()
}
visible = playerid.visible
with (realcol)
{
    switch other.color
    {
        case 1:
            r = 127
            g = 0
            b = 169
            break
    }

}
