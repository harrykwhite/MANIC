///scr_cutscene_41();
var index = 41, xTo = 230, yTo = 490;
var cobj = noone;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	cobj = inst_2A9D4109;
	
	if (instance_exists(cobj)){
		xTo = cobj.x;
		yTo = cobj.y;
		
		obj_player.flashlight_move = false;
		obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, xTo, yTo);
		
		if (point_distance(obj_player.x, obj_player.y, xTo, yTo) < 56){
			if (global.cutscene_time[index] < 30){
				global.cutscene_time[index] ++;
			}else{
				global.cutscene_current = -1;
				obj_player.move_xTo = -1;
				obj_player.move_yTo = -1;
				global.game_companion_grenadier_found = true;
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