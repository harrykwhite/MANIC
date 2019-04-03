///scr_cutscene_28();
var index = 28, xTo = room_width, yTo = 232;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	yTo = obj_player.y;
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
	obj_player.flashlight_move = false;
	obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, room_width + 100, yTo);
	
	if (point_distance(obj_player.x, obj_player.y, room_width + 80, yTo) < 90){
		obj_controller_ui.area_next_fade = true;
		obj_controller_ui.area_next_room = rm_level_6_01;
		global.game_level_opening_type = 0;
	}else{
		obj_player.move_xTo = room_width + 100;
		obj_player.move_yTo = yTo;
		obj_player.move_extSpd = obj_player.spd_max;
		obj_player.image_xscale = 1;
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}