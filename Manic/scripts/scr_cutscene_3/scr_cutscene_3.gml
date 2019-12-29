///scr_cutscene_3();
var index = 3, x_to = cutscene_look_x, y_to = cutscene_look_y;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	// Enemies
	var enemies = ds_list_create();
	var enemyCount = collision_rectangle_list(834, 264, 1160, 444, obj_enemy_0, false, true, enemies, false);
	
	for(var e = 0; e < enemyCount; e ++){
		var inst = enemies[| e];
		inst.cutscene_prop = false;
	}
	
	ds_list_destroy(enemies);
	
	// Fade
	obj_interior_fade.fade = true;
	obj_interior_fade.houseraid = false;
	obj_interior_fade.update_time = obj_interior_fade.update_time_max;
	
	// Look
	x_to = 942;
	y_to = 340;
	
	global.cutscene_camera_x[index] = x_to;
	global.cutscene_camera_y[index] = y_to;
	
	// Timer
	if (global.cutscene_time[index] < 80){
		global.cutscene_time[index] ++;
	}else{
		global.cutscene_current = -1;
		global.cutscene_time[index] = 0;
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}