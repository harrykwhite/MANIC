///scr_cutscene_11();
var index = 11, xTo = 368, yTo = 544;
var to = noone;
var eobj = noone;
var levelobj = scr_get_level_object();

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	eobj = inst_533D4B3F;
	
	if (instance_exists(eobj)){
		xTo = eobj.x;
		yTo = eobj.y;

		global.player.flashlight_move = false;
		global.player.flashlight_direction = point_direction(global.player.x, global.player.y, xTo, yTo);
		global.boss_current = Boss.TheScorched;
		
		if (global.cutscene_time[index] > 100){
			global.cutscene_current = -1;
			global.cutscene_time[index] = 0;
			global.player.move_xTo = -1;
			global.player.move_yTo = -1;
			global.game_objective_current = 1;
			eobj.in_cutscene = false;
			eobj.cutscene_prop = false;
		}else{
			eobj.in_cutscene = true;
			global.cutscene_time[index] ++;
		}
	}
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}