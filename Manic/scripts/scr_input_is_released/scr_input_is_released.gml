///@param binding
var binding = argument0;
var gp = global.game_input_gamepad_current;

if (steam_is_overlay_activated()) || (obj_controller_all.input_break > 0){
	return false;
}

switch(global.game_input_type){
	case InputType.Keyboard:
		switch(binding){
			case InputBinding.Right: return keyboard_check_released(ord("D"));
			case InputBinding.Left: return keyboard_check_released(ord("A"));
			case InputBinding.Down: return keyboard_check_released(ord("S"));
			case InputBinding.Up: return keyboard_check_released(ord("W"));
			case InputBinding.Interact: return keyboard_check_released(ord("E"));
			case InputBinding.Dash: return keyboard_check_released(vk_space);
			case InputBinding.Attack: return mouse_check_button_released(mb_left);
			case InputBinding.Throw: return mouse_check_button_released(mb_right) || keyboard_check_released(ord("Q"));
			case InputBinding.Pause: return keyboard_check_released(vk_escape);
			case InputBinding.SwitchWeaponBack: return !mouse_wheel_up();
			case InputBinding.SwitchWeaponForward: return !mouse_wheel_down();
		}
		break;
	
	case InputType.Gamepad:
		switch(binding){
			case InputBinding.Right: return !(gamepad_axis_value(gp, gp_axislh) > 0);
			case InputBinding.Left: return !(gamepad_axis_value(gp, gp_axislh) < 0);
			case InputBinding.Down: return !(gamepad_axis_value(gp, gp_axislv) > 0);
			case InputBinding.Up: return !(gamepad_axis_value(gp, gp_axislv) < 0);
			case InputBinding.Interact: return gamepad_button_check_released(gp, gp_face1);
			case InputBinding.Dash: return gamepad_button_check_released(gp, gp_face3);
			case InputBinding.Attack: return gamepad_button_check_released(gp, gp_shoulderrb);
			case InputBinding.Throw: return gamepad_button_check_released(gp, gp_shoulderlb);
			case InputBinding.Pause: return gamepad_button_check_released(gp, gp_select);
			case InputBinding.SwitchWeaponBack: return gamepad_button_check_released(gp, gp_shoulderl);
			case InputBinding.SwitchWeaponForward: return gamepad_button_check_released(gp, gp_shoulderr);
		}
		break;
}