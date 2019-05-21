if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	
	if (type != 0){
		switch(type){
			case 1:
				if (sprite_index != spr_player_child_1_idle_0){
					sprite_index = spr_player_child_1_idle_0;
				}
				break;
		}
	}
	
	exit;
}

interact = false;

if (instance_exists(obj_player)){
	if (distance_to_object(obj_player) < 20){
		if (obj_controller_ui.dialogue_time <= 0){
			interact = true;
			scr_ui_control_indicate("Talk");
	
			if (interact_break <= 0){
				if (keyboard_check_pressed(obj_controller_all.key_interact)){
					interact_break = 15;
					talking = true;
			
					obj_controller_ui.dialogue = "Hello!";
					obj_controller_ui.dialogue_time = 60 * 4;
					obj_controller_ui.dialogue_pause = false;
					obj_controller_ui.dialogue_count = 0;
				}
			}else{
				interact_break --;
			}
		}else{
			talking = false;
		}
	}
}

if (talking){
	obj_controller_ui.dialogue_x = x;
	obj_controller_ui.dialogue_y = y - 16;
}

scr_family_behaviour_0();