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

if (interact){
	sprite_index = spr_sign_0_interact;
	scr_ui_control_indicate("Read");
	
	if (interact_break <= 0){
		if (keyboard_check_pressed(obj_controller_all.key_interact)){
			interact_break = 15;
			obj_controller_ui.pausedialogue = true;
			obj_controller_ui.pausedialogue_type = 0;
			obj_controller_ui.pausedialogue_type_text = text;
			scr_toggle_pause(true);
		}
	}else{
		if (!obj_controller_ui.pausedialogue){
			interact_break --;
		}
	}
}else{
	sprite_index = spr_sign_0;
}