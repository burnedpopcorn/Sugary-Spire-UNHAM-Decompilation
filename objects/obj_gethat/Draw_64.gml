if (y_buffer > 0)
    y_buffer--
else
    y_buffer = 6
var _y = 0
if (y_buffer <= 3)
    _y = 1
draw_sprite(bgspr, 0, x, (y - 80 + _y))
draw_sprite(hatspr, hatindex, (x + 7), (y - 104 + _y))
