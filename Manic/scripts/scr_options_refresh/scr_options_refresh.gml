///@param refresh_display
var refresh_display = false;

if (argument_count == 1){
	refresh_display = argument[0];
}

ini_open(working_directory + "config.ini");

if (refresh_display){
	var full = global.game_option[| Options.Fullscreen];
	
	if (window_get_fullscreen() != full){
		window_set_fullscreen(full);
		
		if (full){
			with(obj_controller_all){
				//minimise_time = 1;
			}
		}
	}
	
	scr_display_update();
}

global.game_option[| Options.Screenshake] = clamp(global.game_option[| Options.Screenshake], 0, 100);
global.game_option[| Options.QuickZoom] = clamp(global.game_option[| Options.QuickZoom], 0, 100);
global.game_option[| Options.Flashing] = clamp(global.game_option[| Options.Flashing], 0, 100);

ini_write_real("Options", "Screenshake", global.game_option[| Options.Screenshake]);
ini_write_real("Options", "ScreenFreeze", global.game_option[| Options.ScreenFreeze]);
ini_write_real("Options", "QuickZoom", global.game_option[| Options.QuickZoom]);
ini_write_real("Options", "MaxCorpses", global.game_option[| Options.MaxCorpses]);
ini_write_real("Options", "Flashing", global.game_option[| Options.Flashing]);
ini_write_real("Options", "Brightness", global.game_option[| Options.Brightness]);
ini_write_real("Options", "ShowMinimap", global.game_option[| Options.ShowMinimap]);

//ini_write_real("Options", "Fullscreen", global.game_option[| Options.Fullscreen]);
ini_write_real("Options", "Resolution", global.game_option[| Options.Resolution]);
ini_write_real("Options", "WindowScale", global.game_option[| Options.WindowScale]);
ini_write_real("Options", "CameraScale", global.game_option[| Options.CameraScale]);
ini_write_real("Options", "UIScale", global.game_option[| Options.UIScale]);

ini_write_real("Options", "MasterVolume", global.game_option[| Options.MasterVolume]);
ini_write_real("Options", "SoundVolume", global.game_option[| Options.SoundVolume]);
ini_write_real("Options", "MusicVolume", global.game_option[| Options.MusicVolume]);
ini_write_real("Options", "AmbienceVolume", global.game_option[| Options.AmbienceVolume]);

ini_write_real("Options", "InputType", global.game_input_type);

ini_close();

with(obj_controller_all){
	scr_update_real_volumes();
}

if (room == rm_title_0){
	if (!obj_titlescreen_main.fade){
		audio_sound_gain(m_ambience_wind_0, 0.55 * obj_controller_all.real_ambience_volume, 1000);
		
		with(obj_titlescreen_main){
			scr_titlescreen_options_reload();
		}
	}
	
	global.game_lighting = 0.85 + scr_brightness_offset();
}

obj_controller_all.option_refresh = true;