if (STATE == GameState.Developer){
	draw_set_font(fnt_cambria_4);
	draw_set_halign(fa_center);
	scr_text_shadow((display_get_gui_width() / 2), (display_get_gui_height() / 2) - 154, "MANIC", c_white);
	draw_set_font(fnt_cambria_2);
	
	if (!in_settings) && (!in_levelselect){
		for(var i = 0; i <= option_max; i ++){
			var str = option[i];
			if (option_locked[i]){
				scr_text_shadow((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 85) + (42 * i), str, c_gray);
			}else{
				if (selected == i){
					scr_text_shadow((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 85) + (42 * i), str, make_colour_rgb(189, 23, 23));
				}else{
					scr_text_shadow((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 85) + (42 * i), str, c_white);
				}
			}
		}
	}else if (in_settings) && (!in_levelselect){
		if (in_settings_gameplay) || (in_settings_display) || (in_settings_audio) || (in_settings_controls){
			var omax = option_setting_max;
			if (in_settings_gameplay){
				omax = option_setting_gameplay_max;
			}else if (in_settings_display){
				omax = option_setting_display_max;
			}else if (in_settings_audio){
				omax = option_setting_audio_max;
			}
			
			for(var i = 0; i <= omax; i ++){
				var str = "";
				var adjust_str = "";
				var isbool = false;
				
				var value_cur = 0;
				var value_min = 0;
				var value_max = 0;
				
				if (in_settings_gameplay){
					value_cur = option_setting_gameplay_value[i];
					value_min = option_setting_gameplay_value_min[i];
					value_max = option_setting_gameplay_value_max[i];
					
					str = option_setting_gameplay[i];
					adjust_str = string(value_cur) + option_setting_gameplay_unit[i];
				}else if (in_settings_display){
					value_cur = option_setting_display_value[i];
					value_min = option_setting_display_value_min[i];
					value_max = option_setting_display_value_max[i];
					
					str = option_setting_display[i];
					adjust_str = string(value_cur) + option_setting_display_unit[i];
				}else if (in_settings_audio){
					value_cur = option_setting_audio_value[i];
					value_min = option_setting_audio_value_min[i];
					value_max = option_setting_audio_value_max[i];
					
					str = option_setting_audio[i];
					adjust_str = string(value_cur) + option_setting_audio_unit[i];
				}
				
				isbool = string_pos("[BOOL]", adjust_str) != 0;
				if (isbool){
					if (!value_cur){
						adjust_str = "Disabled";
					}else{
						adjust_str = "Enabled";
					}
				}
				
				if (isbool) || (value_cur < value_max){
					adjust_str += " >";
				}
				
				if (isbool) || (value_cur > value_min){
					adjust_str = string_insert("< ", adjust_str, 0);
				}
				
				if (selected == i){
					draw_set_halign(fa_left);
					scr_text_shadow((display_get_gui_width() / 2) - 175, ((display_get_gui_height() / 2) - 85) + (42 * i), str, make_colour_rgb(189, 23, 23));
					draw_set_halign(fa_right);
					scr_text_shadow((display_get_gui_width() / 2) + 175, ((display_get_gui_height() / 2) - 85) + (42 * i), adjust_str, make_colour_rgb(189, 23, 23));
				}else{
					draw_set_halign(fa_left);
					scr_text_shadow((display_get_gui_width() / 2) - 175, ((display_get_gui_height() / 2) - 85) + (42 * i), str, c_white);
					draw_set_halign(fa_right);
					scr_text_shadow((display_get_gui_width() / 2) + 175, ((display_get_gui_height() / 2) - 85) + (42 * i), adjust_str, c_white);
				}
			}
		}else{
			for(var i = 0; i <= option_setting_max; i ++){
				var str = option_setting[i];
				if (selected == i){
					scr_text_shadow((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 85) + (42 * i), str, make_colour_rgb(189, 23, 23));
				}else{
					scr_text_shadow((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 85) + (42 * i), str, c_white);
				}
			}
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