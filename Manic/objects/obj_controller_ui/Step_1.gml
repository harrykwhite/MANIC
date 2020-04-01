pause_selected_previous = pause_selected;
pausedialogue_option_selected_previous = pausedialogue_option_selected;

// Pause
if (global.game_pause){
	return;
}

// Dialogue
if (dialogue_time > 0){
	if (dialogue_pause){
		dialogue_length = string_length(dialogue);
		
		if (scr_input_is_pressed(InputBinding.Interact)){
			if (dialogue_char_count < dialogue_length){
				dialogue_char_count = dialogue_length; 
			}else{
				dialogue_next = true;
				
				dialogue_voice_opened = false;
				dialogue_voice_closed = true;
				
				dialogue_break = 1;
			}
		}
		
		if (scr_input_is_down(InputBinding.Attack)){
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