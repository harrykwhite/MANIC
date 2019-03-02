// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;
spawn_time = 60 * 10;

// Spawn System
scr_spawn_setup("city", 1.35);
spawn_state_time_real = 0;
spawn_pause_update = false;
spawn_rate_real = 1;
spawn_cleared = false;

switch(room){
	case rm_level_8_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 360;
			spawn_y = 525;
		}else{
			spawn_x = 368;
			spawn_y = 152;
		}
		break;
	
	case rm_level_8_01:
		if (global.game_level_opening_type == 0){
			spawn_x = 462;
			spawn_y = 575;
		}else{
			spawn_x = 462;
			spawn_y = 100;
		}
		break;
	
	case rm_level_8_02:
		if (global.game_level_opening_type == 0){
			spawn_x = 541;
			spawn_y = 440;
		}else{
			spawn_x = 448;
			spawn_y = 100;
		}
		break;
}

wind = audio_play_sound(m_ambience_wind_0, 3, true);
audio_sound_gain(wind, 0, 0);
audio_sound_gain(wind, 1, 9000);

// Other
global.cutscene_current = 2;
sprite_index = noone;
depth = -5;