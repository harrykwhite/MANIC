if (global.game_input_gamepad_current != -1){
	var desc = gamepad_get_description(global.game_input_gamepad_current);
	
	// Playstation
	if (string_pos("playstation", desc) != 0)
	|| (string_pos("Playstation", desc) != 0)
	|| (string_pos("PLAYSTATION", desc) != 0){
		return GamepadType.Playstation;
	}
	
	// Nintendo
	if (string_pos("nintendo", desc) != 0)
	|| (string_pos("Nintendo", desc) != 0)
	|| (string_pos("NINTENDO", desc) != 0)
	|| (string_pos("switch", desc) != 0){
		return GamepadType.Switch;
	}
	
	// Xbox
	if (string_pos("xbox", desc) != 0)
	|| (string_pos("Xbox", desc) != 0)
	|| (string_pos("XBOX", desc) != 0)
	|| (string_pos("360", desc) != 0){
		return GamepadType.Xbox;
	}
	
	// General
	switch(desc){
		case "PLAYSTATION(R)3 Controller":
			return GamepadType.Playstation;
		
		case "Xbox 360 Controller (XInput STANDARD GAMEPAD)":
			return GamepadType.Xbox;
		
		case "Nintendo Switch Pro Controller":
			return GamepadType.Switch;
		
		default:
			return GamepadType.Xbox;
	}
}

return GamepadType.Xbox;