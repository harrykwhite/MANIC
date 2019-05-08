///scr_cutscene_47();
var index = 47, x_to = 0, y_to = 0;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (cutscene_trainopening_inst != noone){
	x_to = cutscene_trainopening_inst.x;
	y_to = cutscene_trainopening_inst.y;
	
	if (cutscene_trainopening_inst.spd <= 0.2){
		if (global.cutscene_time[index] < 60){
			global.cutscene_time[index] ++;
			obj_player.is_visible = false;
			
			if (global.cutscene_time[index] == 30){
				cutscene_trainopening_inst.open = true;
				cutscene_trainopening_inst.open_pause = false;
			}
		}else{
			if (!obj_player.is_visible){
				obj_player.is_visible = true;
				obj_player.x = cutscene_trainopening_inst.x;
				obj_player.y = cutscene_trainopening_inst.y + 30;
			}
			
			obj_player.move_x_to = cutscene_trainopening_inst.x;
			obj_player.move_y_to = cutscene_trainopening_inst.y + 90;
			obj_player.move_extSpd = 0.8;
			
			obj_player.flashlight_direction = 270;
			global.worldtrain_room = room;
			
			if (point_distance(obj_player.x, obj_player.y, obj_player.move_x_to, obj_player.move_y_to) < 40){
				if (global.cutscene_time[index] < 115){
					global.cutscene_time[index] ++;
					obj_player.move_extSpd = 0;
					obj_player.move_x_to = -1;
					obj_player.move_y_to = -1;
				}else{
					global.cutscene_current = -1;
					global.player_respawn_x = obj_player.x;
					global.player_respawn_y = obj_player.y;
					obj_player.move_x_to = -1;
					obj_player.move_y_to = -1;
					//obj_pawn_other_train_1.leave = true;
				}
			}
		}
	}
}

global.cutscene_camera_x[index] = x_to;
global.cutscene_camera_y[index] = y_to;