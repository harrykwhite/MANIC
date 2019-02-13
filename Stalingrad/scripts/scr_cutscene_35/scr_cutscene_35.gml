///scr_cutscene_35();
var index = 35, xTo = 986, yTo = 768;
var to = noone;
var eobj = noone;
var levelobj = scr_get_level_object();

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	eobj = inst_2628B10A;
	
	if (instance_exists(eobj)){
		xTo = eobj.x;
		yTo = eobj.y;
		
		global.player.flashlight_move = false;
		global.player.flashlight_direction = point_direction(global.player.x, global.player.y, xTo, yTo);
		
		if (point_distance(global.player.x, global.player.y, xTo, yTo) < 145){
			global.cutscene_current = -1;
			global.player.move_xTo = -1;
			global.player.move_yTo = -1;
			eobj.sniper_in_cutscene = false;
			eobj.sniper_cutscene_prop = false;
			levelobj.sniper_can_spawn = true;
		}else{
			eobj.sniper_in_cutscene = true;
		}
	}
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}