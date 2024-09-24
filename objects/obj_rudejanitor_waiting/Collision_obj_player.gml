ds_list_add(global.saveroom, id)
if (global.lappingsys == 1 && global.lapcount == 2)
    ds_list_add(global.escaperoom, id)
global.rudejanitor = true
global.combotime = 60
global.combofreeze = 30
scr_sound(sound_toppingot)
instance_create(x, y, obj_rudejanitorfollow)
instance_create(x, y, obj_baddietaunteffect)
instance_destroy()
with (obj_player)
{
}
