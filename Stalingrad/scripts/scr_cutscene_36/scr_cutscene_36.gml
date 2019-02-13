///scr_cutscene_36();
var index = 36, xTo = 352, yTo = 400;
var to = noone;
var eobj = noone;

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	eobj = inst_CD86886;
	
	if (instance_exists(eobj)){
		xTo = eobj.x;
		yTo = eobj.y;
	
		global.player.flashlight_move = false;
		global.player.flashlight_direction = point_direction(global.player.x, global.player.y, xTo, yTo);
		
		if (point_distance(global.player.x, global.player.y, xTo, yTo) < 105){
			global.cutscene_current = -1;
			global.player.move_xTo = -1;
			global.player.move_yTo = -1;
			eobj.fly_in_cutscene = false;
			eobj.fly_cutscene_prop = false;
		}else{
			eobj.fly_in_cutscene = true;
		}
	}
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}