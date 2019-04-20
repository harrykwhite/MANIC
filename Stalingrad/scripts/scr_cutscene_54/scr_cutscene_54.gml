///scr_cutscene_54();
var index = 54, stationary = false;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	obj_player.flashlight_move = false;
	
	if (cutscene_ending_stage == 0){
		var inst = instance_nearest(obj_player.x, obj_player.y, obj_upgrade_pickup);
		if (inst != noone){
			var dir_to = point_direction(obj_player.x, obj_player.y, inst.x, inst.y);
			var xTo = inst.x + lengthdir_x(10, dir_to);
			var yTo = inst.y + lengthdir_y(10, dir_to);
		
			if (point_distance(obj_player.x, obj_player.y, xTo, yTo) > 15){
				obj_player.move_xTo = xTo;
				obj_player.move_yTo = yTo;
				obj_player.move_extSpd = obj_player.spd_max * 0.75;
				obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, inst.x, inst.y);
			}else{
				if (global.cutscene_time[index] < 35){
					global.cutscene_time[index] ++;
				}else{
					inst.pickup = true;
				}
			
				stationary = true;
			}
		}else{
			stationary = true;
		
			if (global.cutscene_time[index] < 130){
				global.cutscene_time[index] ++;
			}else{
				cutscene_ending_stage = 1;
				global.cutscene_time[index] = 0;
			}
		}
	}else if (cutscene_ending_stage == 1){
		stationary = true;
		
		if (global.cutscene_time[index] < 60){
			global.cutscene_time[index] ++;
		}else{
			cutscene_ending_stage = 2;
			global.cutscene_time[index] = 0;
		}
	}else if (cutscene_ending_stage == 2){
		var xTo = 720;
		var yTo = 454;
		var gate = inst_2F004B72;
		
		if (instance_exists(gate)){
			gate.open = true;
		}
		
		obj_player.move_xTo = xTo;
		obj_player.move_yTo = yTo;
		obj_player.flashlight_direction = point_direction(x, y, xTo, yTo);
		obj_player.move_extSpd = obj_player.spd_max * 0.65;
		
		if (point_distance(obj_player.x, obj_player.y, xTo, yTo) < 30){
			cutscene_ending_stage = 3;
			global.cutscene_time[index] = 0;
		}
	}else if (cutscene_ending_stage == 3){
		var xTo = room_width + 400;
		var yTo = 454;
		
		obj_player.move_xTo = xTo;
		obj_player.move_yTo = yTo;
		obj_player.flashlight_direction = 360;
		obj_player.move_extSpd = obj_player.spd_max * 0.65;
		
		if (point_distance(obj_player.x, obj_player.y, xTo, yTo) < 105){
			stationary = true;
			obj_controller_ui.ending = true;
		}
	}
	
	global.cutscene_camera_x[index] = obj_player.x;
	global.cutscene_camera_y[index] = obj_player.y;
	
	if (stationary){
		obj_player.move_xTo = -1;
		obj_player.move_yTo = -1;
		obj_player.move_extSpd = 0;
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}