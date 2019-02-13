///scr_cutscene_0();
var index = 0;
var level = scr_get_level_object();

global.cutscene_camera_x[index] = level.objective_type_complete_portal_x[global.game_objective_current];
global.cutscene_camera_y[index] = level.objective_type_complete_portal_y[global.game_objective_current];

with(level){
	
	if (!audio_is_playing(spawn_music_main[CombatState.Idle])){
		audio_play_sound(spawn_music_main[CombatState.Idle], 3, true);
	}
}

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	switch(global.cutscene_time[index]){
		case 0: 
		
			// Make the player move towards the portal.
			if (instance_exists(global.player)){
				global.player.move_xTo = level.objective_type_complete_portal_x[global.game_objective_current];
				global.player.move_yTo = level.objective_type_complete_portal_y[global.game_objective_current];
				global.player.move_extSpd = 0.4;
			
				if (point_distance(global.player.x, global.player.y, global.player.move_xTo, global.player.move_yTo) < 40){
					global.cutscene_time[index] = 1;
				
					if (instance_exists(obj_controller_ui)){
						obj_controller_ui.playerlight_draw = false;
					}
				}
			}
		
			break;
	
		case 1:
		
			// Make the player fade out and be destroyed.
			if (instance_exists(global.player)){
				if (global.player.image_alpha > 0){
					global.player.image_alpha -= 0.01 ;
				}else{
					instance_destroy(global.player);
					
					if (instance_exists(obj_controller_ui)){
						obj_controller_ui.rank_display_draw = true;
					}
					
					exit;
				}
			
			}
		
			break;
	}

	var dir = point_direction(global.player.x, global.player.y, global.player.move_xTo, global.player.move_yTo);
	global.player.flashlight_direction = dir;

	if (dir > 270) || (dir < 90){
		global.player.image_xscale = 1;
	}else{
		global.player.image_xscale = -1;
	}
}