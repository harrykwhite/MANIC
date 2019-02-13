var length = array_length_1d(objective_title);

if (instance_exists(global.player)){
	switch(objective_type[global.game_objective_current]){
		case ObjectiveType.Location:
			
			if (point_distance(global.player.x, global.player.y,
			objective_type_location_x[global.game_objective_current],
			objective_type_location_y[global.game_objective_current])
			<= objective_type_location_distance[global.game_objective_current]){
				
				if (global.game_objective_current < array_length_1d(objective_title)){
					global.game_objective_current++;
					objective_update = true;
					obj_controller_ui.objective_text_set = false;
					scr_game_objective_ui_update();
					exit;
				}
			}
			
			break;
		
		case ObjectiveType.Kill:
			if (objective_type_kill_number[global.game_objective_current] <= 0){
				if (global.game_objective_current < array_length_1d(objective_title)){
					objective_update = true;
					
					global.game_objective_current++;
					obj_controller_ui.objective_text_set = false;
					scr_game_objective_ui_update();
					
					if (objective_type[global.game_objective_current] == ObjectiveType.Clear){
						var play = true;
						global.game_combat_state = CombatState.Idle;
						obj_controller_ui.leveltext_alpha = 0;
						obj_controller_ui.leveltext_time = 60 * 3.5;
						obj_controller_ui.leveltext_other = true;
						obj_controller_ui.leveltext_text = "Area Cleared";
						
						if (global.game_objective_current > 0){
							if (objective_type[global.game_objective_current - 1] == ObjectiveType.Clear){
								play = false;
							}
						}
						
						if (play){
							audio_play_sound(spawn_music_stinger[2], 3, false);
						}
					}
					
					if (global.level_current == 5) && (room != rm_level_6_01){
						if (global.game_objective_current == 1){
							while(!instance_exists(objective_special_boss_object)){
								objective_special_boss_object = instance_create(camera_get_view_x(view_camera[0]) - 100, 280, obj_enemy_0);
								objective_special_boss_object.type = EnemyOneType.SniperBoss;
								objective_special_boss_object.weapon_index = PawnWeapon.SniperRifle;
							}
							
							global.cutscene_current = 37;
						}
					}
					
					exit;
				}
			}
			
			break;
	}
	
	if (instance_exists(obj_controller_ui)){
		scr_game_objective_ui_update();
	}
}