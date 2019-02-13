///scr_cutscene_3();
var index = 3;
var xTo = 305, yTo = 563;

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
	
	if (point_distance(global.player.x, global.player.y, xTo, yTo) > 31){
		global.player.move_xTo = xTo;
		global.player.move_yTo = yTo;
		global.player.move_extSpd = global.player.spd_max;
		
	}else{
		
		global.weapon_slot_standalone = 17;
		global.game_objective_current = 2;
		
		with(obj_weapon_17){
			
			audio_play_sound(snd_weapon_pickup_0, 3, false);
			
			use_current = true;
	        alarm[0] = 3;
			
			instance_destroy(global.weapon_object[global.weapon_slot[global.weapon_slotcurrent]]);
			with(scr_get_level_object()){
				
				spawn_time = 60 * 2.5;
				objective_update = true;
				obj_controller_ui.objective_text_set = false;
			}
		}
		
		global.cutscene_current = -1;
		global.player.move_xTo = -1;
		global.player.move_yTo = -1;
	}
	
	var dir = point_direction(global.player.x, global.player.y, xTo, yTo);
	global.player.flashlight_direction = dir;
	
	if (dir > 270) || (dir < 90){
		global.player.image_xscale = 1;
	}else{
		global.player.image_xscale = -1;
	}
	
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}