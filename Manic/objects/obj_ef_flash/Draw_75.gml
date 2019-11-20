var alph = alpha;

if (flash_option){
	alph *= global.game_option[| Options.Flashing] / 100;
}

draw_set_colour(colour);
draw_set_alpha(alph);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);