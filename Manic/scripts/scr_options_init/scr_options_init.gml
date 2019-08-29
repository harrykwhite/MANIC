enum Options{
	Screenshake,
	ScreenFreeze,
	QuickZoom,
	MaxCorpses,
	Flashing,
	
	Fullscreen,
	Resolution,
	WindowScale,
	CameraScale,
	UIScale,
	
	MasterVolume,
	SoundVolume,
	MusicVolume,
	AmbienceVolume,
}

ini_open(working_directory + "config.ini");

if (!ds_exists(global.game_option, ds_type_list)){
	global.game_option = ds_list_create();
}

global.game_option[| Options.Screenshake] = ini_read_real("Options", "Screenshake", 50);
global.game_option[| Options.ScreenFreeze] = ini_read_real("Options", "ScreenFreeze", true);
global.game_option[| Options.QuickZoom] = ini_read_real("Options", "QuickZoom", 100);
global.game_option[| Options.MaxCorpses] = ini_read_real("Options", "MaxCorpses", 15);
global.game_option[| Options.Flashing] = ini_read_real("Options", "Flashing", 100);

//global.game_option[| Options.Fullscreen] = ini_read_real("Options", "Fullscreen", false);
global.game_option[| Options.Resolution] = ini_read_real("Options", "Resolution", -1);
global.game_option[| Options.WindowScale] = ini_read_real("Options", "WindowScale", 3);
global.game_option[| Options.CameraScale] = ini_read_real("Options", "CameraScale", 1);
global.game_option[| Options.UIScale] = ini_read_real("Options", "UIScale", 1);

global.game_option[| Options.MasterVolume] = ini_read_real("Options", "MasterVolume", 100);
global.game_option[| Options.SoundVolume] = ini_read_real("Options", "SoundVolume", 50);
global.game_option[| Options.MusicVolume] = ini_read_real("Options", "MusicVolume", 70);
global.game_option[| Options.AmbienceVolume] = ini_read_real("Options", "AmbienceVolume", 40);

global.game_input_type = ini_read_real("Options", "InputType", InputType.Keyboard);

ini_close();