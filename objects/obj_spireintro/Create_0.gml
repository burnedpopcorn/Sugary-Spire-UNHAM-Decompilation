image_speed = 0.35
playerspr = spr_introasset_pizzelle
if (obj_player.character == "N")
    playerspr = spr_introasset_pizzano
volume = 0
alarm[0] = 450
audio_sound_set_track_position(mu_void, 18)
soundbuffer = 150
soundcount = 0
message = ["", ""]
showtext = 0
textalpha = 0
xi = 288
ini_open(global.charsave)
canskip = ini_read_real("Game", "canskipintro", 0)
ini_close()
