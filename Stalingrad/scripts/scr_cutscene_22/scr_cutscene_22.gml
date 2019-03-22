///scr_cutscene_22();
var index = 22;
var xTo = 673, yTo = 253;
var dir = 0;

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(obj_player)){
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
	obj_player.flashlight_move = false;
	obj_player.flashlight_direction = 90;
	
	if (point_distance(obj_player.x, obj_player.y, xTo, yTo) < 12){
		obj_player.move_extSpd = 0;
		obj_player.sprite_index = spr_player_idle_1;
		obj_player.image_speed = 0;
		obj_player.image_index = 0;
		if (global.cutscene_time[index] < 40){
			global.cutscene_time[index] ++;
		}else{
			obj_controller_ui.area_next_fade = true;
			obj_controller_ui.area_next_room = rm_level_6_01;
			global.game_level_opening_type = 0;
		}
	}else{
		obj_player.move_xTo = xTo;
		obj_player.move_yTo = yTo - 10;
		obj_player.move_extSpd = obj_player.spd_max;
	}
	
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}