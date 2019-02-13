///scr_cutscene_41();
var index = 41, xTo = 230, yTo = 490;
var to = noone;
var cobj = noone;
var levelobj = scr_get_level_object();

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	cobj = inst_2A9D4109;
	
	if (instance_exists(cobj)){
		xTo = cobj.x;
		yTo = cobj.y;
		
		global.player.flashlight_move = false;
		global.player.flashlight_direction = point_direction(global.player.x, global.player.y, xTo, yTo);
		
		if (point_distance(global.player.x, global.player.y, xTo, yTo) < 56){
			if (global.cutscene_time[index] < 30){
				global.cutscene_time[index] ++;
			}else{
				global.cutscene_current = -1;
				global.player.move_xTo = -1;
				global.player.move_yTo = -1;
				global.player_companion = 1;
				cobj.in_cutscene = false;
				cobj.cutscene_prop = false;
			}
		}else{
			cobj.in_cutscene = true;
		}
	}
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}