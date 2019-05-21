// Dialogue
if (dialogue_time > 0){
	if (dialogue_pause){
		if (keyboard_check_pressed(obj_controller_all.key_interact)){
			dialogue_next = true;
			dialogue_break = 10;
		}
		
		if (mouse_check_button(obj_controller_all.key_attack)){
			if (dialogue_skip < dialogue_skip_max){
				dialogue_skip ++;
			}
		}
	}
}