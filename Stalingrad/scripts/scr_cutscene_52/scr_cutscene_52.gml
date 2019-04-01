///scr_cutscene_52();
var index = 52, xTo = 0, yTo = 0;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	switch(cutscene_moveto_dir){
		case 0:
			xTo = room_width + 100;
			yTo = obj_player.y;
			break;
		
		case 1:
			yTo = -100;
			xTo = obj_player.x;
			break;
		
		case 2:
			xTo = -100;
			yTo = obj_player.y;
			break;
		
		case 3:
			yTo = room_height + 100;
			xTo = obj_player.x;
			break;
	}
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
	obj_player.flashlight_move = false;
	obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, xTo, yTo);
	
	if (point_distance(obj_player.x, obj_player.y, xTo, yTo) < 130){
		obj_controller_ui.area_next_fade = true;
		obj_controller_ui.area_next_room = cutscene_moveto_room;
		global.game_level_opening_type = cutscene_moveto_type;
		global.level_current = cutscene_moveto_level;
	}else{
		obj_player.move_xTo = xTo;
		obj_player.move_yTo = yTo;
		obj_player.move_extSpd = obj_player.spd_max;
		obj_player.image_xscale = 1;
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}