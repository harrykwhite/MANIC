///scr_cutscene_4();
var index = 4, stationary = false;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	var inst = instance_nearest(obj_player.x, obj_player.y, obj_collectable_pickup);
	
	if (inst != noone) && (!cutscene_deermeat_collected){
		var dist = point_distance(obj_player.x, obj_player.y, inst.x, inst.y);
		
		var dir_to = point_direction(obj_player.x, obj_player.y, inst.x, inst.y);
		var x_to = inst.x + lengthdir_x(10, dir_to);
		var y_to = inst.y + lengthdir_y(10, dir_to);
		
		if (dist > 18) && (global.cutscene_time[index] < 75){
			obj_player.move_x_to = x_to;
			obj_player.move_y_to = y_to;
			obj_player.move_ext_spd = obj_player.spd_max;
			obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, inst.x, inst.y);
			
			global.cutscene_time[index] ++;
		}else{
			obj_player.move_x_to = -1;
			obj_player.move_y_to = -1;
			obj_player.move_ext_spd = 0;
			
			global.cutscene_time[index] = max(35, global.cutscene_time[index]);
			
			if (global.cutscene_time[index] < 35 + 55){
				global.cutscene_time[index] ++;
			}else{
				inst.pickup_do = true;
				cutscene_deermeat_collected = true;
				
				global.cutscene_current = -1;
				global.cutscene_time[index] = 0;
				
				var coll;
				var coll_count = instance_number(obj_collectable_pickup);
				
				for(var c = 0; c < coll_count; c ++){
					coll = instance_find(obj_collectable_pickup, c);
					
					if (instance_exists(coll.deer_flesh_cblock)){
						instance_destroy(coll.deer_flesh_cblock);
						
						coll.deer_flesh_cblock = noone;
						coll.deer_flesh_cblock_xoff = 0;
						coll.deer_flesh_cblock_yoff = 0;
					}
				}
			}
		
			stationary = true;
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