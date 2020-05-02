var iskeyboard = (global.game_input_type == InputType.Keyboard);

scr_save_game_reader();

if (!ds_exists(global.game_option, ds_type_list)){
	scr_options_init();
}

if (!audio_is_playing(m_ambience_wind_0)){
	audio_play_sound(m_ambience_wind_0, 3, true);
}

audio_sound_gain(m_ambience_wind_0, 0, 0);
audio_sound_gain(m_ambience_wind_0, windvolume * obj_controller_all.real_ambience_volume, 1000);

sprite_index = noone;

fade = false;
fade_alpha = 1;
fade_speed = 0;
fade_goto = noone;
fade_opening = true;

press_break = 0;

#region Title
option[0] = "New Game";
option_locked[0] = false;
option_scale[0] = 1;

option[1] = "Level Select";
option_locked[1] = true;
option_scale[1] = 1;

option[2] = "Arena Mode";
option_locked[2] = false;
option_scale[2] = 1;

option[3] = "Settings";
option_locked[3] = false;
option_scale[3] = 1;

option[4] = "Exit Game";
option_locked[4] = false;
option_scale[4] = 1;

if (global.game_save_started){
	option[0] = "Continue Game";
}

if (global.game_levelselect_unlocked) || (devmode){
	option_locked[1] = false;
}

#endregion

#region Settings
option_setting[0] = "Gameplay";
option_setting_scale[0] = 1;

option_setting[1] = "Display";
option_setting_scale[1] = 1;

option_setting[2] = "Audio";
option_setting_scale[2] = 1;

option_setting[3] = "Controls";
option_setting_scale[3] = 1;

option_setting[4] = "Clear Campaign Data";
option_setting_scale[4] = 1;
#endregion

#region Settings -> Gameplay
option_setting_gameplay[0] = "Screenshake";
option_setting_gameplay_edit[0] = Options.Screenshake;
option_setting_gameplay_value[0] = global.game_option[| Options.Screenshake];
option_setting_gameplay_value_min[0] = 0;
option_setting_gameplay_value_max[0] = 100;
option_setting_gameplay_value_interval[0] = 10;
option_setting_gameplay_unit[0] = "%";
option_setting_gameplay_scale[0] = 1;

option_setting_gameplay[1] = "Screen Freeze";
option_setting_gameplay_edit[1] = Options.ScreenFreeze;
option_setting_gameplay_value[1] = global.game_option[| Options.ScreenFreeze];
option_setting_gameplay_value_min[1] = 0;
option_setting_gameplay_value_max[1] = 1;
option_setting_gameplay_value_interval[1] = 1;
option_setting_gameplay_unit[1] = "[BOOL]";
option_setting_gameplay_scale[1] = 1;

option_setting_gameplay[2] = "Quick Zoom";
option_setting_gameplay_edit[2] = Options.QuickZoom;
option_setting_gameplay_value[2] = global.game_option[| Options.QuickZoom];
option_setting_gameplay_value_min[2] = 0;
option_setting_gameplay_value_max[2] = 100;
option_setting_gameplay_value_interval[2] = 10;
option_setting_gameplay_unit[2] = "%";
option_setting_gameplay_scale[2] = 1;

option_setting_gameplay[3] = "Max Corpses";
option_setting_gameplay_edit[3] = Options.MaxCorpses;
option_setting_gameplay_value[3] = global.game_option[| Options.MaxCorpses];
option_setting_gameplay_value_min[3] = 5;
option_setting_gameplay_value_max[3] = 30;
option_setting_gameplay_value_interval[3] = 5;
option_setting_gameplay_unit[3] = "";
option_setting_gameplay_scale[3] = 1;

option_setting_gameplay[4] = "Flashing";
option_setting_gameplay_edit[4] = Options.Flashing;
option_setting_gameplay_value[4] = global.game_option[| Options.Flashing];
option_setting_gameplay_value_min[4] = 0;
option_setting_gameplay_value_max[4] = 100;
option_setting_gameplay_value_interval[4] = 10;
option_setting_gameplay_unit[4] = "%";
option_setting_gameplay_scale[4] = 1;

option_setting_gameplay[5] = "Brightness";
option_setting_gameplay_edit[5] = Options.Brightness;
option_setting_gameplay_value[5] = global.game_option[| Options.Brightness];
option_setting_gameplay_value_min[5] = 0;
option_setting_gameplay_value_max[5] = 100;
option_setting_gameplay_value_interval[5] = 10;
option_setting_gameplay_unit[5] = "%";
option_setting_gameplay_scale[5] = 1;

option_setting_gameplay[6] = "Show Minimap";
option_setting_gameplay_edit[6] = Options.ShowMinimap;
option_setting_gameplay_value[6] = global.game_option[| Options.ShowMinimap];
option_setting_gameplay_value_min[6] = 0;
option_setting_gameplay_value_max[6] = 1;
option_setting_gameplay_value_interval[6] = 1;
option_setting_gameplay_unit[6] = "[BOOL]";
option_setting_gameplay_scale[6] = 1;
#endregion

#region Settings -> Display
option_setting_display[0] = "Fullscreen";
option_setting_display_edit[0] = Options.Fullscreen;
option_setting_display_value[0] = global.game_option[| Options.Fullscreen];
option_setting_display_value_min[0] = 0;
option_setting_display_value_max[0] = 1;
option_setting_display_value_interval[0] = 1;
option_setting_display_unit[0] = "[BOOL]";
option_setting_display_scale[0] = 1;

option_setting_display[1] = "Resolution";
option_setting_display_edit[1] = Options.Resolution;
option_setting_display_value[1] = global.game_option[| Options.Resolution];
option_setting_display_value_min[1] = 0;
option_setting_display_value_max[1] = 8;
option_setting_display_value_interval[1] = 1;
option_setting_display_unit[1] = "[RESOLUTION]";
option_setting_display_scale[1] = 1;

option_setting_display[2] = "Window Scale";
option_setting_display_edit[2] = Options.WindowScale;
option_setting_display_value[2] = global.game_option[| Options.WindowScale];
option_setting_display_value_min[2] = 1;
option_setting_display_value_max[2] = 4;
option_setting_display_value_interval[2] = 1;
option_setting_display_unit[2] = "x";
option_setting_display_scale[2] = 1;

option_setting_display[3] = "Camera Scale";
option_setting_display_edit[3] = Options.CameraScale;
option_setting_display_value[3] = global.game_option[| Options.CameraScale];
option_setting_display_value_min[3] = 1;
option_setting_display_value_max[3] = 1.5;
option_setting_display_value_interval[3] = 0.1;
option_setting_display_unit[3] = "x";
option_setting_display_scale[3] = 1;

option_setting_display[4] = "UI Scale";
option_setting_display_edit[4] = Options.UIScale;
option_setting_display_value[4] = global.game_option[| Options.UIScale];
option_setting_display_value_min[4] = 1;
option_setting_display_value_max[4] = 1.5;
option_setting_display_value_interval[4] = 0.1;
option_setting_display_unit[4] = "x";
option_setting_display_scale[4] = 1;

var resolutions = scr_resolution_options();

option_setting_display_value_max[1] = ds_list_size(resolutions) - 1;					
option_setting_display_value[1] = clamp(option_setting_display_value[1], 0, option_setting_display_value_max[1]);

ds_list_destroy(resolutions);
#endregion

#region Options -> Settings -> Audio
option_setting_audio[0] = "Master Volume";
option_setting_audio_edit[0] = Options.MasterVolume;
option_setting_audio_value[0] = global.game_option[| Options.MasterVolume];
option_setting_audio_value_min[0] = 0;
option_setting_audio_value_max[0] = 100;
option_setting_audio_value_interval[0] = 10;
option_setting_audio_unit[0] = "%";
option_setting_audio_scale[0] = 1;

option_setting_audio[1] = "Sound Volume";
option_setting_audio_edit[1] = Options.SoundVolume;
option_setting_audio_value[1] = global.game_option[| Options.SoundVolume];
option_setting_audio_value_min[1] = 0;
option_setting_audio_value_max[1] = 100;
option_setting_audio_value_interval[1] = 10;
option_setting_audio_unit[1] = "%";
option_setting_audio_scale[1] = 1;

option_setting_audio[2] = "Music Volume";
option_setting_audio_edit[2] = Options.MusicVolume;
option_setting_audio_value[2] = global.game_option[| Options.MusicVolume];
option_setting_audio_value_min[2] = 0;
option_setting_audio_value_max[2] = 100;
option_setting_audio_value_interval[2] = 10;
option_setting_audio_unit[2] = "%";
option_setting_audio_scale[2] = 1;

option_setting_audio[3] = "Ambience Volume";
option_setting_audio_edit[3] = Options.AmbienceVolume;
option_setting_audio_value[3] = global.game_option[| Options.AmbienceVolume];
option_setting_audio_value_min[3] = 0;
option_setting_audio_value_max[3] = 100;
option_setting_audio_value_interval[3] = 10;
option_setting_audio_unit[3] = "%";
option_setting_audio_scale[3] = 1;
#endregion

#region Level select
var levelcount = global.level_campaign_count;

for(var i = 0; i < levelcount; i ++){
	option_levelselect[i] = global.level_name[i];
	option_levelselect_goto[i] = global.level_room[i];
	option_levelselect_scale[i] = 1;
	option_levelselect_unlocked[i] = true;
}

#endregion

#region Arena mode
var arenacount = global.level_arena_count;

for(var i = 0; i < arenacount; i ++){
	option_arenamode[i] = global.level_name[levelcount + i];
	option_arenamode_goto[i] = global.level_room[levelcount + i];
	option_arenamode_unlocked[i] = global.game_level_arena_unlocked[i] || devmode;
	option_arenamode_scale[i] = 1;
}

#endregion

reset_text_scale = 1;
return_text_scale = 1;

option_max = array_length_1d(option) - 1;

option_setting_max = array_length_1d(option_setting) - 1;
option_setting_gameplay_max = array_length_1d(option_setting_gameplay) - 1;
option_setting_display_max = array_length_1d(option_setting_display) - 1;
option_setting_audio_max = array_length_1d(option_setting_audio) - 1;

option_levelselect_max = array_length_1d(option_levelselect) - 1;
option_arenamode_max = array_length_1d(option_arenamode) - 1;

in_settings = false;
in_settings_gameplay = false;
in_settings_display = false;
in_settings_audio = false;
in_settings_controls = false;

in_levelselect = false;
in_arenamode = false;

selected = iskeyboard ? -1 : 0;
selected_previous = selected;
selected_break = 0;
selected_held_time = 0;
selected_held_time_max = 40;