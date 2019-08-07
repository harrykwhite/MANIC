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
	if (distance_to_object(obj_player) < 10){
		if (obj_controller_ui.dialogue_time <= 0){
			interact = true;
			scr_ui_control_indicate("Talk");
	
			if (interact_break <= 0){
				if (keyboard_check_pressed(obj_controller_all.key_interact) && global.player_stamina_active){
					interact_break = 15;
					talking = true;
					scr_player_stamina_drain(4);
			
					obj_controller_ui.dialogue = "Hi Dad!";
					obj_controller_ui.dialogue_time = 60 * 2;
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
	obj_controller_ui.dialogue_y = y - 18;
	
	if (obj_controller_ui.dialogue_time <= 0){
		talking = false;
	}
}

scr_family_behaviour_0();