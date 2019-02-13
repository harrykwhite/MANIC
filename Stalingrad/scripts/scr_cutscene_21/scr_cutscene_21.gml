///scr_cutscene_21();
var index = 21;
var xTo = 0, yTo = room_height;
var dir = 0;

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	var inst = instance_place(global.player.x, global.player.y, obj_block_cutscene);
	
	global.player.flashlight_direction = 270;
	global.player.image_xscale = -1;
	xTo = global.player.x;

	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
	global.player.flashlight_move = false;
	
	if (global.cutscene_time[index] > 90) || (point_distance(global.player.x, global.player.y, xTo, yTo + 100) < 30){
		global.cutscene_current = -1;
		obj_controller_ui.rank_display_draw = true;
		instance_destroy(global.player);
	}else{
		global.player.move_xTo = xTo;
		global.player.move_yTo = yTo + 100;
		global.player.move_extSpd = global.player.spd_max;
		global.cutscene_time[index] ++;
	}
	
}else{
	index = -1;
	global.cutscene_time[index] = 0;
}