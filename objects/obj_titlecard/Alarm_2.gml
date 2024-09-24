if (noisehead_pos > (array_length(noisehead) - 1))
    return;
alarm[2] = noisespot_buffermax
var head = noisehead[noisehead_pos++]
head.visible = true
head.visual_scale = 2
trace("Displaying head: ", head)
scr_sound(choose(titlecard1, titlecard2, titlecard3))
