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
		var gtype = global.game_input_gamepad_current_type;
		
		switch(gtype){
			case GamepadType.Xbox:
				switch(binding){
					case InputBinding.Right:
					case InputBinding.Left:
					case InputBinding.Down:
					case InputBinding.Up: rstr = "Left Joystick"; break;
					
					case InputBinding.Interact: rstr = "A"; break;
					case InputBinding.Dash: rstr = "X"; break;
					case InputBinding.Attack: rstr = "Right Trigger"; break;
					case InputBinding.Throw: rstr = "Left Trigger"; break;
					case InputBinding.Pause: rstr = "Back"; break;
					case InputBinding.FullscreenToggle: rstr = "Start"; break;
					case InputBinding.SwitchWeaponForward: rstr = "Right Bumper"; break;
					case InputBinding.SwitchWeaponBack: rstr = "Left Bumper"; break;
				}
				break;
			
			case GamepadType.Playstation:
				switch(binding){
					case InputBinding.Right:
					case InputBinding.Left:
					case InputBinding.Down:
					case InputBinding.Up: rstr = "Left Joystick"; break;
					
					case InputBinding.Interact: rstr = "Cross"; break;
					case InputBinding.Dash: rstr = "Square"; break;
					case InputBinding.Attack: rstr = "Right Trigger"; break;
					case InputBinding.Throw: rstr = "Left Trigger"; break;
					case InputBinding.Pause: rstr = "Back"; break;
					case InputBinding.FullscreenToggle: rstr = "Start"; break;
					case InputBinding.SwitchWeaponForward: rstr = "Right Bumper"; break;
					case InputBinding.SwitchWeaponBack: rstr = "Left Bumper"; break;
				}
				break;
			
			case GamepadType.Switch:
				switch(binding){
					case InputBinding.Right:
					case InputBinding.Left:
					case InputBinding.Down:
					case InputBinding.Up: rstr = "Left Joystick"; break;
					
					case InputBinding.Interact: rstr = "B"; break;
					case InputBinding.Dash: rstr = "Y"; break;
					case InputBinding.Attack: rstr = "ZR"; break;
					case InputBinding.Throw: rstr = "ZL"; break;
					case InputBinding.Pause: rstr = "Capture"; break;
					case InputBinding.FullscreenToggle: rstr = "Home"; break;
					case InputBinding.SwitchWeaponForward: rstr = "R"; break;
					case InputBinding.SwitchWeaponBack: rstr = "L"; break;
				}
				break;
		}
		
		break;
}

if (brackets){
	rstr = string_insert("[", rstr, 0);
	rstr = string_insert("]", rstr, string_length(rstr) + 1);
}

return rstr;