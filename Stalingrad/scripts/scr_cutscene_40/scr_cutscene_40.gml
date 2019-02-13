///scr_cutscene_40();
var index = 40, xTo = 260, yTo = 548;
var to = noone;

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	global.player.flashlight_move = false;
	global.player.flashlight_direction = point_direction(global.player.x, global.player.y, xTo, yTo);
	
	if (global.cutscene_time[index] < 70){
		global.cutscene_time[index] ++;
	}else{
		global.cutscene_current = -1;
		global.player.move_xTo = -1;
		global.player.move_yTo = -1;
		global.player_companion = 0;
	}
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}