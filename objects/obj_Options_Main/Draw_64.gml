draw_set_halign(fa_center)
draw_set_font(global.font)
draw_sprite_tiled(bg_options, 0, bgx, bgy)
draw_sprite_ext(spr_arrow, -1, 250, (CursorY + 24), 1, 1, 0, c_white, 1)
if (!selected)
{
    draw_option(150, 30, "BACK", optionselected == states.normal)
    draw_option(480, 100, "AUDIO CONFIG", optionselected == states.titlescreen)
    draw_option(480, 200, "VIDEO CONFIG", optionselected == states.hookshot)
    draw_option(480, 300, "CONTROL CONFIG", optionselected == states.slap)
    draw_option((480 + (random_range((-moddedshake), moddedshake))), (400 + (random_range((-moddedshake), moddedshake))), "MODDED CONFIG", optionselected == states.charge)
    draw_set_font(global.smallfont)
    draw_text(480, 512, subtitle)
}
