// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;
spawn_time = 60 * 10;

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
			spawn_y = 752;
		}else{
			spawn_x = room_width / 2;
			spawn_y = 170;
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