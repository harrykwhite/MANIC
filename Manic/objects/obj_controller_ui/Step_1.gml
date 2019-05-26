// Dialogue
if (dialogue_time > 0){
	if (dialogue_pause){
		if (keyboard_check_pressed(obj_controller_all.key_interact)){
			if (dialogue_count < string_length(dialogue) - 2){
				dialogue_count = string_length(dialogue);
			}else{
				dialogue_next = true;
				dialogue_break = 10;
			}
		}
		
		if (mouse_check_button(obj_controller_all.key_attack)){
			if (dialogue_skip < dialogue_skip_max){
				dialogue_skip ++;
			}
		}
	}
}