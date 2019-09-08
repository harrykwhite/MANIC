// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;

// Spawn System
scr_spawn_setup("city", 1.7);
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
			spawn_y = 144;
		}
		break;
	
	case rm_level_8_post_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 374;
			spawn_y = 1352;
		}else{
			spawn_x = 366;
			spawn_y = 144;
		}
		break;
}

if (!audio_is_playing(m_ambience_wind_0)){
	audio_play_sound(m_ambience_wind_0, 3, true);
	audio_sound_gain(m_ambience_wind_0, 0, 0);
}

audio_sound_gain(m_ambience_wind_0, 1 * obj_controller_all.real_ambience_volume, 7000);

// Other
room_music_transition = false;
global.cutscene_current = 2;
sprite_index = noone;
depth = -5;