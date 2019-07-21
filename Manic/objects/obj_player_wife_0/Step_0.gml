if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	exit;
}

interact = false;

if (instance_exists(obj_player)){
	if (distance_to_object(obj_player) < 10){
		if (obj_controller_ui.dialogue_time <= 0){
			interact = true;
			scr_ui_control_indicate("Talk");
	
			if (interact_break <= 0){
				if (keyboard_check_pressed(obj_controller_all.key_interact)){
					interact_break = 15;
					talking = true;
			
					obj_controller_ui.dialogue = choose("Hi!", "Hello!");
					obj_controller_ui.dialogue_time = 60 * 1.5;
					obj_controller_ui.dialogue_pause = false;
					obj_controller_ui.dialogue_yoff = obj_controller_ui.dialogue_yoff_max;
				}
			}else{
				interact_break --;
			}
		}
	}
}

if (talking){
	obj_controller_ui.dialogue_x = x;
	obj_controller_ui.dialogue_y = y - 24;
	
	if (obj_controller_ui.dialogue_time <= 0){
		talking = false;
	}
}

scr_family_behaviour_0();