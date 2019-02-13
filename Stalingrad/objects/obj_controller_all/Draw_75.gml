if (debug) && (global.cutscene_current == -1){
	var xx = display_get_gui_width() / 2;
	var yy = 42;
	
	var debug_text = "FPS: " + string(round(fps)) + "  RFPS: " + string(round(fps_real)) + "  INST: " + string(instance_number(all));
	var debug_text_width;
	
	draw_set_font(fnt_cambria_0);
	debug_text_width = string_width(debug_text) + 20;
	
	draw_set_colour(c_black);
	draw_set_alpha(0.7);
	draw_rectangle((display_get_gui_width() / 2) - (debug_text_width / 2), 39, (display_get_gui_width() / 2) + (debug_text_width / 2), 78, false);
	draw_set_alpha(1);
	
	draw_set_halign(fa_center);
	scr_text_shadow(xx, yy, debug_text, c_white);
}