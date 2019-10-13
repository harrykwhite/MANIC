if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	
	if (type == 1){
		sprite_index = spr_player_child_1_idle_0;
	}
	exit;
}

var yy = y + 6;
var box_x1 = x - (10 * sign(image_xscale));
var box_y1 = yy - 20;
var box_x2 = x + (65 * sign(image_xscale));
var box_y2 = yy + 20;

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
					
					obj_controller_ui.dialogue = "Hi!";
					obj_controller_ui.dialogue_voice = snd_character_dialogue_generic_in;
					obj_controller_ui.dialogue_time = 60 * 2;
					obj_controller_ui.dialogue_pause = false;
					obj_controller_ui.dialogue_length = string_length(obj_controller_ui.dialogue);
					obj_controller_ui.dialogue_char_count = 0;
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