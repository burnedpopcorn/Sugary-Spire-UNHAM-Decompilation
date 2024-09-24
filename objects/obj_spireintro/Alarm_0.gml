obj_player.targetRoom = outer_room1
obj_player.targetDoor = "C"
obj_player.state = states.bossintro
obj_player.movespeed = 2
obj_player.xscale = 1
if (!instance_exists(obj_fadeout))
    instance_create(x, y, obj_fadeout)
obj_music.voidmusvolume = 1
ini_open(global.charsave)
ini_write_real("Game", "canskipintro", 1)
ini_close()
obj_player.visible = 1
