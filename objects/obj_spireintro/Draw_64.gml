draw_clear(c_black);
draw_sprite(spr_introassetbg, -1, 0, 0);
draw_sprite(spr_introassetbg2, -1, 0, 0);

if (obj_player.character == "P")
    draw_sprite(spr_introasset_rosette, -1, 0, 0);

pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0);
draw_sprite(playerspr, -1, 0, 0);
pal_swap_reset();
draw_set_font(global.newfont);
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_alpha(textalpha);
draw_text(288 + random_range(1, -1), 491, message[0]);
draw_sprite(keysprite_get(global.key_slap), key_get(global.key_slap), 288 + random_range(1, -1) + string_width(message[0]), 491);
draw_text(288 + random_range(1, -1) + string_width(message[0]) + sprite_get_width(spr_keyfont), 491, message[1]);
draw_set_alpha(1);
