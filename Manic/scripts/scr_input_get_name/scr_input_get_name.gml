///@param binding
var binding = argument0;

switch(global.game_input_type){
	case InputType.Keyboard:
		switch(binding){
			case InputBinding.Right: return "D";
			case InputBinding.Left: return "A";
			case InputBinding.Down: return "S";
			case InputBinding.Up: return "W";
			case InputBinding.Interact: return "E";
			case InputBinding.Dash: return "SPACE";
			case InputBinding.Attack: return "LEFT MOUSE";
			case InputBinding.Throw: return "RIGHT MOUSE";
			case InputBinding.Pause: return "ESCAPE";
			case InputBinding.FullscreenToggle: return "F";
			case InputBinding.SwitchWeaponForward: return "SCROLL";
			case InputBinding.SwitchWeaponBack: return "SCROLL";
		}
		break;
	
	case InputType.Gamepad:
		return "     ";
}