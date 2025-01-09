draw_set_halign(fa_center);
draw_set_font(global.font);
draw_option(150, 30 + ScrollY, "BACK", optionselected == modded_selected.back);
draw_option(480, 100 + ScrollY, "PIZZANO THEME", optionselected == modded_selected.pizzano_theme);
draw_option(320, 150 + ScrollY, "THEME TUNE", optionsaved_entrancetheme == 0);
draw_option(680, 150 + ScrollY, "P.O.P", optionsaved_entrancetheme == 1);
draw_option(480, 200 + ScrollY, "LAPPING SYSTEM", optionselected == modded_selected.lapping);
draw_option(320, 250 + ScrollY, "INFINITE", optionsaved_lappingsys == 0);
draw_option(640, 250 + ScrollY, "LAP 3", optionsaved_lappingsys == 1);
draw_option(480, 300 + ScrollY, "HEATMETER", optionselected == modded_selected.heatmeter);
draw_option(320, 350 + ScrollY, "OFF", optionsaved_heatmeter == 0);
draw_option(640, 350 + ScrollY, "ON", optionsaved_heatmeter == 1);
draw_option(480, 400 + ScrollY, "LEVEL STYLE", optionselected == modded_selected.level_style);
draw_option(320, 450 + ScrollY, "DEMO 1", optionsaved_lvldesign == 0);
draw_option(640, 450 + ScrollY, "MODERN", optionsaved_lvldesign == 1);
draw_option(480, 500 + ScrollY, "HITSTUN", optionselected == modded_selected.hitstun);
draw_option(320, 550 + ScrollY, "OFF", optionsaved_hitstun == 0);
draw_option(640, 550 + ScrollY, "ON", optionsaved_hitstun == 1);
draw_option(480, 600 + ScrollY, "DARK OF MINES", optionselected == modded_selected.dark_mines);
draw_option(320, 650 + ScrollY, "OFF", optionsaved_darkmines == 0);
draw_option(640, 650 + ScrollY, "ON", optionsaved_darkmines == 1);

if (global.sigma)
{
    draw_option(480, 700 + ScrollY, "BERLINGIZ0 MODE", optionselected == modded_selected.BERLINGIZ0);
    draw_option(320, 750 + ScrollY, "OFF", optionsaved_realsigma == 0);
    draw_option(640, 750 + ScrollY, "ON", optionsaved_realsigma == 1);
}

draw_set_font(global.smallfont);
draw_text(480, 512, subtitle);
