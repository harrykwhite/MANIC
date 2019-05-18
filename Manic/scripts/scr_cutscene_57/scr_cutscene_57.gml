///scr_cutscene_57();
var index = 57;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	var xto = 516;
	var yto = 555;
	
	var dirto = point_direction(obj_controller_camera.x, obj_controller_camera.y, xto, yto);
	
	if (cutscene_prologue_ending_camopening){
		if (point_distance(obj_controller_camera.x, obj_controller_camera.y, xto, yto) > 30){
			if (cutscene_prologue_ending_camspeed < 2){
				cutscene_prologue_ending_camspeed += 0.1;
			}
		}else{
			if (cutscene_prologue_ending_camspeed > 0){
				cutscene_prologue_ending_camspeed -= 0.1;
			}else{
				cutscene_prologue_ending_camopening = false;
			}
		}
		
		obj_player.move_x_to = obj_player.x - 5;
		obj_player.move_y_to = obj_player.y;
		obj_player.move_extSpd = 0;
		
		obj_controller_camera.autocontrol = false;
		obj_controller_camera.x += lengthdir_x(cutscene_prologue_ending_camspeed, dirto);
		obj_controller_camera.y += lengthdir_y(cutscene_prologue_ending_camspeed, dirto);
	}else{
		obj_controller_camera.autocontrol = true;
		
		if (global.cutscene_time[index] < 130){
			xto = 686;
			yto = 632;
			
			global.cutscene_camera_x[index] = obj_controller_camera.x;
			global.cutscene_camera_y[index] = obj_controller_camera.y;
			
			if (global.cutscene_time[index] > 20){
				obj_player.move_x_to = xto;
				obj_player.move_y_to = yto;
				obj_player.move_extSpd = 1;
				
				if (point_distance(obj_player.x, obj_player.y, xto, yto) < 20){
					global.cutscene_time[index] = 130;
				}
			}else{
				obj_player.move_x_to = obj_player.x - 5;
				obj_player.move_y_to = obj_player.y;
				obj_player.move_extSpd = 0;
				global.cutscene_time[index] ++;
			}
		}else if (global.cutscene_time[index] < 300){
			xto = 652;
			yto = 500;
			
			obj_player.move_x_to = xto;
			obj_player.move_y_to = yto;
			obj_player.move_extSpd = 1;
			
			global.cutscene_camera_x[index] = obj_player.x;
			global.cutscene_camera_y[index] = obj_player.y;
			
			// Give the player the revolver and knife
			if (point_distance(obj_player.x, obj_player.y, xto, yto) < 15){
				if (global.cutscene_time[index] < 160){
					global.cutscene_time[index] ++;
					
					if (global.cutscene_time[index] == 155){
						var dropcount = instance_number(obj_weapondrop);
						for(var i = 0; i < dropcount; i ++){
							var drop = instance_find(obj_weapondrop, i);
							
							if (drop.index == PlayerWeapon.Knife){
								instance_destroy(drop);
								break;
							}
						}
					}
				}else{
					var drop = instance_nearest(obj_player.x, obj_player.y, obj_weapondrop);
					instance_destroy(drop);
				
					scr_sound_play(snd_weapon_pickup_0, false, 0.8, 1.2);
				
					if (global.weapon_slot[global.weapon_slotcurrent] != -1){
						instance_destroy(global.weapon_object[global.weapon_slot[global.weapon_slotcurrent]]);
					}
				
					global.weapon_slotcurrent = 0;
				
					global.weapon_slot[0] = PlayerWeapon.Revolver;
					global.weapon_slotammo[0] = global.weapon_ammomax[PlayerWeapon.Revolver];
				
					global.weapon_slot[1] = -1;
					global.weapon_slotammo[1] = -1;
				
					instance_create(obj_player.x, obj_player.y, global.weapon_object[PlayerWeapon.Revolver]);
				
					global.cutscene_time[index] = 300;
				}
			}
		}else if (global.cutscene_time[index] < 400){
			xto = 700;
			yto = 604;
			
			global.cutscene_time[index] ++;
			
			if (global.cutscene_time[index] < 340){
				obj_player.move_extSpd = 0;
				obj_player.move_x_to = obj_player.x - 5;
				obj_player.move_y_to = obj_player.y;
				obj_player.image_xscale = -1;
			}else{
				obj_player.move_extSpd = 1;
				obj_player.move_x_to = xto;
				obj_player.move_y_to = yto;
			}
			
			global.cutscene_camera_x[index] = obj_player.x;
			global.cutscene_camera_y[index] = obj_player.y;
		}else if (global.cutscene_time[index] < 500){
			xto = obj_player.x;
			yto = 1076;
			
			if (!obj_controller_ui.area_next_fade){
				if (point_distance(obj_player.x, obj_player.y, xto, yto) < 220){
					obj_controller_ui.area_next_fade = true;
					obj_controller_ui.area_next_alpha = 0;
					obj_controller_ui.area_next_alpha_speed = 0.01;
					obj_controller_ui.area_next_room = rm_level_1_00;
				}
			}
			
			obj_player.move_x_to = xto;
			obj_player.move_y_to = yto;
			obj_player.move_extSpd = 1;
			
			global.cutscene_camera_x[index] = obj_player.x;
			global.cutscene_camera_y[index] = obj_player.y;
		}
	}
	
	obj_player.flashlight_move = false;
	obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, xto, yto);
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
	cutscene_prologue_ending_camspeed = 0;
	cutscene_prologue_ending_camopening = true;
	obj_controller_camera.autocontrol = true;
}