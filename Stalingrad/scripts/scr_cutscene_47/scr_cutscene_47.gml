///scr_cutscene_47();
var index = 47, xTo = 0, yTo = 208;
var to = noone;
var levelobj = scr_get_level_object();

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (cutscene_trainopening_inst != noone){
	xTo = cutscene_trainopening_inst.x;
	
	if (cutscene_trainopening_inst.spd <= 0.2){
		if (global.cutscene_time[index] < 60){
			global.cutscene_time[index] ++;
			
			if (global.cutscene_time[index] == 30){
				cutscene_trainopening_inst.open = true;
				cutscene_trainopening_inst.open_pause = false;
			}
		}else{
			if (instance_exists(global.player)){
				if (!global.player.isVisible){
					global.player.isVisible = true;
					global.player.x = cutscene_trainopening_inst.x;
					global.player.y = cutscene_trainopening_inst.y + 30;
				}
				
				global.player.move_xTo = global.player.x;
				global.player.move_yTo = cutscene_trainopening_inst.y + 90;
				global.player.move_extSpd = 0.8;
				
				global.player.flashlight_direction = 270;

				if (point_distance(global.player.x, global.player.y, global.player.move_xTo, global.player.move_yTo) < 40){
					if (global.cutscene_time[index] < 115){
						global.cutscene_time[index] ++;
						global.player.move_extSpd = 0;
						global.player.move_xTo = -1;
						global.player.move_yTo = -1;
					}else{
						global.cutscene_current = -1;
						global.player_respawn_x = global.player.x;
						global.player_respawn_y = global.player.y;
						global.player.move_xTo = -1;
						global.player.move_yTo = -1;
						obj_pawn_other_train_1.leave = true;
					}
				}
			}
		}
	}
}

global.cutscene_camera_x[index] = xTo;
global.cutscene_camera_y[index] = yTo;