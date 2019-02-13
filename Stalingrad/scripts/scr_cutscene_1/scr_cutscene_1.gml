///scr_cutscene_1();
var index = 1;
var level = scr_get_level_object();

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (global.cutscene_time[index] < 60){
	global.cutscene_time[index]++;
	
	global.cutscene_camera_x[index] = level.objective_type_complete_portal_x[global.game_objective_current];
	global.cutscene_camera_y[index] = level.objective_type_complete_portal_y[global.game_objective_current];
	
	if (instance_exists(obj_controller_camera)){
		obj_controller_camera.camera_screenshake = false;
	}
	
	if (instance_exists(global.player)){
		global.player.move_xTo = -1;
		global.player.move_yTo = -1;
		global.player.move_extSpd = 0;
	}
	
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}