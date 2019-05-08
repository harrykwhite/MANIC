///scr_cutscene_22();
var index = 22;
var x_to = 673, y_to = 253;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	global.cutscene_camera_x[index] = x_to;
	global.cutscene_camera_y[index] = y_to;
	obj_player.flashlight_move = false;
	obj_player.flashlight_direction = 90;
	
	if (point_distance(obj_player.x, obj_player.y, x_to, y_to) < 12){
		obj_player.move_extSpd = 0;
		obj_player.sprite_index = spr_player_idle_1;
		obj_player.image_speed = 0;
		obj_player.image_index = 0;
		if (global.cutscene_time[index] < 40){
			global.cutscene_time[index] ++;
		}else{
			obj_controller_ui.area_next_fade = true;
			obj_controller_ui.area_next_room = rm_level_6_01;
			global.game_level_opening_type = 0;
		}
	}else{
		obj_player.move_x_to = x_to;
		obj_player.move_y_to = y_to - 10;
		obj_player.move_extSpd = obj_player.spd_max;
	}
	
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}