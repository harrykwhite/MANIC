///@param binding
var binding = argument0;

if (global.game_input_type == InputType.Gamepad){
	switch(binding){
		case InputBinding.Right: return 4;
		case InputBinding.Left: return 4;
		case InputBinding.Down: return 4;
		case InputBinding.Up: return 4;
		case InputBinding.Interact: return 1;
		case InputBinding.Dash: return 3;
		case InputBinding.Attack: return 10;
		case InputBinding.Throw: return 9;
		case InputBinding.Pause: return 13;
		case InputBinding.FullscreenToggle: return 14;
		case InputBinding.SwitchWeaponForward: return 8;
		case InputBinding.SwitchWeaponBack: return 7;
	}
}