if (global.game_input_gamepad_current != -1){
	var desc = gamepad_get_description(global.game_input_gamepad_current);
	
	// Playstation
	if (string_pos("playstation", desc) != 0)
	|| (string_pos("Playstation", desc) != 0)
	|| (string_pos("PLAYSTATION", desc) != 0){
		return spr_ui_gamepad_buttons_playstation_0;
	}
	
	// Nintendo
	if (string_pos("nintendo", desc) != 0)
	|| (string_pos("Nintendo", desc) != 0)
	|| (string_pos("NINTENDO", desc) != 0)
	|| (string_pos("switch", desc) != 0){
		return spr_ui_gamepad_buttons_switch_0;
	}
	
	// Xbox
	if (string_pos("xbox", desc) != 0)
	|| (string_pos("Xbox", desc) != 0)
	|| (string_pos("XBOX", desc) != 0)
	|| (string_pos("360", desc) != 0){
		return spr_ui_gamepad_buttons_xbox_0;
	}
	
	// General
	switch(desc){
		case "PLAYSTATION(R)3 Controller":
			return spr_ui_gamepad_buttons_playstation_0;
		
		case "Xbox 360 Controller (XInput STANDARD GAMEPAD)":
			return spr_ui_gamepad_buttons_xbox_0;
		
		case "Nintendo Switch Pro Controller":
			return spr_ui_gamepad_buttons_switch_0;
			break;
		
		default:
			return spr_ui_gamepad_buttons_xbox_0;
	}
}

return 0;