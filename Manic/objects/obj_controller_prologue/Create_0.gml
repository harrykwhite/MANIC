// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

// Spawn
spawn_x = 640;
spawn_y = 480;
spawn_pause_update = false;

// Other
wind = audio_play_sound(m_ambience_wind_0, 3, true);
audio_sound_gain(wind, 0, 0);
audio_sound_gain(wind, 1 * obj_controller_all.real_ambience_volume, 20000);

global.cutscene_current = 56;
sprite_index = noone;
depth = -5;