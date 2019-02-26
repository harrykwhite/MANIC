///scr_cutscene_6();
var index = 6, xTo = 96, yTo = 1552;
var to = noone;
var cobj = noone;
var levelobj = scr_get_level_object();

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	cobj = inst_47269FF2;
	
	if (instance_exists(cobj)){
		global.player.flashlight_move = false;
		global.player.flashlight_direction = point_direction(global.player.x, global.player.y, xTo - 30, yTo);
		
		xTo = global.player.x;
		yTo = global.player.y;
		
		if (point_distance(global.player.x, global.player.y, cobj.x, cobj.y) < 57){
			if (global.cutscene_time[index] < 40){
				global.cutscene_time[index] ++;
			}else{
				global.cutscene_current = -1;
				global.player.move_xTo = -1;
				global.player.move_yTo = -1;
				global.player_companion = 0;
				global.game_companion_farmer_found = true;
				cobj.in_cutscene = false;
				cobj.cutscene_prop = false;
				global.game_objective_current++;
				obj_controller_ui.objective_text_set = false;
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