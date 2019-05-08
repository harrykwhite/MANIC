///scr_cutscene_55();
var index = 55, x_to = 504, y_to = 725;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	var boss = inst_112E097F;
	var gate = inst_1F2A94;
	var bossexists = instance_exists(boss);
	var gateexists = instance_exists(gate);
	
	if (bossexists){
		x_to = boss.x;
		y_to = boss.y;
		
		boss.in_cutscene = true;
		boss.cutscene_prop = true;
	}
	
	obj_player.flashlight_move = false;
	obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, x_to, y_to);
	
	if (global.cutscene_time[index] < 80){
		global.cutscene_time[index] ++;
		
		if (gateexists){
			x_to = gate.x;
			y_to = gate.y + 20;
			gate.closed = true;
		}
	}else if (global.cutscene_time[index] < 160){
		global.cutscene_time[index] ++;
	}else{
		global.cutscene_time[index] = 0;
		global.cutscene_current = -1;
		obj_player.move_x_to = -1;
		obj_player.move_y_to = -1;
		if (bossexists){
			boss.in_cutscene = false;
			boss.cutscene_prop = false;
		}
	}
	
	global.cutscene_camera_x[index] = x_to;
	global.cutscene_camera_y[index] = y_to;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}