var count = 11;
show_debug_message(count);

global.game_gamepad_current = -1;

for(var g = 0; g < count; g ++){
	if (gamepad_is_connected(g)){
		global.game_gamepad_current = g;
		break;
	}
}

show_debug_message("Gamepad refresh called: " + string(global.game_gamepad_current));