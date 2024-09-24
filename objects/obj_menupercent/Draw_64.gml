if instance_exists(obj_pizzanounlocked)
    return;
draw_set_font(global.percentfont)
draw_set_halign(fa_center)
ini_open(global.charsave)
var _percent = ini_read_real("Game", "percent", 0)
ini_close()
drawperc = lerp(drawperc, _percent, 0.2)
var _draw = string(drawperc)
if (drawperc >= 100)
    _draw = string_delete(string(drawperc), 4, 3)
else if (drawperc >= 10)
    _draw = string_delete(string(drawperc), 3, 3)
else
    _draw = string_delete(string(drawperc), 2, 3)
if (rizzshake > 0)
    rizzshake--
else
    shake = 0
if (rizzshake > 0 && shake < 3)
    shake = 2
if (global.charsave == "saveData_test.ini")
{
    shake = 2
    rizzshake = 10
    _draw = string(irandom_range(0, 102))
}
draw_text((480 + (random_range(((-shake) + shake / 2), (shake - shake / 2)))), (160 + (random_range((-shake), shake))), (_draw + "%"))
if (_percent >= 101)
    rizzindex = 8
else if (_percent > 87.5)
    rizzindex = 7
else if (_percent > 75)
    rizzindex = 6
else if (_percent > 62.5)
    rizzindex = 5
else if (_percent > 50)
    rizzindex = 4
else if (_percent > 37.5)
    rizzindex = 3
else if (_percent > 25)
    rizzindex = 2
else if (_percent > 12.5)
    rizzindex = 1
else
    rizzindex = 0
if (global.charsave == "saveData_test.ini")
    rizzindex = random_range(0, 8)
draw_sprite(spr_harryrizz, rizzindex, (290 + (random_range((-shake), shake))), (80 + (random_range((-shake), shake))))
