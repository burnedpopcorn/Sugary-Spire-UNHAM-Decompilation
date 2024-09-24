var shake = 1
var minus = 0
var sprwidth = sprite_get_width(spr_keyfont) + 5
var _y = 490 + (random_range((-shake), shake))
draw_set_font(global.newfont)
draw_set_alpha(alpha)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
switch type
{
    case "staunt":
        minus = 376
        draw_sprite(keysprite_get(global.key_up), key_get(global.key_up), (minus + (random_range((-shake), shake))), _y)
        draw_sprite(keysprite_get(global.key_taunt), key_get(global.key_taunt), (minus + (random_range((-shake), shake)) + sprwidth - 2.5), _y)
        draw_text((minus + (random_range((-shake), shake)) + (sprwidth * 2 - 2.5)), _y, "Supertaunt")
        break
    case "cotton":
        minus = 280
        if (obj_player.character == "N")
            minus = 154
        draw_sprite(keysprite_get(global.key_jump), key_get(global.key_jump), (minus + (random_range((-shake), shake))), _y)
        draw_sprite(keysprite_get(global.key_jump), key_get(global.key_jump), (minus + (random_range((-shake), shake)) + sprwidth - 2.5), _y)
        draw_text((minus + (random_range((-shake), shake)) + (sprwidth * 2 - 2.5)), _y, "Double Jump")
        draw_sprite(keysprite_get(global.key_slap), key_get(global.key_slap), (minus + (random_range((-shake), shake)) + (sprwidth * 2 - 2.5 + (string_width("Double Jump")) + 25)), _y)
        draw_text((minus + (random_range((-shake), shake)) + (sprwidth * 3 - 2.5) + (string_width("Double Jump")) + 25), _y, "Attack")
        if (obj_player.character == "N")
        {
            draw_sprite(movesprite, movexscale, (minus + (random_range((-shake), shake)) + (sprwidth * 3 - 2.5) + (string_width("Double Jump")) + string_width("Attack") + 50), _y)
            draw_text((minus + (random_range((-shake), shake)) + (sprwidth * 4 - 2.5) + (string_width("Double Jump")) + string_width("Attack") + 50), _y, "Stick to wall")
        }
        break
    case "minecart":
        minus = 430
        if (obj_player.character == "N")
            minus = 352
        draw_sprite(keysprite_get(global.key_jump), key_get(global.key_jump), (minus + (random_range((-shake), shake))), _y)
        draw_text((minus + (random_range((-shake), shake)) + sprwidth), _y, "Jump")
        if (obj_player.character == "N")
        {
            draw_sprite(keysprite_get(global.key_slap), key_get(global.key_slap), (minus + (random_range((-shake), shake)) + (sprwidth + string_width("Jump") + 25)), _y)
            draw_text((minus + (random_range((-shake), shake)) + sprwidth * 2 + string_width("Jump") + 25), _y, "Attack")
        }
        break
}

draw_set_alpha(1)
