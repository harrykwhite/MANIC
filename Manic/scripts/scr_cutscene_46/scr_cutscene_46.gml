///scr_cutscene_46();
var index = 46, x_to = 884, y_to = 530, spawnx = 884, spawny = 508;
var eobj = noone;
var levelobj = scr_get_level_object();

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	x_to = spawnx;
	y_to = spawny;
	
	if (levelobj.dogkeeper == noone){
		levelobj.dogkeeper = instance_create(spawnx, spawny, obj_thedogkeeper);
		repeat(9){
			part_particles_create(global.ps_front, spawnx + random_range(-7, 7), spawny + random_range(-18, 18), global.pt_spawn_0, 1);
		}
	}
	
	eobj = levelobj.dogkeeper;
	if (instance_exists(eobj)){
		x_to = eobj.x;
		y_to = eobj.y;
		eobj.in_cutscene = true;
		
		obj_player.flashlight_move = false;
		obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, x_to, y_to);
		
		if (global.cutscene_time[index] > 130){
			global.cutscene_current = -1;
			global.cutscene_time[index] = 0;
			obj_player.move_x_to = -1;
			obj_player.move_y_to = -1;
			eobj.in_cutscene = false;
			eobj.cutscene_prop = false;
		}else{
			global.cutscene_time[index] ++;
		}
	}
	
	global.cutscene_camera_x[index] = x_to;
	global.cutscene_camera_y[index] = y_to;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}