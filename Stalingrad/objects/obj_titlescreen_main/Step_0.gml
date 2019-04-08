if (room != rm_title_0){
	instance_destroy();
}

if (fade){
	if (fade_alpha < 1){
		fade_alpha += fade_speed;
	}else{
		room_goto(fade_goto);
	}
}else{
	var omax = option_max;
	if (in_settings) && (!in_levelselect){
		var omax = option_setting_max;
		if (in_settings_gameplay){
			omax = option_setting_gameplay_max;
		}else if (in_settings_display){
			omax = option_setting_display_max;
		}else if (in_settings_audio){
			omax = option_setting_audio_max;
		}
	}
	
	selected = clamp(selected, 0, omax);
	
	if (fade_opening){
		if (fade_alpha > 0){
			fade_alpha -= 0.05;
		}else{
			fade_alpha = 0;
			fade_opening = false;
		}
		
		fade_alpha = clamp(fade_alpha, 0, 1);
		exit;
	}
	
	if (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up)){
		if (selected > 0){
			selected--;
		}else{
			selected = omax;
		}
		
		if (!in_settings) && (!in_levelselect){
			while(option_locked[selected]){
				if (selected > 0){
					selected--;
				}else{
					selected = omax;
				}
			}
		}
	}

	if (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down)){
		if (selected < omax){
			selected ++;
		}else{
			selected = 0;
		}
		
		if (!in_settings) && (!in_levelselect){
			while(option_locked[selected]){
				if (selected < omax){
					selected ++;
				}else{
					selected = 0;
				}
			}
		}
	}
	
	if (in_settings){
		if (in_settings_gameplay) || (in_settings_display) || (in_settings_audio) || (in_settings_controls){
			var isbool = string_pos("[BOOL]", option_setting_gameplay_unit[selected]) != 0;
			
			if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right)){
				if (option_setting_gameplay_value[selected] < option_setting_gameplay_value_max[selected]){
					option_setting_gameplay_value[selected] += option_setting_gameplay_value_interval[selected];
				}else{
					if (isbool){
						option_setting_gameplay_value[selected] = 0;
					}
				}
			}
			
			if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left)){
				if (option_setting_gameplay_value[selected] > option_setting_gameplay_value_min[selected]){
					option_setting_gameplay_value[selected] -= option_setting_gameplay_value_interval[selected];
				}else{
					if (isbool){
						option_setting_gameplay_value[selected] = option_setting_gameplay_value_max[selected];
					}
				}
			}
		}
	}
	
	if (keyboard_check_pressed(vk_enter)){
		var isvalid = false;
		
		if (!in_settings) && (!in_levelselect){
			isvalid = true;
			switch(selected){
				case 0:
					fade = true;
					fade_goto = rm_level_1_00;
					fade_speed = 0.01;
					global.game_playthrough = true;
					break;
				
				case 1:
					in_levelselect = true;
					break;
				
				case 2:
					in_settings = true;
					break;
				
				case 3:
					game_end();
					break;
			}
		}else if (in_settings) && (!in_levelselect){
			if (!in_settings_gameplay) && (!in_settings_display) && (!in_settings_audio) && (!in_settings_controls){
				isvalid = true;
				switch(selected){
					case 0:
						in_settings_gameplay = true;
						break;
				
					case 1:
						in_settings_display = true;
						break;
				
					case 2:
						in_settings_audio = true;
						break;
				
					case 3:
						in_settings_controls = true;
						break;
				}
			}
		}
		
		if (isvalid){
			selected = 0;
		}
	}
	
	if (keyboard_check_pressed(vk_backspace)){
		var isvalid = false;
		
		if (in_settings) && (!in_levelselect){
			isvalid = true;
			if (!in_settings_gameplay) && (!in_settings_display) && (!in_settings_audio) && (!in_settings_controls){
				in_settings = false;
			}else{
				in_settings_gameplay = false;
				in_settings_display = false;
				in_settings_audio = false;
				in_settings_controls = false;
			}
		}
		
		if (isvalid){
			selected = 0;
		}
	}
}