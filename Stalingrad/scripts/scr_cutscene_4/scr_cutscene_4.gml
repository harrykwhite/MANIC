///scr_cutscene_4();
var index = 4;
var level = scr_get_level_object();

global.cutscene_camera_x[index] = 967;
global.cutscene_camera_y[index] = room_height;

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

with(level){
	
	if (!audio_is_playing(spawn_music_main[CombatState.Idle])){
		audio_play_sound(spawn_music_main[CombatState.Idle], 3, true);
	}
}

switch(global.cutscene_time[index]){
	
	case 0: 
		
		// Make the player move to the portal.
		if (instance_exists(global.player)){
			global.player.move_xTo = global.player.x;
			global.player.move_yTo = room_height + 40;
			global.player.move_extSpd = global.player.spd_max;
			
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
			instance_destroy(global.player);
			level.prison_explode_time_sec = -1;
			
		}else{
			
			// Activate the results screen on obj_controller_ui.
			if (instance_exists(obj_controller_ui)){
				obj_controller_ui.rank_display_draw = true;
			}
		}
		
		break;
}