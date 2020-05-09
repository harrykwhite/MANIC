///scr_cutscene_54();
var index = 54, stationary = false;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	if (cutscene_ending_stage == 0){
		if (global.cutscene_time[index] < 70){
			global.cutscene_time[index] ++;
		}else{
			global.cutscene_time[index] = 0;
			cutscene_ending_stage = 1;
		}
	}else if (cutscene_ending_stage == 1){
		var inst = instance_nearest(obj_player.x, obj_player.y, obj_antagonist_mask);
		
		if (inst != noone){
			var x_to = inst.x;
			var y_to = inst.y;
			
			if (point_distance(obj_player.x, obj_player.y, x_to, y_to) > 35){
				obj_player.move_x_to = x_to;
				obj_player.move_y_to = y_to;
				obj_player.move_ext_spd = obj_player.spd_max * 0.75;
				obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, inst.x, inst.y);
			}else{
				if (global.cutscene_time[index] < 35){
					global.cutscene_time[index] ++;
				}else{
					instance_destroy(inst);
					scr_sound_play(snd_weapon_pickup_upgrade, false, 0.8, 1.2);
					scr_effect_screenshake(1);
					
					global.cutscene_time[index] = 0;
					obj_player.has_antagonist_mask = true;
				}
				
				stationary = true;
			}
		}else{
			stationary = true;
			
			if (global.cutscene_time[index] < 215){
				global.cutscene_time[index] ++;
				
				obj_player.move_x_to = obj_player.x;
				obj_player.move_y_to = obj_player.y + 6;
				
				if (global.cutscene_time[index] > 0){
					obj_player.image_xscale = 1;
				}
				
				if (global.cutscene_time[index] > 100){
					obj_player.image_xscale = -1;
				}
				
				if (global.cutscene_time[index] > 200){
					obj_player.image_xscale = 1;
				}
				
				obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, obj_player.x + (100 * obj_player.image_xscale), obj_player.y);
			}else{
				cutscene_ending_stage = 2;
				global.cutscene_time[index] = 0;
			}
		}
	}else if (cutscene_ending_stage == 2){
		stationary = true;
		
		if (global.cutscene_time[index] < 85){
			global.cutscene_time[index] ++;
		}else{
			cutscene_ending_stage = 3;
			global.cutscene_time[index] = 0;
		}
	}else if (cutscene_ending_stage == 3){
		var x_to = 864;
		var y_to = 458;
		var gate = inst_2F004B72;
		
		if (instance_exists(gate)){
			if (!gate.open){
				gate.open = true;
				scr_sound_play(snd_object_finalboss_door_close_0_right, false, 0.8, 1.2);
			}
		}
		
		obj_player.move_x_to = x_to;
		obj_player.move_y_to = y_to;
		obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, x_to, y_to);
		obj_player.move_ext_spd = obj_player.spd_max * 0.75;
		
		if (point_distance(obj_player.x, obj_player.y, x_to, y_to) < 20){
			cutscene_ending_stage = 4;
			global.cutscene_time[index] = 0;
		}
	}else if (cutscene_ending_stage == 4){
		var x_to = room_width + 200;
		var y_to = obj_player.y;
		
		obj_player.move_x_to = x_to;
		obj_player.move_y_to = y_to;
		obj_player.flashlight_direction = 360;
		obj_player.move_ext_spd = obj_player.spd_max * 0.75;
		
		if (point_distance(obj_player.x, obj_player.y, x_to, y_to) < 500){
			obj_controller_ui.ending = true;
		}
		
		if (point_distance(obj_player.x, obj_player.y, x_to, y_to) < 34){
			stationary = true;
		}
	}
	
	if (cutscene_ending_stage == 0){
		global.cutscene_camera_x[index] = cutscene_ending_corpse.x;
		global.cutscene_camera_y[index] = cutscene_ending_corpse.y;
	}else{
		global.cutscene_camera_x[index] = obj_player.x;
		global.cutscene_camera_y[index] = obj_player.y;
	}
	
	if (stationary){
		obj_player.move_x_to = -1;
		obj_player.move_y_to = -1;
		obj_player.move_ext_spd = 0;
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}