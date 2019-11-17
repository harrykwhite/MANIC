if (debug) && (global.cutscene_current == -1){
	var xx = display_get_gui_width() - 30;
	var yy = 21;
	
	if (global.game_option[| Options.ShowMinimap] && instance_exists(obj_controller_ui)){
		yy = 154;
	}
	
	var debug_text = "FPS: " + string(round(fps)) + "  RFPS: " + string(round(fps_real)) + "  INST: " + string(instance_number(all));
	var debug_text_width;
	
	draw_set_font(fnt_cambria_0);
	debug_text_width = string_width(debug_text) + 20;
	
	draw_set_halign(fa_right);
	scr_text_shadow(xx, yy, debug_text, c_white);
}