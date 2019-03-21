scr_position_view();
scr_inboss()

// Recording level and section start data
if (!levelstart_record_set){
	if (room == rm_level_1_00) || (room == rm_level_2_00) || (room == rm_level_3_00) || (room == rm_level_4_00) || (room == rm_level_5_00) || (room == rm_level_6_00) || (room == rm_level_7_00) || (room == rm_level_8_00) || (room == rm_level_9_00) || (room == rm_level_10_00){
		global.levelstart_weapon[0] = global.weapon_slot[0];
		global.levelstart_weapon[1] = global.weapon_slot[1];
		levelstart_record_set = true;
	}
}

if (!sectionstart_record_set){
	global.sectionstart_weapon[0] = global.weapon_slot[0];
	global.sectionstart_weapon[1] = global.weapon_slot[1];
	global.sectionstart_weaponammo[0] = global.weapon_slotammo[0];
	global.sectionstart_weaponammo[1] = global.weapon_slotammo[1];
	global.sectionstart_playerhealth = global.player_healthCurrent;
	sectionstart_record_set = true;
}

// Fade Object
scr_fade_object_control();

// Cutscene Control
if (global.cutscene_current != -1){
	script_execute(global.cutscene_script[global.cutscene_current]);
}

// Game Pausing
if (global.cutscene_current == -1) && (instance_exists(global.player)){
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
				global.player_companion = -1;
				global.player_companion_health = -1;
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
global.player_healthCurrent = clamp(global.player_healthCurrent, 0, global.player_healthMax);

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
	if (instance_exists(global.player)){
    
	    // Switching
		var weapon;
		
		if (global.weapon_slot[global.weapon_slotcurrent] != -1){
			weapon = global.weapon_object[global.weapon_slot[global.weapon_slotcurrent]];
		}else{
			weapon = global.weapon_object[4];
		}
		
		if (global.cutscene_current == -1) && (global.player.move_xTo == -1 && (global.player.move_yTo == -1)){
			if (global.weapon_slot_standalone == -1){
				if (instance_exists(weapon)){
					if (global.weapon_type[global.weapon_slot[global.weapon_slotcurrent]] == WeaponType.Melee){ if (weapon.attack_time > 0){exit;}}
					if (global.weapon_type[global.weapon_slot[global.weapon_slotcurrent]] == WeaponType.Ranged){ if (weapon.shoot_time > 0){exit;}}
					
					if (mouse_wheel_up()) || (mouse_wheel_down()){
						obj_controller_mouse.mouse_scale = 2;
						scr_weapon_switch();
						scr_ui_alpha_reset();
					}
				}
			}else{
				obj_controller_mouse.mouse_scale = 2;
				scr_weapon_switch();
			}
		}
	}
}

// Score
global.game_score  = 
global.game_score_bonus +
global.game_score_artifacts +
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