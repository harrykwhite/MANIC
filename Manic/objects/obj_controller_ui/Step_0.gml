var iskeyboard = (global.game_input_type == InputType.Keyboard);

var up_pressed = scr_input_is_pressed(InputBinding.Up, 0.275);
var down_pressed = scr_input_is_pressed(InputBinding.Down, 0.275);

scr_position_view();
scr_ui_rank_display_setup();
scr_ui_rank_display_update();

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
			}else{
				if (scr_input_is_pressed(iskeyboard ? InputBinding.Attack : InputBinding.Interact)){
					ending_close = true;
				}
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
			ending_back_alpha += 0.025;
			canreturn = false;
		}
		
		if (canreturn){
			if (global.game_is_playthrough){
				scr_save_game();
			}
			
			ds_grid_clear(global.player_companions, -1);
			scr_fade_object_list_reset();
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

if (!global.game_pause){
	pause_selected = 0;
	pause_selected_break = 0;
	
	// Title Text
	/*if (global.cutscene_current == -1) &&
	((room == rm_level_1_00) ||
	 (room == rm_level_2_00) ||
	 (room == rm_level_3_00) ||
	 (room == rm_level_4_00) ||
	 (room == rm_level_5_00) ||
	 (room == rm_level_6_00) ||
	 (room == rm_level_7_00) ||
	 (room == rm_level_8_00) ||
	 (room == rm_level_9_00) ||
	 (room == rm_level_10_00)){
		if (!leveltext_other){
			if (global.level_current < array_length_1d(global.level_name)){
				leveltext_text = string(global.level_name[global.level_current]);
			}else{
				leveltext_text = "";
			}
		}
		
		if (leveltext_time > 0){
			leveltext_time--;
	
			if (leveltext_alpha < 1){
				leveltext_alpha += 0.02;
			}
		}else{
			if (leveltext_alpha > 0){
				leveltext_alpha -= 0.025;
			}
		}
		
	}else{
		if (leveltext_alpha > 0){
			leveltext_alpha -= 0.05;
		}
	}*/

	// Score
	score_scale = approach(score_scale, 1, 20);
	score_shake *= 0.9;
	score_shake = max(score_shake, 0);

	if (score_current < global.game_score){
		score_current += 50;
	}
}else{
	// Pause
	if (!pausedialogue){
		if (pause_has_selected){
			if (pause_has_selected_time < 1){
				pause_has_selected_time += 0.025;
			}else{
				scr_toggle_pause(false);
				
				switch(pause_has_selected_index){
					case 1:
						if (global.game_is_playthrough){
							scr_save_game();
						}
						
						ds_grid_clear(global.player_companions, -1);
						scr_fade_object_list_reset();
						scr_global_set();
						audio_stop_all();
						room_goto(rm_title_0);
						
						obj_controller_gameplay.has_saved = true;
						break;
					
					case 2:
						if (global.game_is_playthrough){
							scr_save_game();
						}
						
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
				pausedialogue_option_selected = -1;
				pausedialogue_option_max = 0;
				pausedialogue_type_text = "";
				pausedialogue_type_option[0] = -1;
				pausedialogue_type_option_special[0] = -1;
				pausedialogue_type_option_cutscene[0] = -1;
				pausedialogue_type_option_traingoto[0] = -1;
				pausedialogue_type_option_trainroom[0] = -1;
				pausedialogue_type_option_trainstart_type[0] = -1;
			}
		}else{
			if (pause_selected_break > 0){
				pause_selected_break --;
			}else if (!iskeyboard){
				if (up_pressed){
					if (pause_selected > 0){
						pause_selected --;
					}else{
						pause_selected = pause_selectedmax - 1;
					}
					
					pause_selected_break = pause_selected_held_time >= pause_selected_held_time_max ? 6 : 12;
				}
				
				if (down_pressed){
					if (pause_selected < pause_selectedmax - 1){
						pause_selected ++;
					}else{
						pause_selected = 0;
					}
					
					pause_selected_break = pause_selected_held_time >= pause_selected_held_time_max ? 6 : 12;
				}
			}
			
			if (up_pressed || down_pressed){
				if (pause_selected_held_time < pause_selected_held_time_max){
					pause_selected_held_time ++;
				}
			}else{
				pause_selected_held_time = 0;
			}
			
			if (!iskeyboard ? scr_input_is_pressed(InputBinding.Interact) : scr_input_is_pressed(InputBinding.Attack)){
				if (pause_selected != -1){
					switch(pause_selected){
						case 0:
							scr_toggle_pause(false);
							pause_selected_break = 0;
							pause_selected_held_time = 0;
							break;
			
						default:
							pause_has_selected = true;
							pause_has_selected_index = pause_selected;
							pause_has_selected_time = 0;
							break;
					}
				}
			}
		}
	}else{
		// Pause Dialogue
		if (pausedialogue_time < 10){
			pausedialogue_time ++;
		}else{
			if (scr_input_is_pressed(InputBinding.Pause)){
				pausedialogue = false;
				scr_toggle_pause(false);
			}else{
				if (pausedialogue_break > 0){
					pausedialogue_break --;
				}else if (!iskeyboard){
					if (up_pressed){
						if (pausedialogue_option_selected > 0){
							pausedialogue_option_selected --;
						}else{
							pausedialogue_option_selected = pausedialogue_option_max - 1;
						}
					
						pausedialogue_break = pausedialogue_option_selected_held_time >= pausedialogue_option_selected_held_time_max ? 6 : 12;
					}
					
					if (down_pressed){
						if (pausedialogue_option_selected < pausedialogue_option_max - 1){
							pausedialogue_option_selected ++;
						}else{
							pausedialogue_option_selected = 0;
						}
					
						pausedialogue_break = pausedialogue_option_selected_held_time >= pausedialogue_option_selected_held_time_max ? 6 : 12;
					}
				}
				
				if (up_pressed || down_pressed){
					if (pausedialogue_option_selected_held_time < pausedialogue_option_selected_held_time_max){
						pausedialogue_option_selected_held_time ++;
					}
				}else{
					pausedialogue_option_selected_held_time = 0;
				}
				
				if (!iskeyboard ? scr_input_is_pressed(InputBinding.Interact) : scr_input_is_pressed(InputBinding.Attack)){
					if (pausedialogue_option_selected != -1) && (pausedialogue_option_selected < pausedialogue_option_max){
						if (pausedialogue_type_option_cutscene[pausedialogue_option_selected] != -1){
							global.cutscene_current = pausedialogue_type_option_cutscene[pausedialogue_option_selected];
						}
				
						if (pausedialogue_type_option_traingoto[pausedialogue_option_selected] != -1){
							obj_controller_gameplay.cutscene_traingoto = pausedialogue_type_option_traingoto[pausedialogue_option_selected];
						}
				
						switch(pausedialogue_type_option_special[pausedialogue_option_selected]){
							case 0:
								global.game_combat_in_hordechallenge = true;
								global.game_combat_in_hordechallenge_time = 60 * 30;
								
								break;
						}
			
						obj_controller_gameplay.cutscene_trainstart_type = pausedialogue_type_option_trainstart_type[pausedialogue_option_selected];
						obj_controller_gameplay.cutscene_trainroom = pausedialogue_type_option_trainroom[pausedialogue_option_selected];
					
						pausedialogue = false;
						pausedialogue_option_selected_held_time = 0;
						scr_toggle_pause(false);
					}else if (pausedialogue_option_selected != -1) && (pausedialogue_option_selected == pausedialogue_option_max){
						pausedialogue = false;
						pausedialogue_option_selected_held_time = 0;
						scr_toggle_pause(false);
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

// Minimap
if (minimap_arrow_sine < 360){
	minimap_arrow_sine += minimap_arrow_sine_speed;
}else{
	minimap_arrow_sine = 0;
}