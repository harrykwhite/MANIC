var levelcur = global.level_current;
var slotcount = global.weapon_slotmax;

scr_position_view();
scr_inboss();

// Map found refresh
if (map_found_refresh_time > 0){
	map_found_refresh_time --;
}else{
	scr_map_found_fill();
	map_found_refresh_time = map_found_refresh_time_max;
}

// Level complete
if (!global.level_complete[levelcur]){
	global.level_complete[levelcur] = global.game_objective_complete;
}else{
	global.game_objective_complete = true;
}

// Recording checkpoint data
if (checkpoint_create) && (instance_exists(obj_player)){
	for(var i = 0; i < slotcount; i ++){
		global.checkpoint_weapon_slot[i] = global.weapon_slot[i];
		global.checkpoint_weapon_slotammo[i] = global.weapon_slotammo[i];
		global.checkpoint_weapon_slotquantity[i] = global.weapon_slotquantity[i];
	}

	global.checkpoint_starttype = global.game_level_opening_type;
	global.checkpoint_room = room;
	global.checkpoint_goto = false;
	
	obj_controller_ui.checkpoint_text_time = 60 * 5;
	
	checkpoint_create = false;
}

// Path grid
if (pathgrid_reset_time > 0){
	pathgrid_reset_time --;
}else{
	mp_grid_destroy(pathgrid);
	scr_pathmap_init();
	
	pathgrid_reset_time = pathgrid_reset_time_max;
}

// Managing corpse count
if (instance_number(obj_enemy_corpse) > global.game_option[| Options.MaxCorpses]){
	var head = ds_queue_head(corpse_queue);
	
	if (head != noone){
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
	if (weaponswitch_break > 0){
		weaponswitch_break --;
	}
	
	if (instance_exists(obj_player)){
		var weapon = noone;
		
		if (global.weapon_slot[global.weapon_slotcurrent] != -1){
			weapon = global.weapon_object[global.weapon_slot[global.weapon_slotcurrent]];
		}else{
			if (levelcur != Level.Prologue){
				weapon = global.weapon_object[PlayerWeapon.Knife];
			}
		}
		
		if (global.cutscene_current == -1) && (obj_player.move_x_to == -1 && (obj_player.move_y_to == -1)) && (weaponswitch_break <= 0){
			if (global.weapon_slot_standalone == -1){
				if (instance_exists(weapon)) || (weapon == noone){
					if (weapon != noone){
						if (global.weapon_type[global.weapon_slot[global.weapon_slotcurrent]] == WeaponType.Melee){
							if (weapon.attack_time > 0){
								return;
							}
						}
					
						if (global.weapon_type[global.weapon_slot[global.weapon_slotcurrent]] == WeaponType.Ranged){
							if (weapon.shoot_time > 0){
								return;
							}
						}
					}
					
					var switched = false;
					
					for(var i = 0; i < slotcount; i ++){
						if (global.weapon_slotcurrent == i){
							continue;
						}
						
						if (keyboard_check_pressed(ord(string(i + 1)))){
							obj_controller_mouse.mouse_scale = 2;
							scr_weapon_switch(false, i);
							switched = true;
							break;
						}
					}
					
					if (scr_input_is_pressed(InputBinding.SwitchWeaponBack)){
						obj_controller_mouse.mouse_scale = 2;
						scr_weapon_switch(false);
						switched = true;
					}else if (scr_input_is_pressed(InputBinding.SwitchWeaponForward)){
						obj_controller_mouse.mouse_scale = 2;
						scr_weapon_switch(true);
						switched = true;
					}
					
					if (switched){
						weaponswitch_break = 6;
						
						if (levelcur == Level.Prologue){
							with(obj_controller_ui){
								if (tutourial) && (tutourial_stage == TutourialStage.Switch) && (tutourial_stage_timer == -1){
									tutourial_stage_timer = 60 * 2;
								}
							}
						}
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

/* Score
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
}*/