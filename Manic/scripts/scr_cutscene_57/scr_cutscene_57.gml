///scr_cutscene_57();
var index = 57;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	var xto = 475;
	var yto = 564;
	
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
		obj_player.move_y_to = obj_player.y + 6;
		obj_player.move_ext_spd = 0;
		
		obj_controller_camera.autocontrol = false;
		obj_controller_camera.x += lengthdir_x(cutscene_prologue_ending_camspeed, dirto);
		obj_controller_camera.y += lengthdir_y(cutscene_prologue_ending_camspeed, dirto);
	}else{
		obj_controller_camera.autocontrol = true;
		
		if (global.cutscene_time[index] < 130){
			xto = 676;
			yto = 656;
			
			if (global.cutscene_time[index] > 20){
				obj_player.move_x_to = xto;
				obj_player.move_y_to = yto;
				obj_player.move_ext_spd = 1.25;
				
				if (point_distance(obj_player.x, obj_player.y, xto, yto) < 20){
					global.cutscene_time[index] = 130;
				}
			}else{
				obj_player.move_x_to = obj_player.x - 5;
				obj_player.move_y_to = obj_player.y + 6;
				obj_player.move_ext_spd = 0;
				
				global.cutscene_time[index] ++;
			}
		}else{
			xto = 676;
			yto = 564;
			
			if (point_distance(obj_player.x, obj_player.y, xto, yto) < 12) || (global.cutscene_time[index] >= 260){
				xto = 475;
				
				if (global.cutscene_time[index] < 400){
					obj_player.move_x_to = -1;
					obj_player.move_y_to = -1;
					obj_player.move_ext_spd = 0;
					obj_player.image_xscale = -1;
				}else{
					obj_player.move_x_to = xto;
					obj_player.move_y_to = yto;
					obj_player.move_ext_spd = 1;
					
					if (point_distance(obj_player.x, obj_player.y, xto, yto) < 22){
						obj_player.move_ext_spd = 0;
						obj_player.move_x_to = obj_player.x + lengthdir_x(5, 180);
						obj_player.move_y_to = obj_player.y + lengthdir_y(5, 180);
						
						obj_player.image_xscale = -1;
						
						if (global.cutscene_time[index] >= 810){
							with(obj_controller_ui){
								if (!area_next_fade){
									area_next_fade = true;
									area_next_alpha = 0;
									area_next_alpha_speed = 0.003;
									
									if (global.game_is_playthrough){
										area_next_room = rm_level_1_00;
									}else{
										if (global.level_current != Level.RavagedTown){
											area_next_room = rm_title_0;
										}else{
											area_next_room = rm_level_1_00;
										}
									}
								}
							}
						}
					}
				}
				
				if (global.cutscene_time[index] < 260){
					global.cutscene_time[index] = 260;
				}
			}else{
				obj_player.move_x_to = xto;
				obj_player.move_y_to = yto;
				obj_player.move_ext_spd = 1.25;
			}
			
			global.cutscene_time[index] ++;
		}
	}
	
	global.cutscene_camera_x[index] = obj_controller_camera.x;
	global.cutscene_camera_y[index] = obj_controller_camera.y;
	
	obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, xto, yto);
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
	
	cutscene_prologue_ending_camspeed = 0;
	cutscene_prologue_ending_camopening = true;
	
	obj_controller_camera.autocontrol = true;
}