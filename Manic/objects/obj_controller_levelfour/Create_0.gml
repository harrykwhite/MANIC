// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;
spawn_time = 60 * 10;

switch(room){
	case rm_level_4_00:
		spawn_x = 463;
		if (global.game_level_opening_type == 0){
			spawn_y = 183;
		}else if (global.game_level_opening_type == 2){
			spawn_y = 600;
		}
		break;
	
	case rm_level_4_01:
		spawn_x = 888;
		if (global.game_level_opening_type == 0){
			spawn_y = 183;
		}else if (global.game_level_opening_type == 1){
			spawn_y = 694;
		}
		break;
}

scr_spawn_setup("windy", 1.3);
spawn_pause_update = false;
global.game_combat_state_time_real = 0;
spawn_rate_real = 1;
spawn_cleared = false;

wind = audio_play_sound(m_ambience_wind_0, 3, true);
audio_sound_gain(wind, 0, 0);
audio_sound_gain(wind, 1 * obj_controller_all.real_ambience_volume, 7000);

// Other
dogkeeper = noone;
dogkeeper_failed = false;

terminal_deactivate_count = 0;

crazy_can_spawn = global.game_firstcrazy_killed;

if (room == rm_level_4_00) && (global.game_level_opening_type == 1){
	global.cutscene_current = 47;
}else{
	global.cutscene_current = 2;
}

sprite_index = noone;
depth = -5;