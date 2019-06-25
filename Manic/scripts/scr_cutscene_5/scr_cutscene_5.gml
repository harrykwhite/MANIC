///scr_cutscene_5();
var index = 5;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	if (global.cutscene_time[index] < 120){
		global.cutscene_time[index] ++;
		
		global.cutscene_camera_x[index] = 985;
		global.cutscene_camera_y[index] = 1096;
		
	}else{
		global.cutscene_current = -1;
		global.cutscene_time[index] = 0;
	}
	
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}