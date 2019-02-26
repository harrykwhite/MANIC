///scr_cutscene_2();
var index = 2;
var level = scr_get_level_object();

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){

	global.cutscene_camera_x[index] = level.spawn_x;
	global.cutscene_camera_y[index] = level.spawn_y;
	global.player.flashlight_move = false;
	
	if (obj_controller_ui.screen_fade_opening >= 1){
		exit;
	}
	
	if (obj_controller_ui.game_opening_intro){
		if (obj_controller_ui.game_opening_intro_alpha >= 1){
			exit;
		}
	}
	
	/*switch(room){
		case rm_level_1_00: global.player.flashlight_direction = 270; global.player.image_xscale = -1; break;
		case rm_level_2_00: global.player.image_xscale = 1; break;
		case rm_level_2_01: global.player.flashlight_direction = 270; global.player.image_xscale = -1; break;
		case rm_level_2_02: global.player.flashlight_direction = 270; global.player.image_xscale = -1; break;
		case rm_level_3_00: global.player.image_xscale = 1; break;
		case rm_level_3_01: global.player.flashlight_direction = 270; global.player.image_xscale = -1; break;
		case rm_level_3_02: global.player.flashlight_direction = 360; global.player.image_xscale = 1; break;
		case rm_level_4_00: global.player.flashlight_direction = 270; global.player.image_xscale = -1; break;
		case rm_level_4_01: global.player.flashlight_direction = 270; global.player.image_xscale = -1; break;
		case rm_level_5_00: global.player.flashlight_direction = 90; global.player.image_xscale = -1; break;
		case rm_level_5_01: global.player.flashlight_direction = 90; global.player.image_xscale = -1; break;
		case rm_level_5_02: global.player.flashlight_direction = 180; global.player.image_xscale = -1; break;
		case rm_level_5_03: global.player.flashlight_direction = 180; global.player.image_xscale = -1; break;
		case rm_level_5_04: global.player.flashlight_direction = 180; global.player.image_xscale = -1; break;
		case rm_level_6_00: global.player.flashlight_direction = 90; global.player.image_xscale = -1; break;
		case rm_level_7_00: global.player.flashlight_direction = 360; global.player.image_xscale = 1; break;
		case rm_level_7_01: global.player.flashlight_direction = 360; global.player.image_xscale = 1; break;
		case rm_level_7_02: global.player.flashlight_direction = 270; global.player.image_xscale = -1; break;
		case rm_level_8_00: global.player.flashlight_direction = 90; global.player.image_xscale = -1; break;
		case rm_level_8_01: global.player.flashlight_direction = 90; global.player.image_xscale = -1; break;
		case rm_level_8_02: global.player.flashlight_direction = 90; global.player.image_xscale = -1; break;
		case rm_level_9_00: global.player.flashlight_direction = 90; global.player.image_xscale = -1; break;
		case rm_level_9_01: global.player.flashlight_direction = 90; global.player.image_xscale = -1; break;
		case rm_level_9_02: global.player.flashlight_direction = 90; global.player.image_xscale = -1; break;
	}*/
	
	if (point_distance(global.player.x, global.player.y, level.spawn_x, level.spawn_y) < 40){
		global.player.move_xTo = -1;
		global.player.move_yTo = -1;
		global.player.move_extSpd = 0;
		
		if (global.cutscene_time[index] < 50){
			global.cutscene_time[index]++;
		}else{
			global.cutscene_current = -1;
			global.cutscene_time[index] = 0;
			global.player_respawn_x = global.player.x;
			global.player_respawn_y = global.player.y;
		}
	}else{
		global.player.move_xTo = level.spawn_x;
		global.player.move_yTo = level.spawn_y;
		global.player.move_extSpd = global.player.spd_max;
		global.player.flashlight_direction = point_direction(global.player.x, global.player.y, global.player.move_xTo, global.player.move_yTo);
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}