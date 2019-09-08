background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;

switch(room){
	case rm_level_3_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 295;
			spawn_y = 170;
		}else{
			spawn_x = 1600;
			spawn_y = 1218;
		}
		break;
	
	case rm_level_3_01:
		if (global.game_level_opening_type == 0){
			spawn_x = 467;
			spawn_y = 160;
		}else{
			spawn_x = 924;
			spawn_y = 760;
		}
		break;
	
	case rm_level_3_02:
		if (global.game_level_opening_type == 0){
			spawn_x = 220;
			spawn_y = 308;
		}else{
			spawn_x = 2167;
			spawn_y = 640;
		}
		break;
}

// Spawn System
room_music_transition = false;
scr_spawn_setup("underground", 1.2);
spawn_pause_update = false;
spawn_rate_real = 1;
spawn_cleared = false;

// Other
global.cutscene_current = 2;
sprite_index = noone;
depth = -5;