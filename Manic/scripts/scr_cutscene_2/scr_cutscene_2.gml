///scr_cutscene_2();
var index = 2;
var level = scr_level_get_object();

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	global.cutscene_camera_x[index] = level.spawn_x;
	global.cutscene_camera_y[index] = level.spawn_y;
	
	if (obj_controller_ui.screen_fade_opening >= 1){
		return;
	}
	
	if (obj_controller_ui.level_opening_time > 10){
		return;
	}
	
	if (obj_controller_ui.game_opening_intro){
		if (obj_controller_ui.game_opening_intro_alpha >= 1){
			return;
		}
	}
	
	if (point_distance(obj_player.x, obj_player.y, level.spawn_x, level.spawn_y) < 60){
		var wait = 40;
		
		if (room == rm_level_6_pre_00){
			if (global.game_level_opening_type == 0){
				wait += 40;
			}
		}
		
		obj_player.move_x_to = -1;
		obj_player.move_y_to = -1;
		obj_player.move_extSpd = 0;
		
		if (global.cutscene_time[index] < wait){
			global.cutscene_time[index] ++;
		}else{
			global.cutscene_current = -1;
			global.cutscene_time[index] = 0;
			global.player_respawn_x = obj_player.x;
			global.player_respawn_y = obj_player.y;
		}
	}else{
		obj_player.move_x_to = level.spawn_x;
		obj_player.move_y_to = level.spawn_y;
		obj_player.move_extSpd = obj_player.spd_max;
		obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, obj_player.move_x_to, obj_player.move_y_to);
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}