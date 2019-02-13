///scr_cutscene_45();
var index = 45, xTo = 512, yTo = 1312;
var to = noone;
var eobj = noone;
var levelobj = scr_get_level_object();

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	eobj = inst_7F5CCF59;
	
	if (instance_exists(eobj)){
		xTo = eobj.x;
		yTo = eobj.y;
	
		global.player.flashlight_move = false;
		global.player.flashlight_direction = point_direction(global.player.x, global.player.y, xTo, yTo);
		
		if (point_distance(global.player.x, global.player.y, xTo, yTo) < 65){
			global.cutscene_current = -1;
			global.player.move_xTo = -1;
			global.player.move_yTo = -1;
			eobj.in_cutscene = false;
			eobj.cutscene_prop = false;
			levelobj.dog_can_spawn = true;
		}else{
			eobj.in_cutscene = true;
		}
	}
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}