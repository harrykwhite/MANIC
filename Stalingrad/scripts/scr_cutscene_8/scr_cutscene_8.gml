///scr_cutscene_8();
var index = 8;
var xTo = 577, yTo = 512;
var dir = 0;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	
	global.cutscene_camera_x[index] = 577;
	global.cutscene_camera_y[index] = 503;
	obj_player.flashlight_move = false;
	
	if (point_distance(obj_player.x, obj_player.y, xTo, yTo) < 15){
		obj_player.move_xTo = -1;
		obj_player.move_yTo = -1;
		obj_player.move_extSpd = 0;
		
		if (!audio_is_playing(snd_other_typing_0)){
			audio_play_sound(snd_other_typing_0, 3, false);
		}
		
		if (global.cutscene_time[index] < 180){
			global.cutscene_time[index] ++;
		}else{
			if (audio_is_playing(snd_other_typing_0)){
				audio_stop_sound(snd_other_typing_0);
			}
			
			global.cutscene_current = -1;
			global.player_respawn_x = obj_player.x;
			global.player_respawn_y = obj_player.y;
		}
	}else{
		
		obj_player.move_xTo = xTo;
		obj_player.move_yTo = yTo;
		obj_player.move_extSpd = obj_player.spd_max;
	}
	
	dir = point_direction(obj_player.x, obj_player.y, xTo, yTo);
	obj_player.flashlight_direction = dir;
	
	if (dir > 270) || (dir < 90){
		obj_player.image_xscale = 1;
	}else{
		obj_player.image_xscale = -1;
	}
	
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}