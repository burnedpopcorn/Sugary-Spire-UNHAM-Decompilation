canmove = true
pause = false
i = 0
color = make_color_rgb(121, 103, 151)
selected = 0
image_speed = 0
shroomdone = 0
cheesedone = 0
tomatodone = 0
sausagedone = 0
pineappledone = 0
depth = -98
draw_screen = 0
pal = 1
pause_char = spr_pizzelle_pause
palette = spr_pal
screensprite = -4
screenscale = 1
escape_buffer = 0
selectindex = [1, 0, 0, 0]
canrestart = 1
canexit = 1
sigmacode = ""
pauseshake = 0
//function anon@455@gml_Object_obj_pause_Create_0() //anon@455@gml_Object_obj_pause_Create_0
function sigmaunlock()
{
    if (!global.sigma)
    {
        switch keyboard_lastkey
        {
            case ord("S"):
                sigmacode += "S"
                break
            case 73:
                sigmacode += "I"
                break
            case 71:
                sigmacode += "G"
                break
            case 77:
                sigmacode += "M"
                break
            case 65:
                sigmacode += "A"
                break
        }

    }
    if (sigmacode != "" && string_copy("SIGMA", 1, string_length(sigmacode)) != sigmacode)
        sigmacode = ""
    if (sigmacode == "SIGMA" && (!global.sigma))
    {
        global.sigma = true
        scr_sound(sfx_secretfound)
        pauseshake = 4
    }
    keyboard_lastkey = -1
}

