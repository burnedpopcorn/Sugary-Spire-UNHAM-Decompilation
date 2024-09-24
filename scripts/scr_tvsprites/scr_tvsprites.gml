function scr_tvsprites() //scr_tvsprites
{
    if (obj_player.ischaracter == 2)
    {
        idletvspr = spr_minecarttv_idle
        combotvsprtest = spr_minecarttv_idle
        happytvspr = spr_minecarttv_idle
        escapetvspr = spr_pizzytv_escape1new
        tvchange1 = spr_minecarttv_idle
        tvchange2 = spr_minecarttv_idle
        cottontvspr = spr_minecarttv_idle
        hurttvspr = spr_minecarttv_idle
        hurttvspr2 = spr_minecarttv_idle
        minecarttvspr = spr_minecarttv_idle
        bombtvspr = spr_pizzytv_bomb
        firetvspr = spr_minecarttv_idle
        angrytvspr = spr_minecarttv_idle
        orbtvspr = spr_minecarttv_idle
        mach1tvspr = spr_minecarttv_idle
        mach2tvspr = spr_minecarttv_idle
        mach3tvspr = spr_minecarttv_idle
        mach4tvspr = spr_minecarttv_idle
        machrolltvspr = spr_minecarttv_idle
        panictvspr = spr_minecarttv_idle
        secrettvspr = spr_minecarttv_idle
        crashtvspr = spr_minecarttv_idle
        puddletvspr = spr_minecarttv_idle
        spookeytvspr = spr_minecarttv_idle
        confectitv1 = spr_pizzytv_confecti1
        confectitv2 = spr_pizzytv_confecti2
        confectitv3 = spr_pizzytv_confecti3
        confectitv4 = spr_pizzytv_confecti4
        confectitv5 = spr_pizzytv_confecti5
    }
    else if (obj_player.ischaracter == 1)
    {
        idletvspr = spr_pizzytv_chuck
        combotvsprtest = spr_pizzytv_chuck
        happytvspr = spr_pizzytv_chuck
        escapetvspr = spr_pizzytv_escape1new
        tvchange1 = spr_pizzytv_chuck
        tvchange2 = spr_pizzytv_chuck
        cottontvspr = spr_pizzytv_chuck
        hurttvspr = spr_pizzytv_chuck
        hurttvspr2 = spr_pizzytv_chuck
        minecarttvspr = spr_pizzytv_chuck
        bombtvspr = spr_pizzytv_bomb
        firetvspr = spr_pizzytv_chuck
        angrytvspr = spr_pizzytv_chuck
        orbtvspr = spr_pizzytv_chuck
        mach1tvspr = spr_pizzytv_chuck
        mach2tvspr = spr_pizzytv_chuck
        mach3tvspr = spr_pizzytv_chuck
        mach4tvspr = spr_pizzytv_chuck
        machrolltvspr = spr_pizzytv_chuck
        panictvspr = spr_pizzytv_chuck
        secrettvspr = spr_pizzytv_chuck
        crashtvspr = spr_pizzytv_chuck
        puddletvspr = spr_pizzytv_chuck
        spookeytvspr = spr_pizzytv_chuck
        confectitv1 = spr_pizzytv_confecti1
        confectitv2 = spr_pizzytv_confecti2
        confectitv3 = spr_pizzytv_confecti3
        confectitv4 = spr_pizzytv_confecti4
        confectitv5 = spr_pizzytv_confecti5
    }
    else if (obj_player.character == "P")
    {
        idletvspr = spr_pizzytv_idle
        combotvsprtest = spr_pizzytv_combonew
        happytvspr = spr_pizzytv_exprcollect
        escapetvspr = spr_pizzytv_escape1new
        tvchange1 = spr_pizzytv_idleanim1
        tvchange2 = spr_pizzytv_idleanim2
        cottontvspr = spr_pizzytvcotton
        hurttvspr = spr_pizzytv_exprhurt
        hurttvspr2 = spr_pizzytv_exprhurt1
        minecarttvspr = spr_pizzytvmine
        bombtvspr = spr_pizzytv_bomb
        firetvspr = spr_pizzytv_fireass
        angrytvspr = spr_pizzytv_exprheatnew
        orbtvspr = spr_pizzytv_croakednew
        mach1tvspr = spr_pizzytv_exprmach1
        mach2tvspr = spr_pizzytv_mach2
        mach3tvspr = spr_pizzytv_mach3
        mach4tvspr = spr_pizzytv_mach4
        machrolltvspr = spr_pizzytvmachroll
        panictvspr = spr_pizzytv_exprpanic
        secrettvspr = spr_pizzytv_secret
        crashtvspr = spr_pizzytv_ouchiecrash
        puddletvspr = spr_pizzytv_puddle
        spookeytvspr = spr_pizzytv_spookey
        confectitv1 = spr_pizzytv_confecti1
        confectitv2 = spr_pizzytv_confecti2
        confectitv3 = spr_pizzytv_confecti3
        confectitv4 = spr_pizzytv_confecti4
        confectitv5 = spr_pizzytv_confecti5
    }
    else if (obj_player.character == "N")
    {
        idletvspr = spr_pizzanotv
        combotvsprtest = spr_pizzanotv_combo
        happytvspr = spr_pizzanotv_happy
        escapetvspr = spr_pizzytv_escape1new
        tvchange1 = spr_pizzanotv2
        tvchange2 = spr_pizzanotv3
        cottontvspr = spr_pizzanotv_cotton
        hurttvspr = spr_pizzanotv_exprhurt
        hurttvspr2 = spr_pizzanotv_exprhurt1
        minecarttvspr = spr_pizzanotv_mine
        bombtvspr = spr_pizzytv_bomb
        firetvspr = spr_pizzanotv_fireass
        angrytvspr = spr_pizzanotv_combo
        orbtvspr = spr_pizzanotv_croaked
        mach1tvspr = spr_pizzanotv_mach
        mach2tvspr = spr_pizzanotv_mach
        mach3tvspr = spr_pizzanotv_mach3
        mach4tvspr = spr_pizzanotv_mach4
        machrolltvspr = spr_pizzanotv_mach
        panictvspr = spr_pizzanotv_exprpanic
        secrettvspr = spr_pizzanotv_secret
        crashtvspr = spr_pizzanotv
        puddletvspr = spr_pizzanotv_puddletv
        spookeytvspr = spr_pizzanotv_spookey
        confectitv1 = spr_pizzanotv_confecti1
        confectitv2 = spr_pizzanotv_confecti2
        confectitv3 = spr_pizzanotv_confecti3
        confectitv4 = spr_pizzanotv_confecti4
        confectitv5 = spr_pizzanotv_confecti5
    }
}

