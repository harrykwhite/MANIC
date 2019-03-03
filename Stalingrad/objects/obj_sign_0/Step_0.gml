if (instance_exists(global.player)){
	if (distance_to_point(global.player.x, global.player.y - 6) < 35){
		interact = true;
	}else{
		interact = false;
	}
}else{
	interact = false;
}

if (interact){
	sprite_index = spr_sign_0_interact;
	scr_ui_control_indicate("Read [E]");
	
	if (interact_break <= 0){
		if (keyboard_check_pressed(ord("E"))){
			global.game_pause = true;
			interact_break = 15;
			obj_controller_ui.pausedialogue = true;
			obj_controller_ui.pausedialogue_type = 0;
			obj_controller_ui.pausedialogue_type_text = text;
		}
	}else{
		if (!obj_controller_ui.pausedialogue){
			interact_break --;
		}
	}
}else{
	sprite_index = spr_sign_0;
}