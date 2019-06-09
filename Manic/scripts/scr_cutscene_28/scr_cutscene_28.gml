///scr_cutscene_28();
var index = 28, x_to = room_width, y_to = 232;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	y_to = obj_player.y;
	
	global.cutscene_camera_x[index] = x_to;
	global.cutscene_camera_y[index] = y_to;
	
	obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, room_width + 100, y_to);
	
	if (point_distance(obj_player.x, obj_player.y, room_width + 80, y_to) < 90){
		obj_controller_ui.area_next_fade = true;
		obj_controller_ui.area_next_room = rm_level_6_01;
		global.game_level_opening_type = 0;
	}else{
		obj_player.move_x_to = room_width + 100;
		obj_player.move_y_to = y_to;
		obj_player.move_extSpd = obj_player.spd_max;
		obj_player.image_xscale = 1;
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}