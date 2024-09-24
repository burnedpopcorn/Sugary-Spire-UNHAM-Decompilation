var _obj = obj_player
if (room == scootercutsceneidk)
    _obj = obj_scootercutscene
x = _obj.x
y = _obj.y + sprite_get_bbox_top(_obj.sprite_index) + (wave(5, -5, 1, 0)) - 80
