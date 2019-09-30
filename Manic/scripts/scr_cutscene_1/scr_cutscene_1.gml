///scr_cutscene_1();
var index = 1;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	global.cutscene_camera_x[index] = obj_player.x;
	global.cutscene_camera_y[index] = obj_player.y;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}