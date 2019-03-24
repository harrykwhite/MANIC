///scr_cutscene_43();
var index = 43, xTo = 656, yTo = 320;
var to = noone;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
	obj_player.flashlight_move = false;
	obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, xTo, yTo);
	
	if (global.cutscene_time[index] < 70){
		global.cutscene_time[index] ++;
	}else{
		global.cutscene_current = -1;
		obj_player.move_xTo = -1;
		obj_player.move_yTo = -1;
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}