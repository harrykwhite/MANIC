///scr_cutscene_2();
var index = 2;
var level = scr_get_level_object();

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	global.cutscene_camera_x[index] = level.spawn_x;
	global.cutscene_camera_y[index] = level.spawn_y;
	obj_player.flashlight_move = false;
	
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
	
	/*switch(room){
		case rm_level_1_00: obj_player.flashlight_direction = 270; obj_player.image_xscale = -1; break;
		case rm_level_2_00: obj_player.image_xscale = 1; break;
		case rm_level_2_01: obj_player.flashlight_direction = 270; obj_player.image_xscale = -1; break;
		case rm_level_2_02: obj_player.flashlight_direction = 270; obj_player.image_xscale = -1; break;
		case rm_level_3_00: obj_player.image_xscale = 1; break;
		case rm_level_3_01: obj_player.flashlight_direction = 270; obj_player.image_xscale = -1; break;
		case rm_level_3_02: obj_player.flashlight_direction = 360; obj_player.image_xscale = 1; break;
		case rm_level_4_00: obj_player.flashlight_direction = 270; obj_player.image_xscale = -1; break;
		case rm_level_4_01: obj_player.flashlight_direction = 270; obj_player.image_xscale = -1; break;
		case rm_level_5_00: obj_player.flashlight_direction = 90; obj_player.image_xscale = -1; break;
		case rm_level_5_01: obj_player.flashlight_direction = 90; obj_player.image_xscale = -1; break;
		case rm_level_5_02: obj_player.flashlight_direction = 180; obj_player.image_xscale = -1; break;
		case rm_level_5_03: obj_player.flashlight_direction = 180; obj_player.image_xscale = -1; break;
		case rm_level_5_04: obj_player.flashlight_direction = 180; obj_player.image_xscale = -1; break;
		case rm_level_6_00: obj_player.flashlight_direction = 90; obj_player.image_xscale = -1; break;
		case rm_level_7_00: obj_player.flashlight_direction = 360; obj_player.image_xscale = 1; break;
		case rm_level_7_01: obj_player.flashlight_direction = 360; obj_player.image_xscale = 1; break;
		case rm_level_7_02: obj_player.flashlight_direction = 360; obj_player.image_xscale = -1; break;
		case rm_level_8_00: obj_player.flashlight_direction = 90; obj_player.image_xscale = -1; break;
		case rm_level_8_01: obj_player.flashlight_direction = 90; obj_player.image_xscale = -1; break;
		case rm_level_8_02: obj_player.flashlight_direction = 90; obj_player.image_xscale = -1; break;
		case rm_level_9_00: obj_player.flashlight_direction = 90; obj_player.image_xscale = -1; break;
		case rm_level_9_01: obj_player.flashlight_direction = 90; obj_player.image_xscale = -1; break;
		case rm_level_9_02: obj_player.flashlight_direction = 90; obj_player.image_xscale = -1; break;
	}*/
	
	if (point_distance(obj_player.x, obj_player.y, level.spawn_x, level.spawn_y) < 60){
		obj_player.move_xTo = -1;
		obj_player.move_yTo = -1;
		obj_player.move_extSpd = 0;
		
		if (global.cutscene_time[index] < 40){
			global.cutscene_time[index] ++;
		}else{
			global.cutscene_current = -1;
			global.cutscene_time[index] = 0;
			global.player_respawn_x = obj_player.x;
			global.player_respawn_y = obj_player.y;
		}
	}else{
		obj_player.move_xTo = level.spawn_x;
		obj_player.move_yTo = level.spawn_y;
		obj_player.move_extSpd = obj_player.spd_max;
		obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, obj_player.move_xTo, obj_player.move_yTo);
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}