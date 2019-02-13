scr_position_view();
scr_ui_rank_display_setup();
scr_ui_rank_display_update();

// Screen Blend
if (screenblend_draw == true){
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

// Objective Display
objective_text_scale = approach(objective_text_scale, 1, 10);

if (!global.game_pause){
	pause_selected = 0;
	if (objective_text_red_alpha > 0){
		objective_text_red_alpha -= 0.0165;
	}

	// Title Text
	if (global.cutscene_current == -1) &&
	((room == rm_level_1_00) ||
	(room == rm_level_2_00) ||
	(room == rm_level_3_00) ||
	(room == rm_level_4_00) ||
	(room == rm_level_5_00) ||
	(room == rm_level_6_00) ||
	(room == rm_level_7_00) ||
	(room == rm_level_8_00)){
		if (leveltext_other == false){
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
			leveltext_alpha -= 0.05 ;
		}
	}

	// Score
	score_scale = approach(score_scale, 1, 20);
	score_shake *= 0.9;
	score_shake = max(score_shake, 0);

	if (score_current < global.game_score){
		score_current += 50;
	}
	
// Pause
}else{
	if (keyboard_check_pressed(ord("W"))) or (keyboard_check_pressed(vk_up)){
		if (pause_selected > 0){
			pause_selected --;
		}else{
			pause_selected = pause_selectedmax - 1;
		}
	}
	
	if (keyboard_check_pressed(ord("S"))) or (keyboard_check_pressed(vk_down)){
		if (pause_selected < pause_selectedmax - 1){
			pause_selected ++;
		}else{
			pause_selected = 0;
		}
	}
	
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
					global.weapon_slot[0] = global.sectionstart_weapon[0];
					global.weapon_slotammo[0] = global.sectionstart_weaponammo[0];
					
					global.weapon_slot[1] = global.sectionstart_weapon[1];
					global.weapon_slotammo[1] = global.sectionstart_weaponammo[1];
					
					global.player_healthCurrent = global.sectionstart_playerhealth;
					global.weapon_slotcurrent = 0;
					room_restart();
					break;
				
				case 2:
					part_system_clear(global.ps_front);
					part_system_clear(global.ps_bottom);
					global.weapon_slot[0] = global.levelstart_weapon[0];
					global.player_healthCurrent = global.player_healthMax;
					if (global.weapon_slot[0] != -1){
						global.weapon_slotammo[0] = global.weapon_ammomax[global.weapon_slot[0]];
					}else{
						global.weapon_slotammo[0] = -1;
					}
					
					global.weapon_slot[1] = global.levelstart_weapon[1];
					if (global.weapon_slot[1] != -1){
						global.weapon_slotammo[1] = global.weapon_ammomax[global.weapon_slot[1]];
					}else{
						global.weapon_slotammo[1] = -1;
					}
					
					global.weapon_slotcurrent = 0;
					switch(global.level_current){
						case 0:
							room_goto(rm_level_1_00);
							break;
						
						case 1:
							room_goto(rm_level_2_00);
							break;
						
						case 2:
							room_goto(rm_level_3_00);
							break;
						
						case 3:
							room_goto(rm_level_4_00);
							break;
						
						case 4:
							room_goto(rm_level_5_00);
							break;
						
						case 5:
							room_goto(rm_level_6_00);
							break;
						
						case 6:
							room_goto(rm_level_7_00);
							break;
						
						case 7:
							room_goto(rm_level_8_00);
							break;
					}
					break;
				
				case 3:
					scr_fade_object_list_reset();
					scr_global_set();
					audio_stop_all();
					room_goto(rm_title_0);
					break;
			}
		}
	}else{
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
			game_opening_intro_text_alpha -= 0.01 * game_opening_intro_speed;
			
			if (game_opening_intro_text_stage == 0){
				if (game_opening_intro_text_alpha <= 0){
					game_opening_intro_text_time = 60 * 3.85;
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
		game_ending_screen_alpha += 0.01 ;
	}else{
		
		if (game_ending_screen_text_alpha < 1){
			game_ending_screen_text_alpha += 0.01 ;
		}
	}
}