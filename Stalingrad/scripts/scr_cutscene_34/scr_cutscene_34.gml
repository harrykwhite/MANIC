///scr_cutscene_34();
var index = 34, xTo = 462, yTo = 417;
var to = noone;
var eobj = noone;

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	eobj = inst_54E65221;
	
	if (instance_exists(eobj)){
		xTo = eobj.x;
		yTo = eobj.y;
	
		global.player.flashlight_move = false;
		global.player.flashlight_direction = point_direction(global.player.x, global.player.y, xTo, yTo);
		
		if (point_distance(global.player.x, global.player.y, xTo, yTo) < 75){
			global.cutscene_current = -1;
			global.player.move_xTo = -1;
			global.player.move_yTo = -1;
			eobj.crazy_in_cutscene = false;
			eobj.crazy_cutscene_prop = false;
		}else{
			eobj.crazy_in_cutscene = true;
		}
	}
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}