///scr_cutscene_37();
var index = 37, x_to = 0, y_to = 0;
var eobj = noone;
var levelobject = scr_get_level_object();

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	var maxtime = 45;
	eobj = levelobject.trainboss_leader;
	
	/*if (eobj == noone){
		eobj = levelobject.trainboss_trainhead;
		maxtime = 100;
		x_to += 20;
	}*/
	
	if (instance_exists(eobj)){
		x_to = x_to + eobj.x;
		y_to = y_to + eobj.y;
		obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, x_to, y_to);
		
		if (global.cutscene_time[index] < maxtime){
			global.cutscene_time[index] ++;
		}else{
			global.cutscene_time[index] = 0;
			global.cutscene_current = -1;
			obj_player.move_x_to = -1;
			obj_player.move_y_to = -1;
		}
	}
	
	global.cutscene_camera_x[index] = x_to;
	global.cutscene_camera_y[index] = y_to;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}