global.PAUSEfadeoff = 0
global.minesProgress = false
global.GMLIVE_roomstart = false
global.GMLIVE_realroom = -4
global.cutsceneManager = -4
global.combomode = false
global.font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.0123456789:- ", 1, 0)
global.newfont = font_add_sprite_ext(spr_newfont, "AEFCDJKLMPSYGabcdefghijklmnoprstuvwxyz0123456789.:!?", 1, 0)
global.smallfont = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-", 1, 0)
global.timerfont = font_add_sprite_ext(spr_timerfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-:", 1, 0)
global.panictimerfont = font_add_sprite_ext(spr_panictimer_font, "0123456789:", 1, 0)
global.creditsfont = font_add_sprite_ext(spr_creditsfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", 1, 0)
global.creditsfontnew = font_add_sprite_ext(spr_creditsfontnew, " ABCDEFGHIJKLMNOPQRSTUVWXYZ.!,abcdefghijklmnopqrstuvwxyz0123456789@#$%^&*(){}[]|:;'/`", 1, 0)
global.combofont = font_add_sprite_ext(spr_fontcombo, "0123456789", 1, 0)
global.collectfont = font_add_sprite_ext(spr_fontcollect, "0123456789", 1, 0)
global.lapfont = font_add_sprite_ext(spr_lapfont, "0123456789", 1, 0)
global.percentfont = font_add_sprite_ext(spr_percentfont, "0123456789%", 1, 0)
global.resultsfont = font_add_sprite_ext(spr_rankfont, "0123456789", 1, 0)
global.combofontresults = font_add_sprite_ext(spr_comboresultsfont, "0123456789", 1, -10)
global.clipboardtimefont = font_add_sprite_ext(spr_clipboardtimefont, "0123456789:;.", 1, 0)
global.shellactivate = false
global.showcollisions = false
global.debugmode = false
global.fartcounter = 0
global.parallaxbg_surface = -4
global.ParallaxMap = ds_map_create()
scr_default_parallax(true)
global.FollowerList = ds_list_create()
global.mallowfollow = false
global.crackfollow = false
global.chocofollow = false
global.wormfollow = false
global.candyfollow = false
global.secretfound = false
global.secretfound1 = false
global.secretfound2 = false
global.secretfound3 = false
global.levelname = -4
global.lapcount = false
global.playtimermiliseconds = 0
global.playtimerseconds = 0
global.playtimerminutes = 0
global.playtimerhour = 0
global.harrymusic = -4
global.gottreasure = 0
global.rudejanitor = 0
global.gamepaused = 0
global.secretroom = 0
global.minutessaved = 0
global.secondssaved = 0
global.wavesaved = 0
global.maxwavesaved = 0
global.panicking = 0
global.last_score = 0
global.last_room = 0
global.last_door = 0
global.last_treasure = 0
global.last_secret = 0
global.last_maxcombo = 0
global.greyscalefade = 0
global.gateclosed = 0
global.maxcombo = 0
global.tauntcount = 0
global.rankreset = 0
global.collectsound = 0
ini_open("optionData.ini")
global.fullscreen = ini_read_real("Settings", "fullscrn", 0)
global.selectedResolution = ini_read_real("Settings", "resolution", 1)
global.smoothcam = ini_read_real("Settings", "smthcam", 1)
global.hitstunEnabled = ini_read_real("Settings", "hitstun", 1)
global.screentilt = ini_read_real("Settings", "scrntilt", 1)
global.playerrotate = ini_read_real("Settings", "playrot", 1)
global.musicVolume = ini_read_real("Settings", "musicvol", 1)
global.soundVolume = ini_read_real("Settings", "soundvol", 1)
global.masterVolume = ini_read_real("Settings", "mastervol", 1)
global.entrancetheme = ini_read_real("Settings", "enttheme", 0)
global.lappingsys = ini_read_real("Settings", "lapping", 0)
global.heatmeter = ini_read_real("Settings", "heatmeter", 1)
global.lvldesign = ini_read_real("Settings", "lvldesign", 0)
global.hitstun = ini_read_real("Settings", "hitstun", 1)
global.darkmines = ini_read_real("Settings", "darkmines", 0)
global.timer = ini_read_real("Settings", "timer", 1)
global.timertype = ini_read_real("Settings", "timertype", 0)
global.showhud = ini_read_real("Settings", "showhud", 1)
ini_close()
audio_master_gain(global.masterVolume)
global.targetCamX = 0
global.targetCamY = 0
global.savefile = 1
global.charsave = "saveData.ini"
global.sigma = false
global.realsigma = false
global.shake_in_options = 1
global.sigmasprite = -4
global.layout = 0
global.savetimermiliseconds = 0
global.savetimerseconds = 0
global.savetimerminutes = 0
global.savetimerhour = 0
switch global.selectedResolution
{
    case 0:
        window_set_size(480, 260)
        break
    case 1:
        window_set_size(960, 540)
        break
    case 2:
        window_set_size(1280, 720)
        break
}

window_set_fullscreen(global.fullscreen)
global.nerfconeball = true
