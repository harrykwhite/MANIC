ini_open("config.ini");

ini_write_real("Options", "Screenshake", global.game_option[| Options.Screenshake]);
ini_write_real("Options", "ScreenFreeze", global.game_option[| Options.ScreenFreeze]);
ini_write_real("Options", "MaxCorpses", global.game_option[| Options.MaxCorpses]);
ini_write_real("Options", "Flashing", global.game_option[| Options.Flashing]);
ini_write_real("Options", "Fullscreen", global.game_option[| Options.Fullscreen]);
ini_write_real("Options", "Resolution", global.game_option[| Options.Resolution]);
ini_write_real("Options", "MasterVolume", global.game_option[| Options.MasterVolume]);
ini_write_real("Options", "SoundVolume", global.game_option[| Options.SoundVolume]);
ini_write_real("Options", "MusicVolume", global.game_option[| Options.MusicVolume]);
ini_write_real("Options", "AmbienceVolume", global.game_option[| Options.AmbienceVolume]);

ini_close();
window_set_fullscreen(global.game_option[| Options.Fullscreen]);
scr_display_update();

if (room == rm_title_0){
	audio_sound_gain(m_ambience_rain_0, 0.6 * obj_controller_all.real_ambience_volume, 50);
}