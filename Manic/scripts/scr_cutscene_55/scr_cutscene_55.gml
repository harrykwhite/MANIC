///scr_cutscene_55();
var index = 55, xTo = 504, yTo = 725;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	var boss = inst_112E097F;
	var gate = inst_1F2A94;
	var bossexists = instance_exists(boss);
	var gateexists = instance_exists(gate);
	
	if (bossexists){
		xTo = boss.x;
		yTo = boss.y;
		
		boss.in_cutscene = true;
		boss.cutscene_prop = true;
	}
	
	obj_player.flashlight_move = false;
	obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, xTo, yTo);
	
	if (global.cutscene_time[index] < 80){
		global.cutscene_time[index] ++;
		
		if (gateexists){
			xTo = gate.x;
			yTo = gate.y + 20;
			gate.closed = true;
		}
	}else if (global.cutscene_time[index] < 160){
		global.cutscene_time[index] ++;
	}else{
		global.cutscene_time[index] = 0;
		global.cutscene_current = -1;
		obj_player.move_xTo = -1;
		obj_player.move_yTo = -1;
		if (bossexists){
			boss.in_cutscene = false;
			boss.cutscene_prop = false;
		}
	}
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}