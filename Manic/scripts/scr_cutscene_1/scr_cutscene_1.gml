///scr_cutscene_1();
var index = 1;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)) && (instance_exists(obj_townperson_6)){
	global.cutscene_camera_x[index] = obj_townperson_6.x;
	global.cutscene_camera_y[index] = obj_townperson_6.y;
	obj_player.flashlight_direction = 90;
	
	if (global.cutscene_time[index] < 180){
		global.cutscene_time[index] ++;
	}else{
		var door = instance_nearest(obj_player.x, obj_player.y, obj_prisonbuilding_door_0);
		
		if (door != noone){
			if (door.locked){
				if (door.locked_img_speed == 0){
					door.locked_img_speed = 0.175;
				}
			}else{
				if (!door.open){
					door.auto_interact = true;
					
					obj_controller_ui.dialogue = "All right, good luck!";
					obj_controller_ui.dialogue_voice = snd_character_dialogue_generic_in;
					obj_controller_ui.dialogue_time = 60 * 2.5;
					obj_controller_ui.dialogue_pause = false;
					obj_controller_ui.dialogue_length = string_length(obj_controller_ui.dialogue);
					obj_controller_ui.dialogue_char_count = 0;
					obj_controller_ui.dialogue_x = obj_townperson_6.x;
					obj_controller_ui.dialogue_y = obj_townperson_6.y - 24;
					obj_controller_ui.dialogue_voice_opened = false;
					obj_controller_ui.dialogue_voice_closed = true;
					
					with(obj_sign_0){
						talking = false;
					}
					
					with(obj_sign_wall_0){
						talking = false;
					}
				}
				
				global.cutscene_camera_x[index] = obj_player.x;
				global.cutscene_camera_y[index] = obj_player.y;
				
				obj_player.move_y_to = 0;
				obj_player.move_ext_spd = 1.7;
				
				if (global.cutscene_time[index] < 240){
					global.cutscene_time[index] ++;
				}else{
					with(obj_controller_ui){
						if (!area_next_fade){
							area_next_fade = true;
							
							area_next_alpha_speed = 0.01;
							
							if (global.game_is_playthrough){
								area_next_room = rm_level_5_00;
							}else{
								if (Level.HumanPrison != global.level_current){
									area_next_room = rm_title_0;
								}else{
									area_next_room = rm_level_5_00;
								}
							}
							
							global.game_level_opening_type = 0;
							global.level_current = Level.HumanPrison;
						}
					}
				}
			}
		}
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}