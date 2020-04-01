///@param binding
///@param brackets
///@param list
var binding = argument[0];
var brackets = true;
var list = false;

var rstr;
rstr[0] = "";

if (argument_count == 2){
	brackets = argument[1];
}

if (argument_count == 3){
	list = argument[2];
}

switch(global.game_input_type){
	case InputType.Keyboard:
		switch(binding){
			case InputBinding.Right: rstr[0] = "D"; break;
			case InputBinding.Left: rstr[0] = "A"; break;
			case InputBinding.Down: rstr[0] = "S"; break;
			case InputBinding.Up: rstr[0] = "W"; break;
			case InputBinding.Interact: rstr[0] = "E"; break;
			case InputBinding.Dash: rstr[0] = "Space"; break;
			case InputBinding.Attack: rstr[0] = "Left Mouse Button"; break;
			case InputBinding.Throw: rstr[0] = "Right Mouse Button"; rstr[1] = "Q"; break;
			case InputBinding.Pause: rstr[0] = "Escape"; break;
			case InputBinding.SwitchWeaponForward: rstr[0] = "Scroll Wheel"; break;
			case InputBinding.SwitchWeaponBack: rstr[0] = "Scroll Wheel"; break;
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
					case InputBinding.Up: rstr[0] = "Left Joystick"; break;
					
					case InputBinding.Interact: rstr[0] = "A"; break;
					case InputBinding.Dash: rstr[0] = "X"; break;
					case InputBinding.Attack: rstr[0] = "Right Trigger"; break;
					case InputBinding.Throw: rstr[0] = "Left Trigger"; break;
					case InputBinding.Pause: rstr[0] = "Start"; break;
					case InputBinding.SwitchWeaponForward: rstr[0] = "Right Bumper"; break;
					case InputBinding.SwitchWeaponBack: rstr[0] = "Left Bumper"; break;
				}
				break;
			
			case GamepadType.Playstation:
				switch(binding){
					case InputBinding.Right:
					case InputBinding.Left:
					case InputBinding.Down:
					case InputBinding.Up: rstr[0] = "Left Joystick"; break;
					
					case InputBinding.Interact: rstr[0] = "Cross"; break;
					case InputBinding.Dash: rstr[0] = "Square"; break;
					case InputBinding.Attack: rstr[0] = "Right Trigger"; break;
					case InputBinding.Throw: rstr[0] = "Left Trigger"; break;
					case InputBinding.Pause: rstr[0] = "Start"; break;
					case InputBinding.SwitchWeaponForward: rstr[0] = "Right Bumper"; break;
					case InputBinding.SwitchWeaponBack: rstr[0] = "Left Bumper"; break;
				}
				break;
			
			case GamepadType.Switch:
				switch(binding){
					case InputBinding.Right:
					case InputBinding.Left:
					case InputBinding.Down:
					case InputBinding.Up: rstr[0] = "Left Joystick"; break;
					
					case InputBinding.Interact: rstr[0] = "B"; break;
					case InputBinding.Dash: rstr[0] = "Y"; break;
					case InputBinding.Attack: rstr[0] = "ZR"; break;
					case InputBinding.Throw: rstr[0] = "ZL"; break;
					case InputBinding.Pause: rstr[0] = (!macbuild ? "Home" : "Plus"); break;
					case InputBinding.SwitchWeaponForward: rstr[0] = "R"; break;
					case InputBinding.SwitchWeaponBack: rstr[0] = "L"; break;
				}
				break;
		}
		
		break;
}

if (brackets){
	for(var s = array_length_1d(rstr) - 1; s >= 0; s --){
		rstr[s] = string_insert("[", rstr[s], 0);
		rstr[s] = string_insert("]", rstr[s], string_length(rstr[s]) + 1);
	}
}

return list ? rstr : rstr[0];