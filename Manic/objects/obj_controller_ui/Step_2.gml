var iskeyboard = (global.game_input_type == InputType.Keyboard);
var ispaused = global.game_pause;

var up_pressed = scr_input_is_pressed(InputBinding.Up, 0.275);
var down_pressed = scr_input_is_pressed(InputBinding.Down, 0.275);

scr_position_view();

// Teaser end
if (teaserend){
	if (teaserend_alpha < 1){
		teaserend_alpha += 0.02;
	}else{
		if (teaserend_text_alpha < 1){
			teaserend_text_alpha += 0.02;
		}
	}
	
	if (!teaserend_button_has_selected){
		if (teaserend_button_selected_break > 0){
			teaserend_button_selected_break --;
		}else if (!iskeyboard){
			if (up_pressed){
				if (teaserend_button_selected > 0){
					teaserend_button_selected --;
				}else{
					teaserend_button_selected = teaserend_button_selected_max - 1;
				}
		
				teaserend_button_selected_break = teaserend_button_selected_held_time >= teaserend_button_selected_held_time_max ? 6 : 12;
			}
	
			if (down_pressed){
				if (teaserend_button_selected < teaserend_button_selected_max - 1){
					teaserend_button_selected ++;
				}else{
					teaserend_button_selected = 0;
				}
		
				teaserend_button_selected_break = teaserend_button_selected_held_time >= teaserend_button_selected_held_time_max ? 6 : 12;
			}
		}
		
		if (up_pressed || down_pressed){
			if (teaserend_button_selected_held_time < teaserend_button_selected_held_time_max){
				teaserend_button_selected_held_time ++;
			}
		}else{
			teaserend_button_selected_held_time = 0;
		}
		
		if (!iskeyboard ? scr_input_is_pressed(InputBinding.Interact) : scr_input_is_pressed(InputBinding.Attack)){
			if (teaserend_button_selected != -1){
				switch(teaserend_button_selected){
					case 0:
						url_open("https://store.steampowered.com/app/1144850/MANIC/");
						break;
				
					case 1:
						url_open("https://discord.gg/CqykxNh");
						break;
				
					case 2:
						url_open("https://twitter.com/GetaGamesTeam");
						break;
				
					case 3:
						scr_effect_flash_script(0.02, 1, c_black, scr_trigger_3);
						teaserend_button_has_selected = true;
						break;
				}
			}
		}
	}
}else{
	if (teaserend_alpha > 0){
		teaserend_alpha -= 0.05;
	}
	
	if (teaserend_text_alpha > 0){
		teaserend_text_alpha -= 0.05;
	}
}

// Level opening
if (level_opening){
	if (level_opening_time > 0){
		level_opening_time --;
		
		if (level_opening_line_width > 100){
			if (level_opening_text_alpha < 1.25){
				level_opening_text_alpha += 0.015;
			}
		}
	}else{
		level_opening_time = 0;
		
		if (level_opening_alpha > 0){
			level_opening_alpha -= 0.015;
		}else{
			level_opening_active = false;
		}
		
		if (level_opening_text_alpha > 0){
			level_opening_text_alpha -= 0.015;
		}else{
			level_opening = false;
		}
	}
}

// Game Ending
if (ending){
	if (!ending_close){
		if (ending_back_time > 0){
			ending_back_time --;
		}else{
			if (ending_back_alpha < 1){
				ending_back_alpha += 0.005;
			}
		}
	
		if (ending_logo_text_time > 0){
			ending_logo_text_time --;
		
			if (ending_logo_text_alpha < 1){
				ending_logo_text_alpha += 0.0025;
			}
		}else{
			if (ending_logo_text_alpha > 0){
				ending_logo_text_alpha -= 0.005;
			}else{
				if (ending_credits_text_alpha < 1){
					ending_credits_text_alpha += 0.005;
				}else{
					if (scr_input_is_pressed(iskeyboard ? InputBinding.Attack : InputBinding.Interact)){
						ending_close = true;
					}
				}
			}
		}
	}else{
		var canreturn = true;
		
		if (ending_logo_text_alpha > 0){
			ending_logo_text_alpha -= 0.005;
			canreturn = false;
		}
		
		if (ending_credits_text_alpha > 0){
			ending_credits_text_alpha -= 0.005;
			canreturn = false;
		}
		
		if (ending_back_alpha < 1){
			ending_back_alpha += 0.05;
			canreturn = false;
		}
		
		if (canreturn){
			ds_grid_clear(global.player_companions, -1);
			scr_fade_object_list_reset();
			scr_level_persistent_reset_level(global.level_current);
			scr_global_set();
			audio_stop_all();
			room_goto(rm_title_0);
			
			obj_controller_gameplay.has_saved = true;
		}
	}
}

// Screen Blend
if (screenblend_draw){
    if (screenblend_alpha < screenblend_endalpha){
        screenblend_alpha += screenblend_speed;
    }else{
        screenblend_draw = false;
    }
}else{
    if (screenblend_alpha > 0){
        screenblend_alpha -= screenblend_speed;
    }else{
        screenblend_alpha = 0;
    }
}

if (!ispaused){
	pause_selected = iskeyboard ? -1 : 0;
	pause_selected_break = 0;
	
	// Minimap
	if (minimap_arrow_sine < 360){
		minimap_arrow_sine += minimap_arrow_sine_speed;
	}else{
		minimap_arrow_sine = 0;
	}
	
	// Arena
	var arenascore = global.level_score[global.level_current];
	var arenascorejump = 5;
	
	if (arena_score_current < arenascore){
		arena_score_current += min(arenascorejump, arenascore - arena_score_current);
	}else if (arena_score_current > arenascore){
		arena_score_current -= min(arenascorejump, arena_score_current - arenascore);
	}
	
	// Header
	if (header_display_time > 0){
		header_display_time --;
		if (header_display_alpha < 1){
			header_display_alpha += 0.05;
		}
	}else{
		if (header_display_alpha > 0){
			header_display_alpha -= 0.05;
		}else{
			header_display_line_width = 0;
		}
	}
	
	// Dialogue
	var dialogue_voice_in = noone, dialogue_voice_loop = noone, dialogue_voice_out = noone;
	var dialogue_voice_do_close = true;
	
	var dialogue_voice_list = ds_list_create();
	
	scr_dialogue_get_voice_from_in(dialogue_voice, dialogue_voice_list);
	
	dialogue_voice_in = dialogue_voice_list[| 0];
	dialogue_voice_loop = dialogue_voice_list[| 1];
	dialogue_voice_out = dialogue_voice_list[| 2];
	
	ds_list_destroy(dialogue_voice_list);
	
	if (dialogue_break > 0){
		dialogue_break --;
	}else{
		if (dialogue_char_count < dialogue_length){
			if (string_char_at(dialogue, floor(dialogue_char_count)) == "."){
				dialogue_char_count += dialogue_char_speed * 0.5;
			}else{
				dialogue_char_count += dialogue_char_speed;
			}
			
			if (dialogue_voice != noone){
				if (!dialogue_voice_opened){
					scr_sound_play(dialogue_voice_in, false, 0.95, 1.05);
					
					dialogue_voice_opened = true;
					dialogue_voice_closed = false;
				}else{
					if (!audio_is_playing(dialogue_voice_in)) && (!audio_is_playing(dialogue_voice_loop)){
						var vind = scr_sound_play(dialogue_voice_loop, false, 0.95, 1.05);
						
						if ((dialogue_char_count div 2) != (dialogue_char_count / 2)){
							audio_sound_pitch(vind, 1.2);
						}
					}
				}
				
				dialogue_voice_do_close = false;
			}
		}
	}
	
	if (!dialogue_pause) && (dialogue_time > 0){
		dialogue_time --;
	}
	
	if (dialogue_time <= 0){
		dialogue_voice_do_close = true;
		
		if (audio_is_playing(dialogue_voice_loop)){
			audio_stop_sound(dialogue_voice_loop);
		}
	}
	
	if (dialogue_voice_do_close) && (dialogue_voice != noone){
		if (!dialogue_voice_closed){
			if (!audio_is_playing(dialogue_voice_out)){
				audio_stop_sound(dialogue_voice_loop);
				scr_sound_play(dialogue_voice_out, false, 0.95, 1.05);
				dialogue_voice_closed = true;
			}
		}
	}
}else{
	// Pause
	var pause_stamina_drain = 20;
	
	if (!pausedialogue){
		pausedialogue_option_select_break = 10;
		
		if (!iskeyboard){
			pause_selected = max(pause_selected, 0);
		}
		
		if (pause_has_selected){
			if (pause_has_selected_time < 1){
				pause_has_selected_time += 0.025;
			}else{
				scr_toggle_pause(false);
				
				switch(pause_has_selected_index){
					case 1:
						ds_grid_clear(global.player_companions, -1);
						scr_fade_object_list_reset();
						scr_level_persistent_reset_level(global.level_current);
						scr_global_set();
						audio_stop_all();
						room_goto(rm_title_0);
						
						obj_controller_gameplay.has_saved = true;
						break;
					
					case 2:
						scr_options_refresh(false);
						audio_stop_all();
						game_end();
						
						obj_controller_gameplay.has_saved = true;
						break;
				}
				
				pause_has_selected = false;
				pause_has_selected_index = -1;
				
				pausedialogue_type = 1;
				pausedialogue_time = 0;
				pausedialogue_option_selected = iskeyboard ? -1 : 0;
				pausedialogue_option_max = 0;
				pausedialogue_type_text = "";
				pausedialogue_type_option[0] = -1;
				pausedialogue_type_option_special[0] = -1;
				pausedialogue_type_option_cutscene[0] = -1;
			}
		}else if (!obj_controller_all.warning_prompt){
			if (pause_selected_break > 0){
				pause_selected_break --;
			}else if (!iskeyboard){
				if (up_pressed){
					if (pause_selected > 0){
						pause_selected --;
					}else{
						pause_selected = pause_selectedmax - 1;
					}
					
					pause_selected_break = ((pause_selected_held_time >= pause_selected_held_time_max) ? 6 : 12);
				}
				
				if (down_pressed){
					if (pause_selected < pause_selectedmax - 1){
						pause_selected ++;
					}else{
						pause_selected = 0;
					}
					
					pause_selected_break = ((pause_selected_held_time >= pause_selected_held_time_max) ? 6 : 12);
				}
			}
			
			if (up_pressed || down_pressed){
				if (pause_selected_held_time < pause_selected_held_time_max){
					pause_selected_held_time ++;
				}
			}else{
				pause_selected_held_time = 0;
			}
			
			if (obj_controller_all.warning_prompt_alpha <= 0){
				if (!iskeyboard ? scr_input_is_pressed(InputBinding.Interact) : scr_input_is_pressed(InputBinding.Attack)){
					if (pause_selected != -1){
						switch(pause_selected){
							case 0:
								scr_toggle_pause(false);
								scr_player_stamina_drain(pause_stamina_drain);
								pause_selected_break = 0;
								pause_selected_held_time = 0;
								break;
							
							case 1:
								obj_controller_all.warning_prompt = true;
								obj_controller_all.warning_prompt_text = "Are you sure you want to return to titlescreen?";
								obj_controller_all.warning_prompt_type = 1;
								break;
							
							case 2:
								obj_controller_all.warning_prompt = true;
								obj_controller_all.warning_prompt_text = "Are you sure you want to return to desktop?";
								obj_controller_all.warning_prompt_type = 2;
								break;
						}
						
						scr_sound_play(snd_menu_button_mouse_click, false, 0.8, 1.2);
					}
				}
			}
		}
	}else{
		// Pause Dialogue
		if (!iskeyboard){
			pausedialogue_option_selected = max(pausedialogue_option_selected, 0);
		}
		
		if (pausedialogue_time < 10){
			pausedialogue_time ++;
		}else{
			if (!obj_controller_all.warning_prompt){
				if (pausedialogue_break > 0){
					pausedialogue_break --;
				}else if (!iskeyboard){
					if (up_pressed){
						if (pausedialogue_option_selected > 0){
							pausedialogue_option_selected --;
						}else{
							pausedialogue_option_selected = pausedialogue_option_max;
						}
				
						pausedialogue_break = ((pausedialogue_option_selected_held_time >= pausedialogue_option_selected_held_time_max) ? 6 : 12);
					}
				
					if (down_pressed){
						if (pausedialogue_option_selected < pausedialogue_option_max){
							pausedialogue_option_selected ++;
						}else{
							pausedialogue_option_selected = 0;
						}
				
						pausedialogue_break = ((pausedialogue_option_selected_held_time >= pausedialogue_option_selected_held_time_max) ? 6 : 12);
					}
				}
				
				if (!iskeyboard){
					pausedialogue_option_selected = clamp(pausedialogue_option_selected, 0, pausedialogue_option_max);
				}
				
				if (up_pressed || down_pressed){
					if (pausedialogue_option_selected_held_time < pausedialogue_option_selected_held_time_max){
						pausedialogue_option_selected_held_time ++;
					}
				}else{
					pausedialogue_option_selected_held_time = 0;
				}
				
				if (pausedialogue_option_select_break > 0){
					pausedialogue_option_select_break --;
				}else if (obj_controller_all.warning_prompt_alpha <= 0){
					if (!iskeyboard ? scr_input_is_pressed(InputBinding.Interact) : scr_input_is_pressed(InputBinding.Attack)){
						if (pausedialogue_option_selected != -1) && (pausedialogue_option_selected < pausedialogue_option_max){
							if (pausedialogue_type_option_cutscene[pausedialogue_option_selected] != -1){
								global.cutscene_current = pausedialogue_type_option_cutscene[pausedialogue_option_selected];
							}
				
							switch(pausedialogue_type_option_special[pausedialogue_option_selected]){
								case 0:
									global.game_combat_in_hordechallenge = true;
									global.game_combat_in_hordechallenge_time = 60 * 30;
									
									var levelobj = scr_level_get_object();
									levelobj.spawn_time = 0;
									
									scr_sound_play(snd_object_hordepost_activate, false, 0.8, 1.2);
									break;
						
								case 1:
									obj_controller_gameplay.cutscene_traingoto = Level.TrainStation;
							
									global.game_objective_complete = true;
								
									switch(room){
										case rm_level_6_00:
											obj_controller_gameplay.cutscene_trainstart_type = 0;
											obj_controller_gameplay.cutscene_trainroom = rm_level_6_01;
											break;
								
										case rm_level_6_01:
											obj_controller_gameplay.cutscene_trainstart_type = 1;
											obj_controller_gameplay.cutscene_trainroom = rm_level_6_00;
											break;
									}
									break;
						
								case 2:
									scr_effect_flash_script(0.01, 1, c_black, scr_trigger_1);
							
									global.cutscene_current = 0;
									global.cutscene_camera_x[0] = obj_controller_camera.x;
									global.cutscene_camera_y[0] = obj_controller_camera.y;
							
									if (instance_exists(obj_townperson_6)){
										obj_townperson_6.talked_second = true;
									}
									break;
							}
						
							pausedialogue = false;
							pausedialogue_time = 0;
							pausedialogue_option_selected_held_time = 0;
							
							scr_toggle_pause(false);
							scr_player_stamina_drain(pause_stamina_drain);
							
							scr_sound_play(snd_menu_button_mouse_click, false, 0.8, 1.2);
						}else if (pausedialogue_option_selected != -1) && (pausedialogue_option_selected == pausedialogue_option_max){
							pausedialogue = false;
							pausedialogue_time = 0;
							pausedialogue_option_selected_held_time = 0;
							
							scr_toggle_pause(false);
							scr_player_stamina_drain(pause_stamina_drain);
							
							scr_sound_play(snd_menu_button_mouse_click, false, 0.8, 1.2);
						}
					}
				}
			}
		}
	}
}

// Game Opening Intro
if (game_opening_intro){
	if (game_opening_intro_startbreak > 0){
		game_opening_intro_startbreak -= game_opening_intro_speed;
	}else{
		if (game_opening_intro_alpha > 0) || (game_opening_intro_text_alpha > 0){
			game_opening_intro_alpha -= 0.0035 * game_opening_intro_speed;
			game_opening_intro_text_time -= game_opening_intro_speed;
			
			if (game_opening_intro_text_time <= 0){
				game_opening_intro_text_alpha -= 0.0035 * game_opening_intro_speed;
			
				if (game_opening_intro_text_stage == 0){
					if (game_opening_intro_text_alpha <= 0){
						game_opening_intro_text_time = 60 * 6;
						game_opening_intro_text_stage = 1;
						game_opening_intro_text_alpha = -0.15;
					}
				}
			}else{
				game_opening_intro_text_alpha += 0.0035 * game_opening_intro_speed;
			}
		}else{
			game_opening_intro = false;
		}
	}
}