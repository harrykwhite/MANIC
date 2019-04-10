scr_position_view();
scr_ui_rank_display_setup();
scr_ui_rank_display_update();

// Level opening
if (level_opening){
	if (level_opening_time > 0){
		level_opening_time --;
		
		if (level_opening_text_alpha < 1.25){
			level_opening_text_alpha += 0.015;
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
				global.game_pause = false;
				part_system_automatic_update(global.ps_bottom, false);
				part_system_automatic_update(global.ps_front, false);
			
				switch(pause_selected){
					case 1:
						part_system_clear(global.ps_front);
						part_system_clear(global.ps_bottom);
						
						var rslotcount = array_length_1d(global.weapon_slot);
						for(var i = 0; i < rslotcount; i ++){
							global.weapon_slot[i] = global.sectionstart_weapon[i];
							global.weapon_slotammo[i] = global.sectionstart_weaponammo[i];
						}
						
						global.game_combat_state = CombatState.Idle;
						global.player_health_current = global.sectionstart_playerhealth;
						global.weapon_slotcurrent = 0;
						room_restart();
						break;
					
					case 2:
						ds_grid_clear(global.player_companions, -1);
						scr_fade_object_list_reset();
						scr_global_set();
						audio_stop_all();
						room_goto(rm_title_0);
						break;
				}
			}
		}else{
			if (keyboard_check_pressed(ord("W"))) || (keyboard_check_pressed(vk_up)){
				if (pause_selected > 0){
					pause_selected --;
				}else{
					pause_selected = pause_selectedmax - 1;
				}
			}
	
			if (keyboard_check_pressed(ord("S"))) || (keyboard_check_pressed(vk_down)){
				if (pause_selected < pause_selectedmax - 1){
					pause_selected ++;
				}else{
					pause_selected = 0;
				}
			}
			
			if (keyboard_check_pressed(vk_enter)){
				switch(pause_selected){
					case 0:
						global.game_pause = false;
						pause_selected = 0;
						break;
			
					default:
						pause_has_selected = true;
						pause_has_selected_time = 0;
						break;
				}
			}
		}
	}else{
		// Pause Dialogue
		if (pausedialogue_time < 20){
			pausedialogue_time ++;
		}else{
			if (keyboard_check_pressed(obj_controller_all.key_interact)){
				pausedialogue = false;
				pausedialogue_time = 0;
				global.game_pause = false;
				exit;
			}
			
			if (keyboard_check_pressed(ord("W"))) || (keyboard_check_pressed(vk_up)){
				if (pausedialogue_option_selected > 0){
					pausedialogue_option_selected --;
				}else{
					pausedialogue_option_selected = pausedialogue_option_max - 1;
				}
			}
	
			if (keyboard_check_pressed(ord("S"))) || (keyboard_check_pressed(vk_down)){
				if (pausedialogue_option_selected < pausedialogue_option_max - 1){
					pausedialogue_option_selected ++;
				}else{
					pausedialogue_option_selected = 0;
				}
			}
	
			if (keyboard_check_pressed(vk_enter)){
				if (pausedialogue_type_option_cutscene[pausedialogue_option_selected] != -1){
					global.cutscene_current = pausedialogue_type_option_cutscene[pausedialogue_option_selected];
				}
				
				if (pausedialogue_type_option_traingoto[pausedialogue_option_selected] != -1){
					obj_controller_gameplay.cutscene_traingoto = pausedialogue_type_option_traingoto[pausedialogue_option_selected];
				}
			
				obj_controller_gameplay.cutscene_trainstart_type = pausedialogue_type_option_trainstart_type[pausedialogue_option_selected];
				obj_controller_gameplay.cutscene_trainroom = pausedialogue_type_option_trainroom[pausedialogue_option_selected];
				pausedialogue = false;
				global.game_pause = false;
			}
		}
	}
}

// Game Opening Intro
if (game_opening_intro){
	if (global.level_current != 0) || ((STATE == GameState.Developer) && (!global.game_playthrough)){
		game_opening_intro = false;
	}
	
	if (game_opening_intro_alpha > 0){
		game_opening_intro_alpha -= 0.005 * game_opening_intro_speed;
		game_opening_intro_text_time -= game_opening_intro_speed;
		
		if (game_opening_intro_text_time <= 0){
			game_opening_intro_text_alpha -= 0.0075 * game_opening_intro_speed;
			
			if (game_opening_intro_text_stage == 0){
				if (game_opening_intro_text_alpha <= 0){
					game_opening_intro_text_time = 60 * 2.9;
					game_opening_intro_text_stage = 1;
					game_opening_intro_text_alpha = -0.15;
				}
			}
		}else{
			game_opening_intro_text_alpha += 0.01 * game_opening_intro_speed;
		}
	}else{
		game_opening_intro = false;
	}
}

// Game Ending Screen
if (game_ending_screen){
	if (global.level_current != 0) || (STATE == GameState.Developer){
		game_ending_screen = false;
	}
	
	if (game_ending_screen_alpha < 1){
		game_ending_screen_alpha += 0.01;
	}else{
		if (game_ending_screen_text_alpha < 1){
			game_ending_screen_text_alpha += 0.01;
		}
	}
}