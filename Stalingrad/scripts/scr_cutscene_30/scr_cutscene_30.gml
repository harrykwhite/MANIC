///scr_cutscene_30();
var index = 30, xTo = 0, yTo = -80;
var to = noone;

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	xTo = global.player.x;
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
	global.player.flashlight_move = false;
	global.player.flashlight_direction = point_direction(global.player.x, global.player.y, xTo, -80);
	
	if (point_distance(global.player.x, global.player.y, xTo, -60) < 10){		
		obj_controller_ui.area_next_fade = true;
		obj_controller_ui.area_next_room = rm_level_8_01;
		global.game_level_opening_type = 0;
	}else{
		global.player.move_xTo = xTo;
		global.player.move_yTo = -80;
		global.player.move_extSpd = global.player.spd_max;
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}