scr_position_view();
scr_inboss();

global.player_has_bossrespawn = global.boss_current != -1;

// Level clear
//if (keyboard_check_pressed(vk_left)){
//	global.level_kill_count[global.level_current] += 10;
//}

if (!levelclear_called){
	if (global.level_cleared[global.level_current]){
		levelclear_called = true;
		return;
	}
	
	if (global.level_current == 9){
		levelclear_called = true;
		return;
	}
	
	if (global.level_kill_count[global.level_current] >= global.level_kill_max[global.level_current]){
		obj_controller_ui.levelcleared_time = 60 * 3.5;
		global.level_cleared[global.level_current] = true;
		levelclear_called = true;
		
		var level = scr_get_level_object();
		with(level){
			global.game_combat_state = CombatState.Idle;
			global.game_combat_state_time_real = 0;
			
			audio_play_sound(spawn_music_stinger[2], 3, false);
			
			audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 0);
			audio_sound_gain(spawn_music_main[CombatState.Idle], 1 * obj_controller_all.real_music_volume, 8000);
			audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 2000);
			audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 2000);
		}
	}
}

if (global.level_cleared[global.level_current]){
	global.level_kill_count[global.level_current] = global.level_kill_max[global.level_current];
}

// Recording level and section start data
if (!sectionstart_record_set){
	var rslotcount = array_length_1d(global.weapon_slot);
	for(var i = 0; i < rslotcount; i ++){
		global.sectionstart_weapon[i] = global.weapon_slot[i];
		global.sectionstart_weaponammo[i] = global.weapon_slotammo[i];
		
		global.sectionstart_weaponquantity[i] = -1;
		if (global.weapon_slot[i] != -1){
			if (global.weapon_type[global.weapon_slot[i]] == WeaponType.Throwing){
				global.sectionstart_weaponquantity[i] = global.weapon_quantity[global.weapon_slot[i]];
			}
		}
	}
	
	global.sectionstart_playerhealth = global.player_health_current;
	sectionstart_record_set = true;
}

// Managing corpse count
if (instance_number(obj_enemy_corpse) > global.game_option[| Options.MaxCorpses]){
	var head = ds_queue_head(corpse_queue);
	
	if (head != undefined){
		if (instance_exists(head)){
			instance_destroy(head);
			ds_queue_dequeue(corpse_queue);
		}
	}
}

// Fade Object
scr_fade_object_control();

// Cutscene Control
if (global.cutscene_current != -1){
	script_execute(global.cutscene_script[global.cutscene_current]);
}

// Game Pausing
if (global.cutscene_current == -1) && (instance_exists(obj_player)){
    if (keyboard_check_pressed(vk_escape)){
        global.game_pause = !global.game_pause;
		part_system_automatic_update(global.ps_bottom, !global.game_pause);
		part_system_automatic_update(global.ps_front, !global.game_pause);
    }
	
	if (global.game_pause){
		if (keyboard_check(vk_escape)){
			if (pause_time < 1){
				pause_time += 0.025;
			}else{
				ds_grid_clear(global.player_companions, -1);
				scr_fade_object_list_reset();
				scr_global_set();
				audio_stop_all();
				room_goto(rm_title_0);
			}
		}else{
			pause_time = 0;
		}
	}
}

// Value Controlling
global.player_health_current = clamp(global.player_health_current, 0, global.player_health_max);

if (!global.game_pause){
	
	// Game Time
	global.game_time_passed ++;
	
	// Player Stamina
	if (global.player_stamina_break <= 0){
	    if (global.player_stamina_current < global.player_stamina_max){
	        global.player_stamina_current ++;
	    }else{
	        global.player_stamina_active = true;
	    }
    
	    global.player_stamina_current = clamp(global.player_stamina_current, 0, global.player_stamina_max);
    
	}else{
	    global.player_stamina_break--;
	}

	if (global.player_stamina_current <= 1){
	    global.player_stamina_active = false;
	}
	
	// Weapon Switching
	if (instance_exists(obj_player)){
    
	    // Switching
		var weapon;
		
		if (global.weapon_slot[global.weapon_slotcurrent] != -1){
			weapon = global.weapon_object[global.weapon_slot[global.weapon_slotcurrent]];
		}else{
			weapon = global.weapon_object[4];
		}
		
		if (global.cutscene_current == -1) && (obj_player.move_xTo == -1 && (obj_player.move_yTo == -1)){
			if (global.weapon_slot_standalone == -1){
				if (instance_exists(weapon)){
					if (global.weapon_type[global.weapon_slot[global.weapon_slotcurrent]] == WeaponType.Melee){ if (weapon.attack_time > 0){return;}}
					if (global.weapon_type[global.weapon_slot[global.weapon_slotcurrent]] == WeaponType.Ranged){ if (weapon.shoot_time > 0){return;}}
					
					if (mouse_wheel_up()){
						obj_controller_mouse.mouse_scale = 2;
						scr_weapon_switch(false);
					}else if (mouse_wheel_down()){
						obj_controller_mouse.mouse_scale = 2;
						scr_weapon_switch(true);
					}
				}
			}else{
				scr_weapon_switch(true);
			}
		}
	}
}

// Time
if (!global.game_pause){
	if (counter < 60){
		counter += realtime;
	}else{
		global.game_save_seconds ++;
		counter = 0;
	}
}

// Score
global.game_score  = 
global.game_score_bonus +
global.game_score_collectables +
global.game_score_deaths +
global.game_score_wpnvariation;

if (bonus_killtime > 0){
	bonus_killtime--;

}else{
	
	switch(bonus_killamount){
		case 2:
			scr_bonuspoints_update(BonusPoints.DoubleKill);
			break;
		
		case 3:
			scr_bonuspoints_update(BonusPoints.TripleKill);
			break;
		
		case 4:
			scr_bonuspoints_update(BonusPoints.QuadripleKill);
			break;
	}
	
	bonus_killamount = 0;
	bonus_killtime = 0;
}