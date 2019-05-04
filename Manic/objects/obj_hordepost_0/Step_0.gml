var player = obj_player;
if (instance_exists(player)) && (!global.game_combat_in_hordechallenge) && (!activated){
	if (point_distance(x, y, player.x, player.y) < 35){
		interact = true;
	}else{
		interact = false;
	}
}else{
	interact = false;
}

if (interact){
	sprite_index = spr_hordepost_0_interact;
	scr_ui_control_indicate("Interact");
	
	if (interact_break <= 0){
		if (keyboard_check_pressed(obj_controller_all.key_interact)){
			interact_break = 15;
			obj_controller_ui.pausedialogue = true;
			obj_controller_ui.pausedialogue_type = 1;
			obj_controller_ui.pausedialogue_type_text = "Start the horde challenge?\n\nSpawn rates will be increased by 500% for 30 seconds\nAn upgrade is waiting for those who survive";
			obj_controller_ui.pausedialogue_type_option[0] = "Start the challenge";
			obj_controller_ui.pausedialogue_type_option_scale[0] = 1;
			obj_controller_ui.pausedialogue_type_option_special[0] = 0;
			obj_controller_ui.pausedialogue_option_max = 1;
			scr_toggle_pause(true);
		}
	}else{
		if (!obj_controller_ui.pausedialogue){
			interact_break --;
		}
	}
}else{
	sprite_index = spr_hordepost_0;
}