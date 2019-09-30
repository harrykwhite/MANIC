///scr_cutscene_59();
var index = 59, stationary = false;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	var inst = inst_700A7BC8;
	
	if (instance_exists(inst)){
		var dir_to = point_direction(obj_player.x, obj_player.y, inst.x, inst.y);
		var x_to = inst.x + lengthdir_x(10, dir_to);
		var y_to = inst.y + lengthdir_y(10, dir_to);
		
		if (point_distance(obj_player.x, obj_player.y, x_to, y_to) > 32){
			obj_player.move_x_to = x_to;
			obj_player.move_y_to = y_to;
			obj_player.move_ext_spd = obj_player.spd_max;
			obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, inst.x, inst.y);
		}else{
			if (global.cutscene_time[index] < 35){
				global.cutscene_time[index] ++;
			}else{
				scr_sound_play(snd_weapon_pickup_gun, false, 0.8, 1.2);
				scr_header_display_text(global.weapon_name[PlayerWeapon.Bayonet], "New backup weapon obtained", 60 * 7);
				
				global.weapon_default = PlayerWeapon.Bayonet;
				global.cutscene_time[index] = 0;
				
				instance_destroy(inst);
				return;
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