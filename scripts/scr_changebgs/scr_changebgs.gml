function scr_changebgs()
{
    if (!global.panic)
    {
        layer_change_background(bg_waferback1, bg_waferback1NEW);
        layer_change_background(bg_waferback2, bg_waferback2NEW);
        layer_change_background(bg_waferclouds, bg_wafercloudsNEW);
        layer_change_background(bg_wafersun, bg_wafersunNEW);
        layer_change_background(bg_wafersky, bg_waferskyNEW);
        layer_change_background(back, backNEW);
        layer_change_background(cl2, cl2NEW);
        layer_change_background(bgsky2main2, bg_sky2main2NEW);
        layer_change_background(steamybg3, cl2NEW);
        layer_change_background(steamybg4, bg_steamynew3);
        layer_change_background(steamybg5, bg_sky2main2NEW);
        layer_change_background(frontpara, frontparaNEW);
        layer_change_background(bg_clock1, bg_clock1NEW);
        layer_change_background(bg_clockparallax1, bg_clockparallax1NEW);
        layer_change_background(spr_clockparallax2, spr_clockparallax2NEW);
        layer_change_background(spr_molassesbgpara1, bg_molasses_2);
        layer_change_background(spr_molassesbgpara5, spr_molassesbgpara5NEW);
        layer_change_background(bg_mines1, bg_mines1NEW);
        layer_change_background(bg_mines1para1, bg_mines1para1NEW);
        layer_change_background(bg_mines1para2, bg_mines1para2NEW);
        layer_change_background(bg_mines2, bg_mines2NEW);
        layer_change_background(bg_mines2_hills, bg_mines2_hillsNEW);
        layer_change_background(bg_mines3, bg_mines3NEW);
    }
    
    if (global.panic)
    {
        layer_change_background(bg_waferback1, bgwafer_escape2NEW);
        layer_change_background(bg_waferback2, bgwafer_escape1NEW);
        layer_change_background(bg_waferclouds, bg_wafer_escape3NEW);
        layer_change_background(bg_wafersun, bgwafer_escape4NEW);
        layer_change_background(bg_wafersky, bgwafer_escape5NEW);
        layer_change_background(back, sky_esc_backNEW);
        layer_change_background(cl2, sky_esc_screaming_clouds);
        layer_change_background(bgsky2main2, sky_esc_screaming_front_cakes);
        layer_change_background(steamybg3, sky_esc_screaming_clouds);
        layer_change_background(steamybg4, bg_steamynew3_escape);
        layer_change_background(steamybg5, sky_esc_screaming_front_cakes);
        layer_change_background(bg_steamynew3, bg_steamynew3_escape);
        layer_change_background(frontpara, frontparaNEW);
        layer_change_background(bg_clock1, bg_clock1_escapeNEW);
        layer_change_background(bg_clockparallax1, bg_clockparallaxescapeNEW);
        layer_change_background(spr_clockparallax2, spr_clockparallax2_escapeNEW);
        layer_change_background(bg_molasses_4, bg_molasses_4escape);
        layer_change_background(spr_molassesbgpara1, bg_molasses_2escape);
        layer_change_background(spr_molassesbgpara2, bg_molasses_4escape);
        layer_change_background(spr_molassesbgpara3, bg_molasses_1escape);
        layer_change_background(spr_molassesbgpara5, spr_molassesbgpara5escapeNEW);
        layer_change_background(bg_molasses_4, bg_molasses_4escape);
        layer_change_background(bg_molasses_2, bg_molasses_2escape);
        layer_change_background(bg_molasses_1, bg_molasses_1escape);
        layer_change_background(spr_molassesFG, spr_molassesFG_escape);
        layer_change_background(bg_mines1, bg_mines1_escapeNEW);
        layer_change_background(bg_mines1para1, bg_mines1para1_escape);
        layer_change_background(bg_mines1para2, bg_mines1para2_escapeNEW);
        layer_change_background(bg_mines2, bg_mines2_escapeNEW);
        layer_change_background(bg_mines2_hills, bg_mines2_hills_escapeNEW);
        layer_change_background(bg_mines3, bg_mines3_escapeNEW);
    }
    
    layer_change_background(spr_parkparallax1, spr_parkparallax1NEW);
    layer_change_background(spr_molassesForeground, bg_molasses_3);
}
