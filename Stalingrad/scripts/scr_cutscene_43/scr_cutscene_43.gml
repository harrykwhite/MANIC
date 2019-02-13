///scr_cutscene_43();
var index = 43, xTo = 656, yTo = 320;
var to = noone;

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
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
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}