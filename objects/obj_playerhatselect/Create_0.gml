scr_hatScript()
alarm[0] = 100
fadeout = false
depth = -1
var i = 0
ini_open("optionData.ini")
HatIndex[i++] = true
HatIndex[i++] = ini_read_real("HatsUnlock", "Entryway", false)
HatIndex[i++] = ini_read_real("HatsUnlock", "Cottontown", false)
HatIndex[i++] = ini_read_real("HatsUnlock", "Molasses", false)
HatIndex[i++] = ini_read_real("HatsUnlock", "Mines", false)
HatIndex[i++] = ini_read_real("HatsUnlock", "World1", false)
ini_close()
arrayEnd = i
Selection = obj_playerhat.image_index