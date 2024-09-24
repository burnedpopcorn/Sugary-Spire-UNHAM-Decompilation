var _obj = obj_player
if (room == scootercutsceneidk)
    _obj = obj_scootercutscene
x = lerp(_obj.x, x, 0.25)
y = _obj.y + sprite_get_bbox_top(_obj.sprite_index) + (wave(5, -5, 1, 0)) - 80
if (_obj == obj_scootercutscene)
    image_xscale = _obj.image_xscale * _obj.scale_xs
else
    image_xscale = _obj.xscale * _obj.scale_xs
image_yscale = _obj.yscale * _obj.scale_ys
visible = _obj.visible
