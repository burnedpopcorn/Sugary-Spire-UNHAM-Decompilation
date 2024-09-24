scr_getinput()
if (floor(image_index) == (image_number - 1))
    image_speed = 0
if (obj_player.character == "N")
{
    if (global.rank == "p")
        sprite_index = spr_pizzano_rankp
    if (global.rank == "s")
        sprite_index = spr_pizzano_rankS
    if (global.rank == "a")
        sprite_index = spr_pizzano_rankA
    if (global.rank == "b")
        sprite_index = spr_pizzano_rankB
    if (global.rank == "c")
        sprite_index = spr_pizzano_rankC
    if (global.rank == "d")
        sprite_index = spr_pizzano_rankD
}
else
{
    if (global.rank == "p")
        sprite_index = spr_rankP
    if (global.rank == "s")
        sprite_index = spr_rankS
    if (global.rank == "a")
        sprite_index = spr_rankA
    if (global.rank == "b")
        sprite_index = spr_rankB
    if (global.rank == "c")
        sprite_index = spr_rankC
    if (global.rank == "d")
        sprite_index = spr_rankD
}
bgspeed--
if (waitbuffer != 0)
    waitbuffer--
if (waitflashbuffer != 0)
    waitflashbuffer--
if (waitbuffer == 0)
{
    if (bgwaitalpha != 1)
        bgwaitalpha += 0.1
}
if (waitflashbuffer == 0 && (!showlastcolor))
{
    flashalpha = 1
    waitflashbuffer = 1000
}
switch global.rank
{
    case "p":
        freezecol = 
        {
            dark: [0.5254901960784314, 0.1568627450980392, 0.25882352941176473],
            light: [0.7372549019607844, 0.4235294117647059, 0.5607843137254902]
        }

        break
    case "s":
        freezecol = 
        {
            dark: [0.5607843137254902, 0.3254901960784314, 0],
            light: [0.7137254901960784, 0.4549019607843137, 0.09803921568627451]
        }

        break
    case "a":
        freezecol = 
        {
            dark: [0.38823529411764707, 0.16862745098039217, 0.11372549019607843],
            light: [0.6980392156862745, 0.3058823529411765, 0.3058823529411765]
        }

        break
    case "b":
        freezecol = 
        {
            dark: [0.2, 0.37254901960784315, 0.7686274509803922],
            light: [0.4745098039215686, 0.6235294117647059, 0.8666666666666667]
        }

        break
    case "c":
        freezecol = 
        {
            dark: [0.2627450980392157, 0.47843137254901963, 0.10980392156862745],
            light: [0.403921568627451, 0.7450980392156863, 0.32941176470588235]
        }

        break
    case "d":
        freezecol = 
        {
            dark: [0.32941176470588235, 0.3411764705882353, 0.38823529411764707],
            light: [0.42745098039215684, 0.4745098039215686, 0.5254901960784314]
        }

        break
}

if (global.rank == "p")
    target_x = 200
if (showlastcolor && key_jump)
{
    checklistfreeze = true
    scr_hatScript()
    scr_playerreset()
    ini_open(global.charsave)
    ini_write_real("Game", "pal", obj_player.paletteselect)
    if instance_exists(obj_playerhat)
        ini_write_real("Game", "hat", obj_playerhat.image_index)
    ini_close()
    with (obj_player)
    {
        targetDoor = "A"
        targetRoom = hub_new
        backtohub = 1
        x = hubx
        y = huby
        state = states.comingoutdoor
        image_index = 0
        global.levelname = -4
    }
    audio_stop_all()
    instance_create(x, y, obj_fadeout)
}
