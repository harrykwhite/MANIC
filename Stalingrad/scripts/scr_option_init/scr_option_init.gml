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
}

ini_open("config.ini");

global.game_option = ds_list_create();

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

ini_close();