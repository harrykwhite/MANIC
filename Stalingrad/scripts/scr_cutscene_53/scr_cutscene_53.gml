///scr_cutscene_53();
var index = 53;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	obj_player.flashlight_move = false;
	
	var inst = instance_nearest(obj_player.x, obj_player.y, obj_upgrade_pickup);
	if (inst != noone){
		global.cutscene_camera_x[index] = inst.x;
		global.cutscene_camera_y[index] = inst.y;
		
		if (point_distance(obj_player.x, obj_player.y, inst.x, inst.y) < 20){
			obj_player.move_xTo = -1;
			obj_player.move_yTo = -1;
			obj_player.move_extSpd = 0;
		
			if (global.cutscene_time[index] < 50){
				global.cutscene_time[index] ++;
			
				if (global.cutscene_time[index] == 10){
					inst.pickup = true;
				}
			}else{
				global.cutscene_current = -1;
				global.cutscene_time[index] = 0;
			}
		}else{
			obj_player.move_xTo = inst.x;
			obj_player.move_yTo = inst.y;
			obj_player.move_extSpd = obj_player.spd_max;
			obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, obj_player.move_xTo, obj_player.move_yTo);
		}
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}