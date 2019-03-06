///scr_cutscene_46();
var index = 46, xTo = 884, yTo = 530, spawnx = 884, spawny = 308;
var to = noone;
var eobj = noone;
var levelobj = scr_get_level_object();

if (instance_exists(obj_controller_camera)){
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

if (instance_exists(global.player)){
	if (global.player.y < room_height / 2){
		spawny = 713;
	}
	
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
		
		global.player.flashlight_move = false;
		global.player.flashlight_direction = point_direction(global.player.x, global.player.y, xTo, yTo);
		global.boss_current = Boss.TheDogkeeper;
		
		if (global.cutscene_time[index] > 90){
			global.cutscene_current = -1;
			global.cutscene_time[index] = 0;
			global.player.move_xTo = -1;
			global.player.move_yTo = -1;
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