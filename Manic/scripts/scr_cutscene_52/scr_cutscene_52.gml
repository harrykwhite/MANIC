///scr_cutscene_52();
var index = 52, x_to = 0, y_to = 0;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	if (!cutscene_moveto_instant){
		switch(cutscene_moveto_dir){
			case 0:
				x_to = room_width + 120;
				y_to = obj_player.y;
				break;
		
			case 1:
				y_to = -120;
				x_to = obj_player.x;
				break;
		
			case 2:
				x_to = -120;
				y_to = obj_player.y;
				break;
		
			case 3:
				y_to = room_height + 120;
				x_to = obj_player.x;
				break;
		}
	
		global.cutscene_camera_x[index] = obj_player.x;
		global.cutscene_camera_y[index] = obj_player.y;
		obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, x_to, y_to);
		
		obj_player.move_x_to = x_to;
		obj_player.move_y_to = y_to;
		obj_player.move_ext_spd = obj_player.spd_max;
	}else{
		global.cutscene_camera_x[index] = obj_player.x;
		global.cutscene_camera_y[index] = obj_player.y;
		
		obj_player.move_x_to = -1;
		obj_player.move_y_to = -1;
		obj_player.move_ext_spd = 0;
	}

	if (point_distance(obj_player.x, obj_player.y, x_to, y_to) < 130) || (cutscene_moveto_instant){
		if (!obj_controller_ui.area_next_fade){
			obj_controller_ui.area_next_fade = true;
			
			if (cutscene_moveto_level != global.level_current){
				area_next_alpha_speed = 0.01;
			}else{
				area_next_alpha_speed = 0.02;
			}
			
			if (global.game_is_playthrough) || (room == rm_prologue_00){
				obj_controller_ui.area_next_room = cutscene_moveto_room;
			}else{
				if (cutscene_moveto_level != global.level_current){
					obj_controller_ui.area_next_room = rm_title_0;
				}else{
					obj_controller_ui.area_next_room = cutscene_moveto_room;
				}
			}
			
			global.game_level_opening_type = cutscene_moveto_type;
			global.level_current = cutscene_moveto_level;
		}
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}