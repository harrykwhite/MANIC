if (global.game_pause){
	image_speed = 0;
	exit;
}

sprite_index = spr_conveyerbelt_2;
image_speed = 1;

if (global.cutscene_current == -1) && (!deactivated){
	if (place_meeting(x, y + 15, obj_player)){
		scr_ui_control_indicate("Interact");
		sprite_index = spr_conveyerbelt_2_interact;
		
		if (keyboard_check_pressed(obj_controller_all.key_interact)){
			obj_controller_gameplay.cutscene_conveyerbelt_x = x + (sprite_width / 2);
			obj_controller_gameplay.cutscene_conveyerbelt_y = y + 45;
			global.cutscene_current = 7;
			deactivated = true;
		}
	}
}

if (spawn) && (!stop){
	if (time < timemax){
		time ++;
	}else{
		time = 0;
		instance_create(x + 51, y + 7, obj_environment_enemy_mask_0);
	}
}