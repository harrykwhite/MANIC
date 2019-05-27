background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;
spawn_time = 60 * 10;

rain = noone;

switch(room){
	case rm_level_2_pre_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 446;
			spawn_y = 188;
		}else{
			spawn_x = 1872;
			spawn_y = 428;
		}
		
		rain = audio_play_sound(m_ambience_rain_0, 3, true);
		audio_sound_gain(rain, 0, 0);
		audio_sound_gain(rain, 1 * obj_controller_all.real_ambience_volume, 12000);
		break;
	
	case rm_level_2_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 188;
			spawn_y = 298;
		}else{
			spawn_x = 566;
			spawn_y = 936;
		}
		break;
	
	case rm_level_2_01:
		if (global.game_level_opening_type == 0){
			spawn_x = 368;
			spawn_y = 160;
		}else{
			spawn_x = 344;
			spawn_y = 819;
		}
		break;
	
	case rm_level_2_02:
		if (global.game_level_opening_type == 0){
			spawn_x = 358;
			spawn_y = 160;
		}else{
			spawn_x = 358;
			spawn_y = 614;
		}
		break;
}

// Spawn System
scr_spawn_setup("main", 1.1);
spawn_pause_update = false;
global.game_combat_state_time_real = 0;
spawn_rate_real = 1;
spawn_cleared = false;
rainamount = 1;

// Other
global.cutscene_current = 2;
sprite_index = noone;
depth = -5;