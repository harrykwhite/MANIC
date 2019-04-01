///scr_cutscene_46();
var index = 46, xTo = 884, yTo = 530, spawnx = 884, spawny = 508;
var eobj = noone;
var levelobj = scr_get_level_object();

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	xTo = spawnx;
	yTo = spawny;
	
	if (levelobj.dogkeeper == noone){
		levelobj.dogkeeper = instance_create(spawnx, spawny, obj_thedogkeeper);
		repeat(9){
			part_particles_create(global.ps_front, spawnx + random_range(-7, 7), spawny + random_range(-18, 18), global.pt_spawn_0, 1);
		}
	}
	
	eobj = levelobj.dogkeeper;
	if (instance_exists(eobj)){
		xTo = eobj.x;
		yTo = eobj.y;
		
		obj_player.flashlight_move = false;
		obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, xTo, yTo);
		
		if (global.cutscene_time[index] > 130){
			global.cutscene_current = -1;
			global.cutscene_time[index] = 0;
			obj_player.move_xTo = -1;
			obj_player.move_yTo = -1;
		}else{
			global.cutscene_time[index] ++;
		}
	}
	
	global.cutscene_camera_x[index] = xTo;
	global.cutscene_camera_y[index] = yTo;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}