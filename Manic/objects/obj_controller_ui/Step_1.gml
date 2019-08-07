// Weapon info
weaponinfo = false;

// Dialogue
if (dialogue_time > 0){
	if (dialogue_pause){
		if (keyboard_check_pressed(obj_controller_all.key_interact)){
			if (dialogue_yoff > 2){
				//dialogue_yoff = 0;
			}else{
				dialogue_next = true;
				dialogue_break = 1;
			}
		}
		
		if (mouse_check_button(obj_controller_all.key_attack)){
			if (dialogue_skip < dialogue_skip_max){
				dialogue_skip ++;
			}
		}else{
			if (dialogue_skip > 0){
				dialogue_skip --;
			}
		}
	}
}