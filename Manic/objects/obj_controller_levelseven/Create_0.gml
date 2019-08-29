// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;

// Spawn System
scr_spawn_setup("city", 1.6);
global.game_combat_state_time_real = 0;
spawn_pause_update = false;
spawn_rate_real = 1;
spawn_cleared = false;

switch(room){
	case rm_level_7_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 170;
			spawn_y = 192;
		}else{
			spawn_x = 1092;
			spawn_y = 232;
		}
		break;
	
	case rm_level_7_01:
		if (global.game_level_opening_type == 0){
			spawn_x = 170;
			spawn_y = 832;
		}else{
			spawn_x = 910;
			spawn_y = 208;
		}
		break;
	
	case rm_level_7_02:
		if (global.game_level_opening_type == 0){
			spawn_x = 170;
			spawn_y = 1704;
		}else{
			spawn_x = room_width / 2;
			spawn_y = 170;
		}
		break;
	
	case rm_level_7_post_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 446;
			spawn_y = 1292;
		}else{
			spawn_x = 1382;
			spawn_y = 150;
		}
		break;
}

// Other
room_music_transition = false;
global.cutscene_current = 2;
fly_can_spawn = global.game_firstflyhead_killed;
sprite_index = noone;
depth = -5;

if (!audio_is_playing(m_ambience_rain_0)){
	audio_play_sound(m_ambience_rain_0, 3, true);
	audio_sound_gain(m_ambience_rain_0, 0, 0);
}

audio_sound_gain(m_ambience_rain_0, 1 * obj_controller_all.real_ambience_volume, 7000);