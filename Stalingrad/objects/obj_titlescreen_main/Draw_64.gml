draw_set_colour(c_black);
draw_set_alpha(0.25);
draw_rectangle((display_get_gui_width() / 2) - 220, 0, (display_get_gui_width() / 2) + 220, display_get_gui_height(), false);
draw_set_alpha(1);

if (STATE == GameState.Developer){
	var titlescale = wave(1.3, 1.35, 4, 0);
	
	draw_set_font(fnt_cambria_4);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_text_shadow_transformed((display_get_gui_width() / 2), (display_get_gui_height() / 2) - 158, "MANIC", c_white, titlescale, titlescale, 0);
	draw_set_font(fnt_cambria_2);
	
	if (searching_for_input){
		var str = "Searching for keyboard input...";
		
		if (searching_for_input_mouse){
			str = "Searching for mouse input...";
		}
		
		scr_text_shadow((display_get_gui_width() / 2), display_get_gui_height() - 120, str, c_white);
	}
	
	if (indicate_text_alpha > 0){
		if (indicate_text_time > 0){
			indicate_text_time --;
		}else{
			indicate_text_alpha -= 0.05;
		}
		
		var yy = 150;
		
		if (in_settings_controls){
			yy = 120;
		}
		
		draw_set_alpha(indicate_text_alpha);
		scr_text_shadow((display_get_gui_width() / 2), display_get_gui_height() - yy, indicate_text, c_white);
		draw_set_alpha(1);
	}else{
		indicate_text = "";
		indicate_text_alpha = 0;
		indicate_text_time = 0;
	}
	
	if (!in_settings) && (!in_levelselect){
		for(var i = 0; i <= option_max; i ++){
			var str = option[i];
			
			if (selected == i){
				option_scale[i] = approach(option_scale[i], 1.1, 40);
			}else{
				option_scale[i] = approach(option_scale[i], 1, 40);
			}
			
			if (option_locked[i]){
				scr_text_shadow_transformed((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 65) + (52 * i), str, c_gray, option_scale[i], option_scale[i], 0);
			}else{
				if (selected == i){
					scr_text_shadow_transformed((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 65) + (52 * i), str, make_colour_rgb(189, 23, 23), option_scale[i], option_scale[i], 0);
					
					if (i == 0) && (string_pos("Continue", option[i]) != 0){
						draw_set_font(fnt_cambria_0);
						scr_text_shadow_transformed((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 65) + (52 * i) + 22, scr_seconds_to_timer(global.game_save_seconds) + " - " + global.level_name[global.game_save_level], c_white, 0.75, 0.75, 0);
						draw_set_font(fnt_cambria_2);
					}
				}else{
					scr_text_shadow_transformed((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 65) + (52 * i), str, c_white, option_scale[i], option_scale[i], 0);
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
			}else if (in_settings_controls){
				omax = option_setting_controls_max;
			}
			
			for(var i = 0; i <= omax + 1; i ++){
				var str = "";
				var adjust_str = "";
				var isbool = false, isres = false;
				
				var value_cur = 0;
				var value_min = 0;
				var value_max = 0;
				var scale = 1;
				var centered = false;
				
				if (i == omax + 1){
					str = "Reset to defaults";
					centered = true;
					
					if (selected == i){
						reset_text_scale = approach(reset_text_scale, 1.05, 40);
					}else{
						reset_text_scale = approach(reset_text_scale, 1, 40);
					}
					
					scale = reset_text_scale;
				}else{
					if (in_settings_gameplay){
						value_cur = option_setting_gameplay_value[i];
						value_min = option_setting_gameplay_value_min[i];
						value_max = option_setting_gameplay_value_max[i];
					
						str = option_setting_gameplay[i];
						adjust_str = string(value_cur) + option_setting_gameplay_unit[i];
					
						if (selected == i){
							option_setting_gameplay_scale[i] = approach(option_setting_gameplay_scale[i], 1.05, 40);
						}else{
							option_setting_gameplay_scale[i] = approach(option_setting_gameplay_scale[i], 1, 40);
						}
					
						scale = option_setting_gameplay_scale[i];
					}else if (in_settings_display){
						value_cur = option_setting_display_value[i];
						value_min = option_setting_display_value_min[i];
						value_max = option_setting_display_value_max[i];
					
						str = option_setting_display[i];
						adjust_str = string(value_cur) + option_setting_display_unit[i];
					
						if (selected == i){
							option_setting_display_scale[i] = approach(option_setting_display_scale[i], 1.05, 40);
						}else{
							option_setting_display_scale[i] = approach(option_setting_display_scale[i], 1, 40);
						}
					
						scale = option_setting_display_scale[i];
					}else if (in_settings_audio){
						value_cur = option_setting_audio_value[i];
						value_min = option_setting_audio_value_min[i];
						value_max = option_setting_audio_value_max[i];
					
						str = option_setting_audio[i];
						adjust_str = string(value_cur) + option_setting_audio_unit[i];
					
						if (selected == i){
							option_setting_audio_scale[i] = approach(option_setting_audio_scale[i], 1.05, 40);
						}else{
							option_setting_audio_scale[i] = approach(option_setting_audio_scale[i], 1, 40);
						}
					
						scale = option_setting_audio_scale[i];
					}else if (in_settings_controls){
						value_cur = option_setting_controls_value[i];
						value_min = 0;
						value_max = 0;
					
						str = option_setting_controls[i];
					
						if (!option_setting_controls_ismouse[i]){
							adjust_str = scr_keycheck_string(value_cur);
						}else{
							adjust_str = scr_mousecheck_string(value_cur);
						}
					
						if (selected == i){
							option_setting_controls_scale[i] = approach(option_setting_controls_scale[i], 1.05, 40);
						}else{
							option_setting_controls_scale[i] = approach(option_setting_controls_scale[i], 1, 40);
						}
					
						scale = option_setting_controls_scale[i];
					}
				}
				
				isbool = string_pos("[BOOL]", adjust_str) != 0;
				isres = string_pos("[RESOLUTION]", adjust_str) != 0;
				if (isbool){
					if (!value_cur){
						adjust_str = "Disabled";
					}else{
						adjust_str = "Enabled";
					}
				}
				
				if (isres){
					var resolutions = scr_resolution_options();
					var value = ds_list_find_value(resolutions, value_cur);
					
					if (value == undefined){
						adjust_str = ds_list_find_value(resolutions, ds_list_size(resolutions) - 1);
					}else{
						adjust_str = value;
					}
					
					ds_list_destroy(resolutions);
				}
				
				if (!in_settings_controls){
					adjust_str = string(adjust_str) + " >";
					adjust_str = string_insert("< ", adjust_str, 0);
				}
				
				if (centered){
					draw_set_halign(fa_center);
					
					if (selected == i){
						scr_text_shadow_transformed((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 65) + (42 * i) + 30, str, make_colour_rgb(189, 23, 23), scale, scale, 0);	
					}else{
						scr_text_shadow_transformed((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 65) + (42 * i) + 30, str, c_white, scale, scale, 0);	
					}
				}else{
					if (selected == i){
						draw_set_halign(fa_left);
						scr_text_shadow_transformed((display_get_gui_width() / 2) - 175, ((display_get_gui_height() / 2) - 65) + (42 * i), str, make_colour_rgb(189, 23, 23), scale, scale, 0);
						draw_set_halign(fa_right);
						scr_text_shadow_transformed((display_get_gui_width() / 2) + 175, ((display_get_gui_height() / 2) - 65) + (42 * i), adjust_str, make_colour_rgb(189, 23, 23), scale, scale, 0);
					}else{
						draw_set_halign(fa_left);
						scr_text_shadow_transformed((display_get_gui_width() / 2) - 175, ((display_get_gui_height() / 2) - 65) + (42 * i), str, c_white, scale, scale, 0);
						draw_set_halign(fa_right);
						scr_text_shadow_transformed((display_get_gui_width() / 2) + 175, ((display_get_gui_height() / 2) - 65) + (42 * i), adjust_str, c_white, scale, scale, 0);
					}
				}
			}
		}else{
			for(var i = 0; i <= option_setting_max; i ++){
				var str = option_setting[i];
				
				if (selected == i){
					option_setting_scale[i] = approach(option_setting_scale[i], 1.1, 40);
				}else{
					option_setting_scale[i] = approach(option_setting_scale[i], 1, 40);
				}
				
				if (selected == i){
					scr_text_shadow_transformed((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 65) + (42 * i), str, make_colour_rgb(189, 23, 23), option_setting_scale[i], option_setting_scale[i], 0);
				}else{
					scr_text_shadow_transformed((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 65) + (42 * i), str, c_white, option_setting_scale[i], option_setting_scale[i], 0);
				}
			}
		}
	}else if (in_levelselect){
		draw_set_font(fnt_cambria_1);
		
		for(var i = 0; i <= option_levelselect_max; i ++){
			var str = option_levelselect[i];
			
			if (selected == i){
				option_levelselect_scale[i] = approach(option_levelselect_scale[i], 1.1, 40);
			}else{
				option_levelselect_scale[i] = approach(option_levelselect_scale[i], 1, 40);
			}
			
			if (!option_levelselect_unlocked[i]){
				scr_text_shadow_transformed((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 65) + (36 * i), "?????", c_gray, option_levelselect_scale[i], option_levelselect_scale[i], 0);
			}else{
				if (selected == i){
					scr_text_shadow_transformed((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 65) + (36 * i), str, make_colour_rgb(189, 23, 23), option_levelselect_scale[i], option_levelselect_scale[i], 0);
				}else{
					scr_text_shadow_transformed((display_get_gui_width() / 2), ((display_get_gui_height() / 2) - 65) + (36 * i), str, c_white, option_levelselect_scale[i], option_levelselect_scale[i], 0);
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
draw_set_valign(fa_top);
draw_set_halign(fa_left);
scr_text_shadow(23, display_get_gui_height() - 50, "(F) Fullscreen", c_white);
draw_set_alpha(1);