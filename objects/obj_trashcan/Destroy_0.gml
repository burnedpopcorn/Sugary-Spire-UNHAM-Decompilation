if (ds_list_find_index(global.saveroom, id) == -1)
{
    var _spr = spr_trashcanbreak
    switch sprite_index
    {
        case spr_trashcan:
            _spr = spr_trashcanbreak
            scr_sound(sound_trashcanbreak)
            with (instance_create(x, y, obj_trashcandebris))
            {
                hsp = other.hsparray[1]
                vsp = other.vsparray[1]
                sprite_index = _spr
                image_index = 1
                image_xscale = sign(other.hsparray[1])
                bomb = other.bomb
            }
            instance_create(x, y, obj_bangeffect)
            break
        case spr_crunchybarrier:
            _spr = spr_crunchybarrierbreak
            scr_sound(sound_trashcanbreak)
            instance_create(x, y, obj_bangeffect)
            with (instance_create(x, y, obj_trashcandebris))
            {
                hsp = (-other.hsparray[1])
                vsp = other.vsparray[1]
                sprite_index = _spr
                image_index = 1
                image_xscale = sign(other.hsparray[1])
                bomb = other.bomb
            }
            break
        case spr_cone:
            _spr = spr_conebreak
            scr_sound(sound_conebreak)
            break
        case spr_bombbarrel:
            _spr = spr_bombbarrelbreak
            scr_sound(sound_trashcanbreak)
            instance_create(x, y, obj_bangeffect)
            break
        case spr_barrelflame:
            _spr = spr_barrelflamedebris
            scr_sound(sound_trashcanbreak)
            instance_create(x, y, obj_bangeffect)
            break
        case spr_trash:
            _spr = spr_trashbreak
            break
        case spr_box:
        case spr_popcorn:
        case spr_cup:
            _spr = sprite_index
            break
    }

    with (instance_create(x, y, obj_trashcandebris))
    {
        hsp = other.hsparray[0]
        vsp = other.vsparray[0]
        sprite_index = _spr
        if (_spr != other.sprite_index)
            image_xscale = sign(other.hsparray[0])
        bomb = other.bomb
    }
    ds_list_add(global.saveroom, id)
}
