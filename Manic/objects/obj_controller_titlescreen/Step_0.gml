var iskeyboard = (global.game_input_type == InputType.Keyboard);
var buttonpressed = false;

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
			while(collision_rectangle(xx - 8, yy - 8, xx + 8, yy + 8, obj_p_solid, false, true)){
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
	if (fade_alpha < 1){
		fade_alpha += fade_speed;
	}else{
		scr_level_persistent_set(scr_level_get_index(fade_goto));
		room_goto(fade_goto);
	}
}else{
	var omax = option_max;
	
	if (in_settings) && (!in_levelselect) && (!in_arenamode){
		var omax = option_setting_max + 1;
		if (in_settings_gameplay){
			omax = option_setting_gameplay_max + 2;
		}else if (in_settings_display){
			omax = option_setting_display_max + 2;
		}else if (in_settings_audio){
			omax = option_setting_audio_max + 2;
		}else if (in_settings_controls){
			omax = 0;
		}
	}else if (in_levelselect) && (!in_arenamode){
		omax = option_levelselect_max + 1;
	}else if (in_arenamode){
		omax = option_arenamode_max + 1;
	}
	
	var down_pressed = scr_input_is_pressed(InputBinding.Down, 0.275);
	var up_pressed = scr_input_is_pressed(InputBinding.Up, 0.275);
	
	if (!obj_controller_all.warning_prompt){
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
	}
	
	selected = clamp(selected, -1, omax);
	
	if (!iskeyboard){
		selected = max(0, selected);
	}
	
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
						buttonpressed = true;
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
						buttonpressed = true;
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
						buttonpressed = true;
					}
				}else if (in_settings_controls){
					if (scr_input_is_pressed(iskeyboard ? InputBinding.Attack : InputBinding.Interact)){				
						scr_options_refresh();
						press_break = 5;
						buttonpressed = true;
					}
				}
			}
		}
		
		if (!iskeyboard && scr_input_is_pressed(InputBinding.Dash) && (!obj_controller_all.warning_prompt)){
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
			}else if (in_arenamode){
				in_arenamode = false;
				changed = true;
			}
			
			if (changed){
				selected = (iskeyboard ? -1 : 0);
				buttonpressed = true;
				
				scr_titlescreen_options_scale_reset();
			}
		}
		
		if (scr_input_is_pressed(iskeyboard ? InputBinding.Attack : InputBinding.Interact)){
			var isvalid = false;
			
			if (!in_settings) && (!in_levelselect) && (!in_arenamode){
				isvalid = true;
				
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
						in_arenamode = true;
						break;
					
					case 3:
						in_settings = true;
						break;
				
					case 4:
						scr_options_refresh(false);
						game_end();
						break;
				}
			}else if (in_settings) && (!in_levelselect) && (!in_arenamode){
				if (in_settings_gameplay) || (in_settings_display) || (in_settings_audio) || (in_settings_controls){
					if (selected == omax - 1){
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
						
						with(obj_controller_all){
							indicate_text = str;
							indicate_text_time = indicate_text_time_max;
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
					if (!in_settings_gameplay) && (!in_settings_display) && (!in_settings_audio) && (!in_settings_controls) && (obj_controller_all.warning_prompt_alpha <= 0){
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
								obj_controller_all.warning_prompt = true;
								obj_controller_all.warning_prompt_text = "Are you sure you want to delete your campaign progress?";
								obj_controller_all.warning_prompt_type = 0;
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
			}else if (in_levelselect || in_arenamode){
				var arena = in_arenamode;
				
				if (selected == omax){
					if (arena){
						in_arenamode = false;
					}else{
						in_levelselect = false;
					}
					
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
					fade_goto = arena ? option_arenamode_goto[selected] : option_levelselect_goto[selected];
					fade_speed = 0.01;
				}
			}
		
			if (isvalid){
				selected = (iskeyboard ? -1 : 0);
				scr_titlescreen_options_scale_reset();
			}
			
			buttonpressed = true;
		}
	}
}

if (buttonpressed){
	selected_previous = selected;
	scr_sound_play(snd_menu_button_mouse_click, false, 0.8, 1.2);
}