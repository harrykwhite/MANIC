sprite_index = noone;

fade = false;
fade_alpha = 1;
fade_speed = 0;
fade_goto = noone;
fade_opening = true;

#region Options
option[0] = "Start Game";
option_locked[0] = false;

option[1] = "Level Select";
option_locked[1] = true;

option[2] = "Settings";
option_locked[2] = false;

option[3] = "Exit Game";
option_locked[3] = false;
#endregion

#region Options -> Settings
option_setting[0] = "Gameplay";
option_setting[1] = "Display";
option_setting[2] = "Audio";
option_setting[3] = "Controls";
#endregion

#region Options -> Settings -> Gameplay
option_setting_gameplay[0] = "Screenshake";
option_setting_gameplay_edit[0] = Options.Screenshake;
option_setting_gameplay_value[0] = global.game_option[| Options.Screenshake];
option_setting_gameplay_value_min[0] = 0;
option_setting_gameplay_value_max[0] = 100;
option_setting_gameplay_value_interval[0] = 10;
option_setting_gameplay_unit[0] = "%";

option_setting_gameplay[1] = "Screen Freeze";
option_setting_gameplay_edit[1] = Options.ScreenFreeze;
option_setting_gameplay_value[1] = global.game_option[| Options.ScreenFreeze];
option_setting_gameplay_value_min[1] = 0;
option_setting_gameplay_value_max[1] = 1;
option_setting_gameplay_value_interval[1] = 1;
option_setting_gameplay_unit[1] = "[BOOL]";

option_setting_gameplay[2] = "Max Corpses";
option_setting_gameplay_edit[2] = Options.MaxCorpses;
option_setting_gameplay_value[2] = global.game_option[| Options.MaxCorpses];
option_setting_gameplay_value_min[2] = 5;
option_setting_gameplay_value_max[2] = 30;
option_setting_gameplay_value_interval[2] = 5;
option_setting_gameplay_unit[2] = "";

option_setting_gameplay[3] = "Flashing";
option_setting_gameplay_edit[3] = Options.Flashing;
option_setting_gameplay_value[3] = global.game_option[| Options.Flashing];
option_setting_gameplay_value_min[3] = 0;
option_setting_gameplay_value_max[3] = 100;
option_setting_gameplay_value_interval[3] = 10;
option_setting_gameplay_unit[3] = "%";
#endregion

#region Options -> Settings -> Display
option_setting_display[0] = "Fullscreen";
option_setting_display_edit[0] = Options.Fullscreen;
option_setting_display_value[0] = global.game_option[| Options.Fullscreen];
option_setting_display_value_min[0] = 0;
option_setting_display_value_max[0] = 1;
option_setting_display_value_interval[0] = 1;
option_setting_display_unit[0] = "[BOOL]";

option_setting_display[1] = "Resolution";
option_setting_display_edit[1] = Options.Resolution;
option_setting_display_value[1] = global.game_option[| Options.Resolution];
option_setting_display_value_min[1] = 0;
option_setting_display_value_max[1] = 3;
option_setting_display_value_interval[1] = 1;
option_setting_display_unit[1] = "[RESOLUTION]";
#endregion

#region Options -> Settings -> Audio
option_setting_audio[0] = "Master Volume";
option_setting_audio_edit[0] = Options.MasterVolume;
option_setting_audio_value[0] = global.game_option[| Options.MasterVolume];
option_setting_audio_value_min[0] = 0;
option_setting_audio_value_max[0] = 100;
option_setting_audio_value_interval[0] = 10;
option_setting_audio_unit[0] = "%";

option_setting_audio[1] = "Sound Volume";
option_setting_audio_edit[1] = Options.SoundVolume;
option_setting_audio_value[1] = global.game_option[| Options.SoundVolume];
option_setting_audio_value_min[1] = 0;
option_setting_audio_value_max[1] = 100;
option_setting_audio_value_interval[1] = 10;
option_setting_audio_unit[1] = "%";

option_setting_audio[2] = "Music Volume";
option_setting_audio_edit[2] = Options.MusicVolume;
option_setting_audio_value[2] = global.game_option[| Options.MusicVolume];
option_setting_audio_value_min[2] = 0;
option_setting_audio_value_max[2] = 100;
option_setting_audio_value_interval[2] = 10;
option_setting_audio_unit[2] = "%";

option_setting_audio[3] = "Ambience Volume";
option_setting_audio_edit[3] = Options.AmbienceVolume;
option_setting_audio_value[3] = global.game_option[| Options.AmbienceVolume];
option_setting_audio_value_min[3] = 0;
option_setting_audio_value_max[3] = 100;
option_setting_audio_value_interval[3] = 10;
option_setting_audio_unit[3] = "%";
#endregion

option_max = array_length_1d(option) - 1;
option_setting_max = array_length_1d(option_setting) - 1;
option_setting_gameplay_max = array_length_1d(option_setting_gameplay) - 1;
option_setting_display_max = array_length_1d(option_setting_display) - 1;
option_setting_audio_max = array_length_1d(option_setting_audio) - 1;

in_settings = false;
in_settings_gameplay = false;
in_settings_display = false;
in_settings_audio = false;
in_settings_controls = false;

in_levelselect = false;
selected = 0;