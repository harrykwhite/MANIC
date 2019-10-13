///scr_cutscene_4();
var index = 4, stationary = false;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	var inst = instance_nearest(obj_player.x, obj_player.y, obj_collectable_pickup);
	
	if (inst != noone){
		var dist = point_distance(obj_player.x, obj_player.y, inst.x, inst.y);
		
		if (dist < 200){
			var dir_to = point_direction(obj_player.x, obj_player.y, inst.x, inst.y);
			var x_to = inst.x + lengthdir_x(10, dir_to);
			var y_to = inst.y + lengthdir_y(10, dir_to);
		
			if (dist > 18){
				obj_player.move_x_to = x_to;
				obj_player.move_y_to = y_to;
				obj_player.move_ext_spd = obj_player.spd_max;
				obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, inst.x, inst.y);
			}else{
				obj_player.move_x_to = -1;
				obj_player.move_y_to = -1;
				obj_player.move_ext_spd = 0;
				
				if (global.cutscene_time[index] < 35){
					global.cutscene_time[index] ++;
				}else{
					inst.pickup_do = true;
					
					global.cutscene_current = -1;
					global.cutscene_time[index] = 0;
				}
			
				stationary = true;
			}
		}
	}else{
		stationary = true;
		
		if (global.cutscene_time[index] < 50){
			global.cutscene_time[index] ++;
		}else{
			global.cutscene_current = -1;
			global.cutscene_time[index] = 0;
		}
	}
	
	global.cutscene_camera_x[index] = obj_player.x;
	global.cutscene_camera_y[index] = obj_player.y;
	
	if (stationary){
		obj_player.move_x_to = -1;
		obj_player.move_y_to = -1;
		obj_player.move_ext_spd = 0;
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}