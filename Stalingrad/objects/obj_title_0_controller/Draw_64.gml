if (STATE == GameState.Developer){
	draw_set_font(fnt_cambria_1);
	draw_set_halign(fa_center);
	scr_text_shadow(display_get_gui_width() / 2, (display_get_gui_height() / 2) - 174, "MANIC Development Build", c_white);
	draw_set_font(fnt_cambria_0);
	
	for(var i = 0; i < smax + 2; i++){
		
		var str, yyoff = 0;
		
		if (i != smax + 1){
			str = string(global.level_name[i]) + "\n";
		}else{
			str = "Full Playthrough";
			yyoff = 40;
		}
		
		if (selected == i){
			scr_text_shadow((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 125) + (32 * i) + yyoff, str, make_colour_rgb(189, 23, 23));
		}else{
			scr_text_shadow((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 125) + (32 * i) + yyoff, str, c_white);
		}
	}
}else{
	draw_set_font(fnt_cambria_0);
	draw_set_alpha(wave(0.6, 0.8, 2, 0, true));
	draw_set_halign(fa_left);
	scr_text_shadow((display_get_gui_width() / 2) - 115, (display_get_gui_height() / 2), "Press Enter to Start", c_white);
	scr_text_shadow((display_get_gui_width() / 2) - 115, (display_get_gui_height() / 2) + 70, "WASD - Move\nSPACE - Dash\nE - Pickup\nLEFT CLICK - Attack\nRIGHT CLICK - Throw Weapon", c_white);
}

draw_set_font(fnt_cambria_0);
draw_set_halign(fa_left);
scr_text_shadow(23, display_get_gui_height() - 50, "(F) Fullscreen", c_white);
draw_set_alpha(1);