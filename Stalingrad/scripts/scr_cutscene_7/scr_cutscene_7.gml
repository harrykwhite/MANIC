///scr_cutscene_7();
var index = 7;
var xTo = cutscene_conveyerbelt_x, yTo = cutscene_conveyerbelt_y;
var dir = 0;
var levelobj = scr_get_level_object();

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	global.cutscene_camera_x[index] = cutscene_conveyerbelt_x;
	global.cutscene_camera_y[index] = cutscene_conveyerbelt_y;
	global.player.flashlight_move = false;
	
	if (point_distance(global.player.x, global.player.y, xTo, yTo) < 24){
		global.player.move_xTo = -1;
		global.player.move_yTo = -1;
		global.player.move_extSpd = 0;
		
		if (!audio_is_playing(snd_other_typing_0)){
			audio_play_sound(snd_other_typing_0, 3, false);
		}
		
		if (global.cutscene_time[index] < 120){
			global.cutscene_time[index]++;
		}else{
			if (audio_is_playing(snd_other_typing_0)){
				audio_stop_sound(snd_other_typing_0);
			}
			
			if (instance_exists(inst_18E1EC84)) { instance_destroy(inst_18E1EC84); }
			if (instance_exists(inst_1E60D0F5)) { instance_destroy(inst_1E60D0F5); }
			if (instance_exists(inst_63C69FB8)) { instance_destroy(inst_63C69FB8); }
			
			if (instance_exists(obj_conveyerbelt_0)) { with(obj_conveyerbelt_0) stop = true; }
			if (instance_exists(obj_conveyerbelt_1)) { with(obj_conveyerbelt_1) stop = true; }
			if (instance_exists(obj_conveyerbelt_2)) { with(obj_conveyerbelt_2) stop = true; }
			
			audio_play_sound(snd_other_conveyorbelt_1, 3, false);
			obj_controller_ui.objective_text_set = false;
			
			global.cutscene_current = -1;
			global.game_objective_current ++;
			global.cutscene_time[index] = 0;
			scr_game_objective_ui_update();
			obj_controller_ui.objective_text_set = false;
			
			if (room == rm_level_4_01) && (global.game_objective_current == 3){
				levelobj.dogkeeper = instance_create(872, 530, obj_thedogkeeper);
			}
		}
	}else{
		global.player.move_xTo = xTo;
		global.player.move_yTo = yTo;
		global.player.move_extSpd = global.player.spd_max;
	}

	global.player.flashlight_direction = 90;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}