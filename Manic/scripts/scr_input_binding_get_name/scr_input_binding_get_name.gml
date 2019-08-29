///@param binding
var binding = argument0;

switch(binding){
	case InputBinding.Right: return "Right";
	case InputBinding.Left: return "Left";
	case InputBinding.Down: return "Down";
	case InputBinding.Up: return "Up";
	case InputBinding.Interact: return "Interact";
	case InputBinding.Dash: return "Dash";
	case InputBinding.Attack: return "Attack";
	case InputBinding.Throw: return "Throw";
	case InputBinding.Pause: return "Pause";
	case InputBinding.FullscreenToggle: return "Fullscreen";
	case InputBinding.SwitchWeaponBack: return "Switch Weapon";
	case InputBinding.SwitchWeaponForward: return "Switch Weapon";
}