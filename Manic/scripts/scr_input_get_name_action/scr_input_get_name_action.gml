///@param binding
var binding = argument[0];
var rstr = "";

switch(binding){
	case InputBinding.Right: rstr = "Move Right"; break;
	case InputBinding.Left: rstr = "Move Left"; break;
	case InputBinding.Down: rstr = "Move Down"; break;
	case InputBinding.Up: rstr = "Move Up"; break;
	case InputBinding.Interact: rstr = "Interact"; break;
	case InputBinding.Dash: rstr = "Dash"; break;
	case InputBinding.Attack: rstr = "Attack"; break;
	case InputBinding.Throw: rstr = "Throw"; break;
	case InputBinding.Pause: rstr = "Pause"; break;
	case InputBinding.FullscreenToggle: rstr = "Fullscreen"; break;
	case InputBinding.SwitchWeaponForward: rstr = "Switch Weapon Forward"; break;
	case InputBinding.SwitchWeaponBack: rstr = "Switch Weapon Back"; break;
}

return rstr;