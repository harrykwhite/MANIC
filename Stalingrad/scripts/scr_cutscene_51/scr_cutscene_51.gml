///scr_cutscene_51();
var index = 51;
var xTo = 712, yTo = 2020;
var dir = 0;

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
	global.player.flashlight_move = false;
	global.player.flashlight_direction = 90;
	
	if (point_distance(global.player.x, global.player.y, xTo, yTo) < 12){
		global.player.move_extSpd = 0;
		global.player.sprite_index = spr_player_idle_1;
		global.player.image_speed = 0;
		global.player.image_index = 0;
		
		if (global.cutscene_time[index] < 30){
			global.cutscene_time[index] ++;
		}else{
			instance_destroy(global.player);
		}
	}else{
		global.player.move_xTo = xTo;
		global.player.move_yTo = yTo - 10;
		global.player.move_extSpd = global.player.spd_max;
	}
}else{
	if (global.cutscene_time[index] < 60){
		global.cutscene_time[index] ++;
	}else{
		global.level_current = 3;
		global.game_level_opening_type = 1;
		obj_controller_ui.area_next_fade = true;
		obj_controller_ui.area_next_room = rm_level_4_00;
	}
}