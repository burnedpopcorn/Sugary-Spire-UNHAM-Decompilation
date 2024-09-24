if (room == scootercutsceneidk || room == rm_verify || room == palroom || room == spireintro)
    return;
scr_getinput()
global.gamepaused = 1
if ((!pause) && (!instance_exists(obj_fadeout)) && (!instance_exists(obj_titlecard)) && (!instance_exists(obj_technicaldifficulty)) && (!instance_exists(obj_layoutselect)))
{
    if ((!global.shellactivate) && key_start2 && room != rank_room && room != realtitlescreen && canmove)
    {
        selected = 0
        if (!instance_exists(obj_pausefadeout))
            instance_create(x, y, obj_pausefadeout)
        scr_delete_pause_image()
        scr_create_pause_image()
    }
}
if (instance_exists(obj_pausefadeout) && instance_exists(obj_fadeout))
    instance_destroy(obj_pausefadeout)
if pause
{
    if canmove
    {
        self.sigmaunlock()
        scr_getinput()
        if (key_down2 && selected < 3)
        {
            selected += 1
            scr_sound(sound_land)
        }
        else if key_down2
        {
            selected = 0
            scr_sound(sound_land)
        }
        if (key_up2 && selected > 0)
        {
            selected -= 1
            scr_sound(sound_land)
        }
        else if key_up2
        {
            selected = 3
            scr_sound(sound_land)
        }
        if key_jump
        {
            switch selected
            {
                case 0:
                    if (!instance_exists(obj_pausefadeout))
                        instance_create(x, y, obj_pausefadeout)
                    break
                case 1:
                    event_user(1)
                    break
                case 2:
                    event_user(2)
                    break
                case 3:
                    event_user(3)
                    break
            }

        }
        if ((key_slap2 || (keyboard_check_pressed(vk_escape) && escape_buffer <= 0)) && (!instance_exists(obj_pausefadeout)))
            instance_create(x, y, obj_pausefadeout)
    }
}
if (!pause)
    pal = obj_player.paletteselect
if instance_exists(obj_player)
{
    if (obj_player.character == "N")
    {
        if chance(0.001)
            pause_char = spr_pizzano_pauselomka
        else
            pause_char = spr_pizzano_pause
        palette = spr_palp
    }
    else if (obj_player.character == "P")
    {
        pause_char = spr_pizzelle_pause
        palette = spr_pal
    }
}
if (escape_buffer > 0)
    escape_buffer--
if (!scr_roomreset(true))
    canrestart = 0
else
    canrestart = 1
if (!scr_roomreset(false))
    canexit = 0
else
    canexit = 1
