image_speed = 0.35
plushbuffer = 0
ini_open("saveData_2.ini")
prevpal = ini_read_real("Game", "pal", 1)
ini_close()
ini_open("optionData.ini")
plushcount = ini_read_real("Game", "plushcount", 0)
ini_close()
drawcount = 0
countalpha = 0
countscale = 1
notsavedcount = 0
countshake = 0
