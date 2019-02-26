///scr_cutscene_52();
var index = 52, xTo = 0, yTo = 0;
var to = noone;

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	switch(cutscene_moveto_dir){
		case 0:
			xTo = room_width + 60;
			yTo = global.player.y;
			break;
		
		case 1:
			yTo = -60;
			xTo = global.player.x;
			break;
		
		case 2:
			xTo = -60;
			yTo = global.player.y;
			break;
		
		case 3:
			yTo = room_height + 60;
			xTo = global.player.x;
			break;
	}
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
	global.player.flashlight_move = false;
	global.player.flashlight_direction = point_direction(global.player.x, global.player.y, xTo, yTo);
	
	if (point_distance(global.player.x, global.player.y, xTo, yTo) < 90){
		obj_controller_ui.area_next_fade = true;
		obj_controller_ui.area_next_room = cutscene_moveto_room;
		global.game_level_opening_type = cutscene_moveto_type;
		global.level_current = cutscene_moveto_level;
	}else{
		global.player.move_xTo = xTo;
		global.player.move_yTo = yTo;
		global.player.move_extSpd = global.player.spd_max;
		global.player.image_xscale = 1;
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}