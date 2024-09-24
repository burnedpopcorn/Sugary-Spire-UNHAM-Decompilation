scr_getinput()
if instance_exists(obj_pizzanounlocked)
    return;
if abletomove
{
    var _move_h = (-((key_left2 + key_right2)))
    if (_move_h != 0 && obj_file1.sprite_index != spr_file1_pizzanoprep && obj_file2.sprite_index != spr_file2_pizzanoprep && obj_file3.sprite_index != spr_file3_pizzanoprep)
    {
        selected += _move_h
        selected = clamp(selected, 0, 2)
        if (prevselected != selected)
        {
            prevselected = selected
            scr_sound(sound_step)
            global.savefile = selected + 1
            global.charsave = "saveData" + (showpizzano ? "N" : "") + ((selected != 0 || showpizzano) ? ("_" + (string(global.savefile + extrasave))) : "") + ".ini"
            ini_open(global.charsave)
            obj_player.paletteselect = ini_read_real("Game", "pal", 1)
            with (obj_playerhat)
                image_index = ini_read_real("Game", "hat", 0)
            ini_close()
            obj_menupercent.rizzshake = 8
        }
    }
    if (key_jump && (!game_started) && (!instance_exists(obj_pizzano_jumpscare)) && selected == 1 && obj_player.character == "N")
        instance_create(480, 270, obj_pizzano_jumpscare)
    if (key_jump && (!game_started) && obj_file1.sprite_index != spr_file1_pizzanoprep && obj_file2.sprite_index != spr_file2_pizzanoprep && obj_file3.sprite_index != spr_file3_pizzanoprep && (!instance_exists(obj_pizzano_jumpscare)))
    {
        scr_sound(sound_toppingot)
        abletomove = false
        if (obj_player.character == "P")
        {
            obj_file1.image_index = 0
            obj_file1.sprite_index = spr_file1confirm
            obj_file2.image_index = 0
            obj_file2.sprite_index = spr_file2confirm
            obj_file3.image_index = 0
            obj_file3.sprite_index = spr_file3confirm
        }
        else if (obj_player.character == "N")
        {
            if (((obj_file1.sprite_index == spr_file1_pizzano || obj_file3.sprite_index == spr_file3_pizzano) && (!instance_exists(obj_pizzano_jumpscare))) || (instance_exists(obj_pizzano_jumpscare) && obj_pizzano_jumpscare.image_xscale > 14 && obj_pizzano_jumpscare.image_yscale > 14))
            {
                if (!instance_exists(obj_fadeout))
                {
                    obj_player.targetRoom = spireintro
                    obj_player.targetDoor = "A"
                    instance_create(x, y, obj_fadeout)
                }
            }
        }
        game_started = 1
        abletomove = false
    }
    if (key_start2 && (!instance_exists(obj_Options_Main)) && (!game_started))
    {
        abletomove = false
        instance_create(0, 0, obj_Options_Main)
    }
    if (key_taunt2 && (!instance_exists(obj_erasefile)) && (!game_started) && file_exists(global.charsave))
    {
        abletomove = false
        instance_create(0, 0, obj_erasefile)
    }
    if (key_slap2 && (!game_started) && (!instance_exists(obj_closegame)))
    {
        abletomove = false
        instance_create(0, 0, obj_closegame)
    }
}
var justfarded = 0
var _savefile = 1
switch selected
{
    case 0:
        justfarded = 96
        _savefile = 1 + extrasave
        break
    case 1:
        justfarded = 480
        _savefile = 2 + extrasave
        break
    case 2:
        justfarded = 828
        _savefile = 3 + extrasave
        break
}

_message = "SAVE FILE " + string(_savefile)
lightX = lerp(lightX, justfarded, 0.2)
var asset = layer_sprite_get_id(layer_get_id("Assets_1"), "graphic_5C74AFEA")
var assethand = layer_sprite_get_id(layer_get_id("Assets_1"), "graphic_BC43037")
if (!showpizzano)
    layer_sprite_index(asset, selected)
layer_sprite_index(assethand, selected)
if showtext
    yi = approach(yi, 490, 5)
xi = 480 + (random_range(1, -1))
if (pizzano_unlocked && obj_file1.sprite_index != spr_file1confirm && (!instance_exists(obj_Options_Main)) && (!instance_exists(obj_erasefile)) && (!instance_exists(obj_sausageman_deadtitle)) && abletomove && (!game_started) && obj_file1.sprite_index != spr_file1_pizzanoprep && obj_file2.sprite_index != spr_file2_pizzanoprep && obj_file3.sprite_index != spr_file3_pizzanoprep)
{
    var _move_v = key_down2 - key_up2
    if (_move_v != 0)
    {
        char_select += _move_v
        char_select = clamp(char_select, 1, 2)
        switch char_select
        {
            case 1:
                obj_player.character = "P"
                charicon = spr_pizzelle_switch
                showpizzano = 0
                break
            case 2:
                obj_player.character = "N"
                charicon = spr_pizzano_switch
                showpizzano = 1
                break
        }

        if (prevcharselect != char_select)
        {
            prevcharselect = char_select
            if showpizzano
            {
                obj_file1.image_index = 0
                obj_file1.sprite_index = spr_file1_pizzanoprep
                obj_file2.image_index = 0
                obj_file2.sprite_index = spr_file2_pizzanoprep
                obj_file3.image_index = 0
                obj_file3.sprite_index = spr_file3_pizzanoprep
            }
            else
            {
                obj_file1.sprite_index = spr_file1
                obj_file2.sprite_index = spr_file2
                obj_file3.sprite_index = spr_file3
            }
            icon_y = 5 * _move_v
            icon_y_buffer = 8
            char_select = 2
            scr_sound(choose(switchchar1, switchchar2))
            global.charsave = "saveData" + (showpizzano ? "N" : "") + ((selected != 0 || showpizzano) ? ("_" + (string(global.savefile + extrasave))) : "") + ".ini"
            ini_open(global.charsave)
            obj_player.paletteselect = ini_read_real("Game", "pal", 1)
            with (obj_playerhat)
                image_index = ini_read_real("Game", "hat", 0)
            ini_close()
            obj_menupercent.rizzshake = 8
        }
    }
}
switch selected
{
    case 0:
        obj_file1.visible = 1
        obj_file2.visible = 0
        obj_file3.visible = 0
        break
    case 1:
        obj_file1.visible = 0
        obj_file2.visible = 1
        obj_file3.visible = 0
        break
    case 2:
        obj_file1.visible = 0
        obj_file2.visible = 0
        obj_file3.visible = 1
        break
}

if (icon_y_buffer > 0)
    icon_y_buffer--
if (icon_y_buffer <= 0)
    icon_y = 0
switch keyboard_lastkey
{
    case global.key_up:
    case global.key_upC:
        testcode += "U"
        break
    case global.key_down:
    case global.key_downC:
        testcode += "D"
        break
    case global.key_left:
    case global.key_leftC:
        testcode += "L"
        break
    case global.key_right:
    case global.key_rightC:
        testcode += "R"
        break
}

if (testcode != "" && string_copy("UUDDLRLR", 1, string_length(testcode)) != testcode)
    testcode = ""
if (testcode == "UUDDLRLR" && (!testcodeconfirm))
{
    audio_stop_all_music()
    scr_sound(sfx_secretfound)
    testcodeconfirm = 1
}
keyboard_lastkey = -1

// added for testing
if keyboard_check_pressed(vk_alt)
{
    ini_open("optionData.ini")
        if (ini_read_real("Game", "pizzaunlocked", 0) == 0)
        {
            ini_write_real("Game", "pizzaunlocked", 1)
            instance_create(0, 0, obj_pizzanounlocked)
            if (!instance_exists(obj_saveicon))
                instance_create_depth(0, 0, -1000, obj_saveicon)
            else
            {
                with (obj_saveicon)
                    finishbuffer = 200
            }
        }
        pizzano_unlocked = 1
    ini_close()
}