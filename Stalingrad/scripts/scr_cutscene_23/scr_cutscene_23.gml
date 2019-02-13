///scr_cutscene_23();
var index = 23;
var xTo = room_width, yTo = 639;
var dir = 0;

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	yTo = global.player.y;
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
	global.player.flashlight_move = false;
	global.player.flashlight_direction = 360;
	
	if (point_distance(global.player.x, global.player.y, xTo + 60, yTo) < 40){
		obj_controller_ui.rank_display_draw = true;
		instance_destroy(global.player);
	}else{
		global.player.move_xTo = xTo + 100;
		global.player.move_yTo = yTo;
		global.player.move_extSpd = global.player.spd_max;
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}