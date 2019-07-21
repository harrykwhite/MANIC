var player = obj_player;
if (instance_exists(player)){
	if (point_distance(x, y, player.x, player.y) < 37){
		interact = true;
	}else{
		interact = false;
	}
}else{
	interact = false;
}

if (interact) && (obj_controller_ui.dialogue_time <= 0){
	sprite_index = spr_sign_0_interact;
	scr_ui_control_indicate("Read");
	
	if (interact_break <= 0){
		if (keyboard_check_pressed(obj_controller_all.key_interact)){
			interact_break = 15;
			
			obj_controller_ui.dialogue = text;
			obj_controller_ui.dialogue_time = 60 * 4;
			obj_controller_ui.dialogue_pause = false;
			obj_controller_ui.dialogue_yoff = obj_controller_ui.dialogue_yoff_max;
			obj_controller_ui.dialogue_x = x;
			obj_controller_ui.dialogue_y = y - 24;
		}
	}else{
		interact_break --;
	}
}else{
	sprite_index = spr_sign_0;
}