///scr_cutscene_40();
var index = 40, x_to = cutscene_look_x, y_to = cutscene_look_y;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	var has_look_object = (cutscene_look_object != noone) && (instance_exists(cutscene_look_object));
	
	if (has_look_object){
		x_to = cutscene_look_object.x;
		y_to = cutscene_look_object.y;
	}
	
	obj_player.flashlight_move = false;
	obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, x_to, y_to);
	
	if (global.cutscene_time[index] < cutscene_look_time){
		global.cutscene_time[index] ++;
		if (has_look_object) && (cutscene_look_prop){
			cutscene_look_object.in_cutscene = true;
			cutscene_look_object.cutscene_prop = true;
		}
	}else{
		global.cutscene_time[index] = 0;
		global.cutscene_current = -1;
		obj_player.move_x_to = -1;
		obj_player.move_y_to = -1;
		if (has_look_object) && (cutscene_look_prop){
			cutscene_look_object.in_cutscene = false;
			cutscene_look_object.cutscene_prop = false;
		}
		cutscene_look_object = noone;
		cutscene_look_boss = -1;
		cutscene_look_prop = false;
	}
	
	global.cutscene_camera_x[index] = x_to;
	global.cutscene_camera_y[index] = y_to;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}