image_speed = 0.5
alarm[1] = 235
depth = -6
waitbuffer = 0
waitflashbuffer = 232
bgwaitalpha = 0
bgspeed = 0
bgimageindex = 0
flashalpha = 1
showlastcolor = 0
clipboardPos = 500
target_x = 480
confectiindex = 0
secretindex = 0
var _string = string(global.collect)
var _string_length = string_length(_string)
color_array = []
height_array = []
for (var i = 0; i < _string_length; i++)
    color_array[i] = irandom_range(1, sprite_get_width(spr_palcandle))
for (i = 0; i < _string_length; i++)
    height_array[i] = irandom_range(-2, 0)
confectiArray = ["mallow", "choco", "crack", "worm", "candy"]
freezecol = 
{
    dark: [0.36470588235294116, 0.36470588235294116, 0.36470588235294116],
    light: [0.6078431372549019, 0.6078431372549019, 0.6078431372549019]
}

