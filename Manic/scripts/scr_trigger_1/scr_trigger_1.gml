if (instance_exists(obj_player)){
	obj_player.x = 2222;
	obj_player.y = 550;
	
	obj_player.move_x_to = obj_player.x;
	obj_player.move_y_to = 434;
	obj_player.move_ext_spd = obj_player.spd_max;
	
	obj_controller_camera.x = obj_player.x;
	obj_controller_camera.y = obj_player.y;
	
	if (instance_exists(obj_companion_0)){
		obj_companion_0.x = obj_player.x;
		obj_companion_0.y = obj_player.y - 30;
	}
	
	if (instance_exists(obj_townperson_6)){
		obj_townperson_6.x = obj_player.x + 8;
		obj_townperson_6.y = 356;
		obj_townperson_6.image_xscale = -obj_townperson_6.scale;
	}
}

scr_effect_flash(1, 0.01, c_black);

global.cutscene_current = 1;