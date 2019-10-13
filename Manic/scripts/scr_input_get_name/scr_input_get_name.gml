///@param binding
///@param brackets
var binding = argument[0];
var brackets = true;

var rstr = "";

if (argument_count > 1){
	brackets = argument[1];
}

switch(global.game_input_type){
	case InputType.Keyboard:
		switch(binding){
			case InputBinding.Right: rstr = "D"; break;
			case InputBinding.Left: rstr = "A"; break;
			case InputBinding.Down: rstr = "S"; break;
			case InputBinding.Up: rstr = "W"; break;
			case InputBinding.Interact: rstr = "E"; break;
			case InputBinding.Dash: rstr = "Space"; break;
			case InputBinding.Attack: rstr = "Left Mouse Button"; break;
			case InputBinding.Throw: rstr = "Right Mouse Button"; break;
			case InputBinding.Pause: rstr = "Escape"; break;
			case InputBinding.FullscreenToggle: rstr = "F"; break;
			case InputBinding.SwitchWeaponForward: rstr = "Scroll Wheel"; break;
			case InputBinding.SwitchWeaponBack: rstr = "Scroll Wheel"; break;
		}
		break;
	
	case InputType.Gamepad:
		rstr = "     "; break;
}

if (brackets){
	rstr = string_insert("[", rstr, 0);
	rstr = string_insert("]", rstr, string_length(rstr) + 1);
}

return rstr;