///scr_cutscene_39();
var index = 39, xTo = 0, yTo = 0;
var to = noone;
var cobj = noone;
var levelobj = scr_get_level_object();

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	cobj = obj_companion_corpse;
	
	if (instance_exists(cobj)){
		xTo = cobj.x;
		yTo = cobj.y;
	
		global.player.flashlight_move = false;
		global.player.flashlight_direction = point_direction(global.player.x, global.player.y, xTo, yTo);
	}else{
		global.cutscene_current = -1;
		global.player.move_xTo = -1;
		global.player.move_yTo = -1;
	}
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}