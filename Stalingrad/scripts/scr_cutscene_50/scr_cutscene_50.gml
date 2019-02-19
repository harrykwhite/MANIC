///scr_cutscene_50();
var index = 50, xTo = 714, yTo = -80;
var to = noone;

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
	global.player.flashlight_move = false;
	global.player.flashlight_direction = point_direction(global.player.x, global.player.y, xTo, -120);
	
	if (point_distance(global.player.x, global.player.y, xTo, -80) < 10){		
		obj_controller_ui.rank_display_draw = true;
		instance_destroy(global.player);
	}else{
		global.player.move_xTo = xTo;
		global.player.move_yTo = -120;
		global.player.move_extSpd = global.player.spd_max;
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}