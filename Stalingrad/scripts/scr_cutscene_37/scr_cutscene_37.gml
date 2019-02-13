///scr_cutscene_37();
var index = 37, xTo = 0, yTo = 0;
var to = noone;
var eobj = noone;
var levelobject = scr_get_level_object();

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	eobj = levelobject.objective_special_boss_object;
	
	if (instance_exists(eobj)){
		xTo = eobj.x;
		yTo = eobj.y;
	
		global.player.flashlight_move = false;
		global.player.flashlight_direction = point_direction(global.player.x, global.player.y, xTo, yTo);
		
		if (point_distance(global.player.x, global.player.y, xTo, yTo) < 125){
			global.cutscene_current = -1;
			global.player.move_xTo = -1;
			global.player.move_yTo = -1;
		}
	}
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}