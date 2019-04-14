enum Options{
	Screenshake,
	ScreenFreeze,
	MaxCorpses,
	Flashing,
	Fullscreen,
	Resolution,
	MasterVolume,
	SoundVolume,
	MusicVolume,
	AmbienceVolume,
	Input_MoveRight,
	Input_MoveLeft,
	Input_MoveUp,
	Input_MoveDown,
	Input_Dash,
	Input_Interact,
	Input_Attack,
	Input_Throw,
}

ini_open(working_directory + "config.ini");

if (!ds_exists(global.game_option, ds_type_list)){
	global.game_option = ds_list_create();
}

global.game_option[| Options.Screenshake] = ini_read_real("Options", "Screenshake", 50);
global.game_option[| Options.ScreenFreeze] = ini_read_real("Options", "ScreenFreeze", true);
global.game_option[| Options.MaxCorpses] = ini_read_real("Options", "MaxCorpses", 15);
global.game_option[| Options.Flashing] = ini_read_real("Options", "Flashing", 100);

global.game_option[| Options.Fullscreen] = ini_read_real("Options", "Fullscreen", true);
global.game_option[| Options.Resolution] = ini_read_real("Options", "Resolution", 3);

global.game_option[| Options.MasterVolume] = ini_read_real("Options", "MasterVolume", 100);
global.game_option[| Options.SoundVolume] = ini_read_real("Options", "SoundVolume", 100);
global.game_option[| Options.MusicVolume] = ini_read_real("Options", "MusicVolume", 100);
global.game_option[| Options.AmbienceVolume] = ini_read_real("Options", "AmbienceVolume", 100);

global.game_option[| Options.Input_MoveRight] = ini_read_real("Options", "Input_MoveRight", ord("D"));
global.game_option[| Options.Input_MoveLeft] = ini_read_real("Options", "Input_MoveLeft", ord("A"));
global.game_option[| Options.Input_MoveUp] = ini_read_real("Options", "Input_MoveUp", ord("W"));
global.game_option[| Options.Input_MoveDown] = ini_read_real("Options", "Input_MoveDown", ord("S"));
global.game_option[| Options.Input_Dash] = ini_read_real("Options", "Input_Dash", vk_space);
global.game_option[| Options.Input_Interact] = ini_read_real("Options", "Input_Interact", ord("E"));
global.game_option[| Options.Input_Attack] = ini_read_real("Options", "Input_Attack", mb_left);
global.game_option[| Options.Input_Throw] = ini_read_real("Options", "Input_Throw", mb_right);

ini_close();