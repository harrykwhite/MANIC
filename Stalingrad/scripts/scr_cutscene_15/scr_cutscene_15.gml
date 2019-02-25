///scr_cutscene_15();
var index = 15, xTo = room_width, yTo = room_height / 2;
var to = noone;

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	yTo = global.player.y;
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
	global.player.flashlight_move = false;
	global.player.flashlight_direction = point_direction(global.player.x, global.player.y, xTo, room_height + 60);
	
	if (point_distance(global.player.x, global.player.y, room_width + 80, yTo) < 90){
		obj_controller_ui.area_next_fade = true;
		obj_controller_ui.area_next_room = rm_level_7_01;
		global.game_level_opening_type = 0;
	}else{
		global.player.move_xTo = room_width + 100;
		global.player.move_yTo = yTo;
		global.player.move_extSpd = global.player.spd_max;
		global.player.image_xscale = 1;
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}