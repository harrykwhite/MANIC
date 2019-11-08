enum InputBinding{
	Right,
	Left,
	Down,
	Up,
	Interact,
	Dash,
	Attack,
	Throw,
	Pause,
	FullscreenToggle,
	SwitchWeaponForward,
	SwitchWeaponBack,
}

global.game_input_gamepad_current = -1;
global.game_input_gamepad_current_type = GamepadType.Xbox;