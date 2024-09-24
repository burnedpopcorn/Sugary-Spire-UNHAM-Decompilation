if hurtself
    return;
obj_player.state = states.cotton
instance_destroy()
instance_create(obj_player.x, obj_player.y, obj_poofeffectcotton)
obj_player.sprite_index = obj_player.spr_cottonidle
global.combofreeze = 30
scr_tip("cotton")
