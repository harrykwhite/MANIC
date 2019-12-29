if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	exit;
}

var yy = y + 6;
var box_x1 = x - (10 * sign(image_xscale));
var box_y1 = yy - 30;
var box_x2 = x + (75 * sign(image_xscale));
var box_y2 = yy + 30;

interact = false;

if (instance_exists(obj_player)){
	if (collision_rectangle(box_x1, box_y1, box_x2, box_y2, obj_player, false, true)){
		if (obj_controller_ui.dialogue_time <= 0){
			interact = true;
			scr_ui_control_indicate("Talk");
	
			if (interact_break <= 0){
				if (scr_input_is_pressed(InputBinding.Interact) && global.player_stamina_active){
					interact_break = 15;
					talking = true;
					scr_player_stamina_drain(4);
			
					obj_controller_ui.dialogue = choose("How are you?", "Good evening.");
					obj_controller_ui.dialogue_voice = snd_character_dialogue_generic_in;
					obj_controller_ui.dialogue_time = 60 * 1.5;
					obj_controller_ui.dialogue_pause = false;
					obj_controller_ui.dialogue_length = string_length(obj_controller_ui.dialogue);
					obj_controller_ui.dialogue_char_count = 0;
					obj_controller_ui.dialogue_voice_opened = false;
					obj_controller_ui.dialogue_voice_closed = true;
					
					with(obj_sign_0){
						talking = false;
					}
					
					with(obj_sign_wall_0){
						talking = false;
					}
				}
			}else{
				interact_break --;
			}
		}
	}
}

if (talking){
	if (global.cutscene_current == -1){
		obj_controller_ui.dialogue_x = x;
		obj_controller_ui.dialogue_y = y - 24;
	
		if (obj_controller_ui.dialogue_time <= 0){
			talking = false;
		}
	}else{
		obj_controller_ui.dialogue_time = 0;
		talking = false;
	}
}

scr_family_behaviour_0();