///scr_cutscene_9();
var index = 9;

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	if (global.cutscene_time[index] < 60){
		global.cutscene_time[index] ++;
		
		global.cutscene_camera_x[index] = 779;
		global.cutscene_camera_y[index] = 984;
		
	}else{
		global.cutscene_current = -1;
		global.cutscene_time[index] = 0;
	}
	
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}