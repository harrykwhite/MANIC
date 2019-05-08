///scr_cutscene_51();
var index = 51;
var x_to = 0, y_to = 0;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	x_to = cutscene_trainopening_inst.x;
	y_to = cutscene_trainopening_inst.y + 12;
	global.cutscene_camera_x[index] = x_to;
	global.cutscene_camera_y[index] = y_to;
	obj_player.flashlight_move = false;
	obj_player.flashlight_direction = 90;
	
	if (point_distance(obj_player.x, obj_player.y, x_to, y_to) < 20){
		obj_player.move_extSpd = 0;
		obj_player.sprite_index = spr_player_idle_1;
		obj_player.image_speed = 0;
		obj_player.image_index = 0;
		
		if (global.cutscene_time[index] < 40){
			global.cutscene_time[index] ++;
		}else{
			instance_destroy(obj_player);
		}
		
		/*switch(cutscene_moveto_level){
			case 0:
				cutscene_trainopening_inst.dir = -1;
				break;
		
			case 3:
				if (room == rm_level_1_00){
					cutscene_trainopening_inst.dir = 1;
				}else{
					cutscene_trainopening_inst.dir = -1;
				}
				break;
		
			case 5:
				if (room == rm_level_1_00) || (room == rm_level_4_00){
					cutscene_trainopening_inst.dir = 1;
				}else{
					cutscene_trainopening_inst.dir = -1;
				}
				break;
		}*/
	}else{
		obj_player.move_x_to = x_to;
		obj_player.move_y_to = y_to;
		obj_player.move_extSpd = obj_player.spd_max;
	}
}else{
	if (global.cutscene_time[index] < 100){
		global.cutscene_time[index] ++;
	}else{
		global.level_current = cutscene_traingoto;
		obj_controller_ui.area_next_fade = true;
		obj_pawn_other_train_1.leave = true;
		
		if (cutscene_trainstart_type == -1){
			global.game_level_opening_type = 1;
		}else{
			global.game_level_opening_type = cutscene_trainstart_type;
		}
		
		if (cutscene_trainroom == -1){
			obj_controller_ui.area_next_room = global.level_room[cutscene_traingoto];
		}else{
			obj_controller_ui.area_next_room = cutscene_trainroom;
		}
	}
}