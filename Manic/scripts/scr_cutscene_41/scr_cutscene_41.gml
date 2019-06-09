///scr_cutscene_41();
var index = 41, x_to = 230, y_to = 490;
var cobj = noone;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	cobj = inst_2A9D4109;
	
	if (instance_exists(cobj)){
		x_to = cobj.x;
		y_to = cobj.y;
		
		obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, x_to, y_to);
		
		if (point_distance(obj_player.x, obj_player.y, x_to, y_to) < 56){
			if (global.cutscene_time[index] < 30){
				global.cutscene_time[index] ++;
			}else{
				global.cutscene_current = -1;
				obj_player.move_x_to = -1;
				obj_player.move_y_to = -1;
				global.game_companion_grenadier_found = true;
				cobj.in_cutscene = false;
				cobj.cutscene_prop = false;
			}
		}else{
			cobj.in_cutscene = true;
		}
	}
	
	global.cutscene_camera_x[index] = x_to;
	global.cutscene_camera_y[index] = y_to;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}