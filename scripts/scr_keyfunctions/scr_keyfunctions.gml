function key_get(argument0) //key_get
{
    switch argument0
    {
        case 65:
            argument0 = 0
            break
        case 66:
            argument0 = 1
            break
        case 67:
            argument0 = 2
            break
        case 68:
            argument0 = 3
            break
        case 69:
            argument0 = 4
            break
        case 70:
            argument0 = 5
            break
        case 71:
            argument0 = 6
            break
        case 72:
            argument0 = 7
            break
        case 73:
            argument0 = 8
            break
        case 74:
            argument0 = 9
            break
        case 75:
            argument0 = 10
            break
        case 76:
            argument0 = 11
            break
        case 77:
            argument0 = 12
            break
        case 78:
            argument0 = 13
            break
        case 79:
            argument0 = 14
            break
        case 80:
            argument0 = 15
            break
        case 81:
            argument0 = 16
            break
        case 82:
            argument0 = 17
            break
        case 83:
            argument0 = 18
            break
        case 84:
            argument0 = 19
            break
        case 85:
            argument0 = 20
            break
        case 86:
            argument0 = 21
            break
        case 87:
            argument0 = 22
            break
        case 88:
            argument0 = 23
            break
        case 89:
            argument0 = 24
            break
        case 90:
            argument0 = 25
            break
        case 33:
            argument0 = 26
            break
        case 46:
            argument0 = 27
            break
        case 58:
            argument0 = 28
            break
        case 48:
        case 96:
            argument0 = 29
            break
        case 49:
        case 97:
            argument0 = 30
            break
        case 50:
        case 98:
            argument0 = 31
            break
        case 51:
        case 99:
            argument0 = 32
            break
        case 52:
        case 100:
            argument0 = 33
            break
        case 53:
        case 101:
            argument0 = 34
            break
        case 54:
        case 102:
            argument0 = 35
            break
        case 55:
        case 103:
            argument0 = 36
            break
        case 56:
        case 104:
            argument0 = 37
            break
        case 57:
        case 105:
            argument0 = 38
            break
        case 16:
        case 161:
        case 160:
            argument0 = 0
            break
        case 17:
        case 163:
        case 162:
            argument0 = 1
            break
        case 32:
            argument0 = 2
            break
        case 38:
            argument0 = 3
            break
        case 40:
            argument0 = 4
            break
        case 39:
            argument0 = 5
            break
        case 37:
            argument0 = 6
            break
        case 27:
            argument0 = 7
            break
    }

    return argument0;
}

function keysprite_get(argument0) //keysprite_get
{
    var _sprite = spr_keyfont
    switch argument0
    {
        case 16:
        case 161:
        case 160:
        case 17:
        case 163:
        case 162:
        case 32:
        case 38:
        case 40:
        case 39:
        case 37:
        case 27:
            _sprite = spr_keyspecial
            break
    }

    return _sprite;
}

