// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;
spawn_time = 60 * 10;

// Spawn System
scr_spawn_setup("city", 1.7);
global.game_combat_state_time_real = 0;
spawn_pause_update = false;
spawn_rate_real = 1;
spawn_cleared = false;

switch(room){
	case rm_level_8_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 360;
			spawn_y = 1035;
		}else{
			spawn_x = 368;
			spawn_y = 152;
		}
		break;
	
	case rm_level_8_01:
		if (global.game_level_opening_type == 0){
			spawn_x = 462;
			spawn_y = 654;
		}else{
			spawn_x = 462;
			spawn_y = 146;
		}
		break;
	
	case rm_level_8_02:
		if (global.game_level_opening_type == 0){
			spawn_x = 374;
			spawn_y = 862;
		}else{
			spawn_x = 374;
			spawn_y = 124;
		}
		break;
}

wind = audio_play_sound(m_ambience_wind_0, 3, true);
audio_sound_gain(wind, 0, 0);
audio_sound_gain(wind, 1 * obj_controller_all.real_ambience_volume, 9000);

// Other
global.cutscene_current = 2;
sprite_index = noone;
depth = -5;