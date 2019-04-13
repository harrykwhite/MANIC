// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;
spawn_time = 60 * 10;

// Spawn System
scr_spawn_setup("city", 1.9);
spawn_state_time_real = 0;
spawn_pause_update = false;
spawn_rate_real = 1;
spawn_cleared = false;

switch(room){
	case rm_level_7_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 220;
			spawn_y = 192;
		}else{
			spawn_x = 1092;
			spawn_y = 232;
		}
		break;
	
	case rm_level_7_001:
		if (global.game_level_opening_type == 0){
			spawn_x = 220;
			spawn_y = 832;
		}else{
			spawn_x = 1092;
			spawn_y = 232;
		}
		break;
	
	case rm_level_7_01:
		if (global.game_level_opening_type == 0){
			spawn_x = 240;
			spawn_y = 196;
		}else{
			spawn_x = 352;
			spawn_y = 544;
		}
		break;
	
	case rm_level_7_02:
		if (global.game_level_opening_type == 0){
			spawn_x = 336;
			spawn_y = 124;
		}else{
			spawn_x = 352;
			spawn_y = 548;
		}
		break;
}

// Other
global.cutscene_current = 2;
fly_can_spawn = global.game_firstflyhead_killed;
sprite_index = noone;
depth = -5;

rain = audio_play_sound(m_ambience_rain_0, 3, true);
audio_sound_gain(rain, 0, 0);
audio_sound_gain(rain, 1 * obj_controller_all.real_ambience_volume, 8000);