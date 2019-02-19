///scr_cutscene_25();
var index = 25, xTo = 0, yTo = room_height;
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
	global.player.flashlight_direction = 180;
	
	if (point_distance(global.player.x, global.player.y, -65, yTo) < 40){
		obj_controller_ui.area_next_fade = true;
		obj_controller_ui.area_next_room = rm_level_5_03;
	}else{
		global.player.move_xTo = -60;
		global.player.move_yTo = yTo;
		global.player.move_extSpd = global.player.spd_max;
		global.player.image_xscale = -1;
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}