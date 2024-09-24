if (!fadein)
{
    fadealpha = approach(fadealpha, 1, 0.1)
    if (fadealpha >= 1)
    {
        fadein = true
        start = true
        music = false
        if (global.levelname == "steamy" || global.levelname == "mines")
            alarm[0] = 320
        else
            alarm[0] = 240
    }
}
else
{
    fadealpha = approach(fadealpha, 0, 0.1)
    if (fadealpha <= 0 && (!music) && title_music != -4)
    {
        music = true
        title_music = scr_sound(title_music)
    }
}
titlecardy = lerp(titlecardy, 0, 0.125)
titlecardtitley = lerp(titlecardtitley, 0, 0.075)
titlecardtitlex = lerp(titlecardtitlex, 0, 0.075)
titlecardx = lerp(titlecardtitlex, 0, 0.15)
