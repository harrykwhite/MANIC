///scr_cutscene_43();
var index = 43, x_to = 656, y_to = 320;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	global.cutscene_camera_x[index] = x_to;
	global.cutscene_camera_y[index] = y_to;
	obj_player.flashlight_move = false;
	obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, x_to, y_to);
	
	if (global.cutscene_time[index] < 70){
		global.cutscene_time[index] ++;
	}else{
		global.cutscene_current = -1;
		obj_player.move_x_to = -1;
		obj_player.move_y_to = -1;
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}