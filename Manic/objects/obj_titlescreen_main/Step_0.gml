var iskeyboard = (global.game_input_type == InputType.Keyboard);

if (room != rm_title_0){
	instance_destroy();
}

#region Effects
var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var camw = camera_get_view_width(view_camera[0]);
var camh = camera_get_view_height(view_camera[0]);

// Dust
if (random(6.5) < 1) part_particles_create(global.ps_front, random_range(camx, camx + camw), random_range(camy, camy + camh), global.pt_dust_0, 1);
if (random(8.5) < 1) part_particles_create(global.ps_front, random_range(camx, camx + camw), random_range(camy, camy + camh), global.pt_dust_1, 1);

// Tumbleweed
if (random(200) < 1){
	if (instance_number(obj_environment_tumbleweed) < 5){
		var xx = random_range(camx, camx + camw);
		var yy = random_range(camy, camy + camh);
		var safe = 0;
		
		if (instance_exists(obj_player)){
			while(point_distance(xx, yy, obj_player.x, obj_player.y) < 200) || (place_meeting(xx, yy, obj_p_solid)) || (place_meeting(xx, yy, obj_interior_fade)){
				xx = random_range(camx, camx + camw);
				yy = random_range(camy, camy + camh);
				
				if (safe < 100){
					safe ++;
				}else{
					break;
				}
			}
		}
		
		if (safe < 100){
			instance_create(xx, yy, obj_environment_tumbleweed);
		}
	}
}

// Fog
if (random(3) < 1){
	if (part_particles_count(global.pt_fog_0) < 40){
		part_particles_create(global.ps_front, camx + random_range(0, camw), camy + random_range(0, camh), global.pt_fog_0, 1);
	}
}
#endregion

#region Text Scale Hander
if (in_settings) || (in_levelselect){
	for(var i = 0; i <= option_max; i ++){
		option_scale[i] = 1;
	}
	
	if (!in_settings_gameplay){
		for(var i = 0; i <= option_setting_gameplay_max; i ++){
			option_setting_gameplay_scale[i] = 1;
		}
	}
	
	if (!in_settings_display){
		for(var i = 0; i <= option_setting_display_max; i ++){
			option_setting_display_scale[i] = 1;
		}
	}
	
	if (!in_settings_audio){
		for(var i = 0; i <= option_setting_audio_max; i ++){
			option_setting_audio_scale[i] = 1;
		}
	}
	
	if (!in_settings_controls){
		for(var i = 0; i <= option_setting_controls_max; i ++){
			option_setting_controls_scale[i] = 1;
		}
	}
}

if (!in_settings){
	for(var i = 0; i <= option_setting_max; i ++){
		option_setting_scale[i] = 1;
	}
}

if (!in_levelselect){
	for(var i = 0; i <= option_levelselect_max; i ++){
		option_levelselect_scale[i] = 1;
	}
}

#endregion

if (fade){
	selected = -1;
	
	if (fade_alpha < 1){
		fade_alpha += fade_speed;
	}else{
		scr_level_persistent_set(scr_level_get_index(fade_goto));
		room_goto(fade_goto);
	}
}else{
	var omax = option_max;
	
	if (in_settings) && (!in_levelselect){
		var omax = option_setting_max + 1;
		if (in_settings_gameplay){
			omax = option_setting_gameplay_max + 2;
		}else if (in_settings_display){
			omax = option_setting_display_max + 2;
		}else if (in_settings_audio){
			omax = option_setting_audio_max + 2;
		}else if (in_settings_controls){
			omax = option_setting_controls_max + 2;
		}
	}else if (in_levelselect){
		omax = option_levelselect_max + 1;
	}
	
	if (!iskeyboard){
		selected = max(0, selected);
	}
	
	var down_pressed = scr_input_is_pressed(InputBinding.Down, 0.275);
	var up_pressed = scr_input_is_pressed(InputBinding.Up, 0.275);
	var right_pressed = scr_input_is_pressed(InputBinding.Right, 0.275);
	var left_pressed = scr_input_is_pressed(InputBinding.Left, 0.275);
	
	if (!warning_prompt) && (!gamepad_device_search){
		if (selected_break > 0){
			selected_break --;
		}else{
			if (!iskeyboard){
				if (down_pressed){
					do{
						if (selected < omax){
							selected ++;
						}else{
							selected = 0;
						}
					}until((in_settings || in_levelselect) || (!option_locked[selected]));
					
					if (in_settings_controls){
						if (selected == omax - 1){
							selected ++;
						}
					}
				
					selected_break = selected_held_time >= selected_held_time_max ? 6 : 12;
				}
			
				if (up_pressed){
					do{
						if (selected > 0){
							selected --;
						}else{
							selected = omax;
						}
					}until((in_settings || in_levelselect) || (!option_locked[selected]));
					
					if (in_settings_controls){
						if (selected == omax - 1){
							selected --;
						}
					}
					
					selected_break = selected_held_time >= selected_held_time_max ? 6 : 12;
				}
			}
		}
	
		if (down_pressed || up_pressed){
			if (selected_held_time < selected_held_time_max){
				selected_held_time ++;
			}
		}else{
			selected_held_time = 0;
		}
	}else if (warning_prompt) && (!gamepad_device_search){
		if (!iskeyboard){
			warning_prompt_selected = max(warning_prompt_selected, 0);
		}
		
		if (warning_prompt_selected_break > 0){
			warning_prompt_selected_break --;
		}else{
			if (!iskeyboard){
				if (up_pressed || down_pressed || right_pressed || left_pressed){
					warning_prompt_selected = !warning_prompt_selected;
					warning_prompt_selected_break = 12;
				}
			}
		}
		
		if (warning_prompt_selected != -1){
			if (scr_input_is_pressed(iskeyboard ? InputBinding.Attack : InputBinding.Interact)){
				if (warning_prompt_selected == 0){
					scr_clear_save_data();
				}
			
				warning_prompt = false;
				return;
			}
		}
	}else if (gamepad_device_search){
		var button_matrix = scr_input_gamepad_any();
		
		if (button_matrix[# 0, 0] != -1){
			global.game_input_type = InputType.Gamepad;
			
			global.game_input_gamepad_current = button_matrix[# 0, 0];
			global.game_input_gamepad_current_type = scr_input_gamepad_get_type();
			
			gamepad_set_axis_deadzone(global.game_input_gamepad_current, 0.1);
			gamepad_set_button_threshold(global.game_input_gamepad_current, 0.5);
			
			selected = 2;
			press_break = 10;
			selected_break = 10;
			
			option_setting_controls_value[0] = global.game_input_type;
			
			gamepad_device_search = false;
			gamepad_device_search_time = 0;
			
			ds_grid_destroy(button_matrix);
			
			scr_options_refresh();
			return;
		}
		
		ds_grid_destroy(button_matrix);
		
		if (gamepad_device_search_time > 0){
			gamepad_device_search_time --;
		}else{
			gamepad_device_search = false;
			gamepad_device_search_time = 0;
			
			global.game_input_type = InputType.Keyboard;
			option_setting_controls_value[0] = InputType.Keyboard;
			scr_options_refresh();
		}
		
		return;
	}
	
	selected = clamp(selected, -1, omax);
	
	if (fade_opening){
		if (fade_alpha > 0){
			fade_alpha -= 0.025;
		}else{
			fade_alpha = 0;
			fade_opening = false;
		}
		
		fade_alpha = clamp(fade_alpha, 0, 1);
		return;
	}
	
	if (selected != -1){
		if (press_break > 0){
			press_break --;
		}else{
			if (in_settings) && (selected != omax) && (selected != omax - 1){
				if (in_settings_gameplay){
					if (scr_input_is_pressed(iskeyboard ? InputBinding.Attack : InputBinding.Interact)){
						if (option_setting_gameplay_value[selected] < option_setting_gameplay_value_max[selected]){
							option_setting_gameplay_value[selected] += option_setting_gameplay_value_interval[selected];
						}else{
							option_setting_gameplay_value[selected] = option_setting_gameplay_value_min[selected];
						}
			
						global.game_option[| option_setting_gameplay_edit[selected]] = option_setting_gameplay_value[selected];
						scr_options_refresh();
						press_break = 5;
					}
				}else if (in_settings_display){
					if (scr_input_is_pressed(iskeyboard ? InputBinding.Attack : InputBinding.Interact)){
						if (option_setting_display_value[selected] < option_setting_display_value_max[selected]){
							option_setting_display_value[selected] += option_setting_display_value_interval[selected];
						}else{
							option_setting_display_value[selected] = option_setting_display_value_min[selected];
						}
			
						global.game_option[| option_setting_display_edit[selected]] = option_setting_display_value[selected];
						scr_options_refresh(true);
						press_break = 5;
					}
				}else if (in_settings_audio){
					if (scr_input_is_pressed(iskeyboard ? InputBinding.Attack : InputBinding.Interact)){
						if (option_setting_audio_value[selected] < option_setting_audio_value_max[selected]){
							option_setting_audio_value[selected] += option_setting_audio_value_interval[selected];
						}else{
							option_setting_audio_value[selected] = option_setting_audio_value_min[selected];
						}
		
						global.game_option[| option_setting_audio_edit[selected]] = option_setting_audio_value[selected];
						scr_options_refresh(false);
						press_break = 5;
					}
				}else if (in_settings_controls){
					if (scr_input_is_pressed(iskeyboard ? InputBinding.Attack : InputBinding.Interact)){
						if (option_setting_controls_value[selected] < option_setting_controls_value_max[selected]){
							option_setting_controls_value[selected] += option_setting_controls_value_interval[selected];
						}else{
							option_setting_controls_value[selected] = option_setting_controls_value_min[selected];
						}
						
						if (selected == 0){
							if (option_setting_controls_value[0] == InputType.Gamepad){
								gamepad_device_search = true;
								gamepad_device_search_time = 60 * 3;
								option_setting_controls_value[0] = InputType.Keyboard;
							}
							
							global.game_input_type = InputType.Keyboard;
						}else{
							global.game_option[| option_setting_controls_edit[selected]] = option_setting_controls_value[selected];
						}
						
						scr_options_refresh();
						press_break = 5;
					}
				}
			}
		}
		
		if (!iskeyboard && scr_input_is_pressed(InputBinding.Dash)){
			var changed = false;
			
			if (in_settings_gameplay) || (in_settings_display) || (in_settings_audio) || (in_settings_controls){
				in_settings_gameplay = false;
				in_settings_display = false;
				in_settings_audio = false;
				in_settings_controls = false;
				
				changed = true;
			}else if (in_settings){
				in_settings = false;
				changed = true;
			}else if (in_levelselect){
				in_levelselect = false;
				changed = true;
			}
			
			if (changed){
				selected = (iskeyboard ? -1 : 0);
				scr_titlescreen_options_scale_reset();
			}
		}
		
		if (scr_input_is_pressed(iskeyboard ? InputBinding.Attack : InputBinding.Interact)){
			var isvalid = false;
			
			if (!in_settings) && (!in_levelselect){
				isvalid = true;
				
				if (!isteaser){
					switch(selected){
						case 0:
							isvalid = false;
							audio_sound_gain(m_ambience_wind_0, 0, 2000);
						
							global.game_is_playthrough = true;
							fade = true;
						
							if (global.game_save_level_atpreroom) && (global.level_preroom[global.game_save_level] != noone){
								fade_goto = global.level_preroom[global.game_save_level];
							}else{
								fade_goto = global.level_room[global.game_save_level];
							}
						
							fade_speed = 0.01;
						
							global.level_current = global.game_save_level;
							break;
					
						case 1:
							in_levelselect = true;
							break;
					
						case 2:
							in_settings = true;
							break;
				
						case 3:
							scr_options_refresh(false);
							game_end();
							break;
					}
				}else{
					switch(selected){
						case 0:
							isvalid = false;
							audio_sound_gain(m_ambience_wind_0, 0, 2000);
							
							global.game_is_playthrough = false;
							global.level_entered[Level.RavagedTown] = false;
							global.game_save_seconds = 0;
							fade = true;
							
							if (global.game_save_level_atpreroom) && (global.level_preroom[Level.RavagedTown] != noone){
								fade_goto = global.level_preroom[Level.RavagedTown];
							}else{
								fade_goto = global.level_room[Level.RavagedTown];
							}
							
							fade_speed = 0.01;
							
							global.level_current = Level.RavagedTown;
							
							scr_set_kills_and_findings();
							break;
							
						case 1:
							in_settings = true;
							break;
							
						case 2:
							scr_options_refresh(false);
							game_end();
							break;
					}
				}
			}else if (in_settings) && (!in_levelselect){
				if (in_settings_gameplay) || (in_settings_display) || (in_settings_audio) || (in_settings_controls){
					if (selected == omax - 1){
						if (indicate_text_alpha <= 0) || (indicate_text != "Options have been reset"){
							var otype = "";
							var str;
							
							if (in_settings_gameplay){
								otype = "gameplay";
								str = "Gameplay settings have been reset";
							}else if (in_settings_display){
								otype = "display";
								str = "Display settings have been reset";
							}else if (in_settings_audio){
								otype = "audio";
								str = "Audio settings have been reset";
							}else if (in_settings_controls){
								otype = "controls";
								str = "Control settings have been reset";
							}
							
							scr_option_reset_defaults(otype);
							
							indicate_text = str;
							indicate_text_time = 135;
							indicate_text_alpha = 1;
						}
					}else if (selected == omax){
						in_settings_gameplay = false;
						in_settings_display = false;
						in_settings_audio = false;
						in_settings_controls = false;
						selected = (iskeyboard ? -1 : 0);
						
						scr_titlescreen_options_scale_reset();
					}
				}else{
					if (!in_settings_gameplay) && (!in_settings_display) && (!in_settings_audio) && (!in_settings_controls){
						isvalid = true;
						switch(selected){
							case 0:
								in_settings_gameplay = true;
								option_scale[selected] = 1;
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
						
							case 4:
								if (indicate_text_alpha <= 0) || ((indicate_text != "No save data was found") && (indicate_text != "Save data has been reset")){
									warning_prompt = true;
								}
								
								isvalid = false;
								break;
							
							case 5:
								in_settings = false;
								selected = (iskeyboard ? -1 : 0);
								
								scr_titlescreen_options_scale_reset();
								break;
						}
					}
				}
			}else if (in_levelselect){
				if (selected == omax){
					in_levelselect = false;
					selected = (iskeyboard ? -1 : 0);
					
					scr_titlescreen_options_scale_reset();
				}else{
					isvalid = false;
					audio_sound_gain(m_ambience_wind_0, 0, 2000);
					
					global.game_is_playthrough = false;
					global.game_save_seconds = 0;
					global.level_current = selected;
					global.level_entered[selected] = false;
					scr_set_kills_and_findings();
					
					fade = true;
					fade_goto = option_levelselect_goto[selected];
					fade_speed = 0.01;
				}
			}
		
			if (isvalid){
				selected = (iskeyboard ? -1 : 0);
				scr_titlescreen_options_scale_reset();
			}
		}
	}
}