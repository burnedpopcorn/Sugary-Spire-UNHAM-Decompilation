function scr_player_Sjumpland() //scr_player_Sjumpland
{
    mach2 = 0
    jumpAnim = true
    dashAnim = true
    landAnim = false
    machslideAnim = true
    moveAnim = true
    stopAnim = true
    crouchslideAnim = true
    crouchAnim = false
    machhitAnim = false
    movespeed = 0
    start_running = true
    alarm[4] = 14
    vsp = 0
    hsp = 0
    if (animation_end() && sprite_index != spr_playerPZ_Sjumpcancelstart)
    {
        if (character == "N")
            sprite_index = spr_pizzano_djump
        else
            sprite_index = spr_player_machfreefall
        state = states.jump
        jumpAnim = false
    }
    if (sprite_index == spr_playerPZ_Sjumpcancelstart)
    {
        vsp = 0
        if (move != 0)
            xscale = move
        if (floor(image_index) == (image_number - 1))
        {
            movespeed = 12
            machhitAnim = 0
            state = states.mach3
            flash = 1
            vsp = -5
            image_index = 0
            sprite_index = spr_playerPZ_Sjumpcancel
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale
        }
    }
}

