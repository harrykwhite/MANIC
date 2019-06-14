background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;

switch(room){
	case rm_level_2_pre_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 446;
			spawn_y = 188;
		}else{
			spawn_x = 1872;
			spawn_y = 428;
		}
		
		if (!audio_is_playing(m_ambience_rain_0)){
			audio_play_sound(m_ambience_rain_0, 3, true);
			audio_sound_gain(m_ambience_rain_0, 0, 0);
		}
		
		audio_sound_gain(m_ambience_rain_0, 0.7 * obj_controller_all.real_ambience_volume, 6000);
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
	
	case rm_level_2_post_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 368;
			spawn_y = 160;
		}else{
			spawn_x = 2106;
			spawn_y = 790;
		}
		
		if (!audio_is_playing(m_ambience_wind_0)){
			audio_play_sound(m_ambience_wind_0, 3, true);
			audio_sound_gain(m_ambience_wind_0, 0, 0);
		}
		
		audio_sound_gain(m_ambience_wind_0, 0.25 * obj_controller_all.real_ambience_volume, 6000);
		break;
}

// Spawn System
scr_spawn_setup("main", 1.1);
spawn_pause_update = false;

global.game_combat_state_time_real = 0;

spawn_rate_real = 1;
spawn_cleared = false;

postlevel_dialogue_time = 60 * 3;
postlevel_dialogue_index = 0;
postlevel_dialogue_inst = noone;
postlevel_dialogue_exception = false;

// Other
room_music_transition = false;
global.cutscene_current = 2;
sprite_index = noone;
depth = -5;