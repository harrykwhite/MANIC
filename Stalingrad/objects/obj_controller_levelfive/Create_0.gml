// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;
spawn_time = 60 * 8;

switch(room){
	case rm_level_5_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 982;
			spawn_y = 1308;
		}else if (global.game_level_opening_type == 1){
			spawn_x = 864;
			spawn_y = 194;
		}
		break;
	
	case rm_level_5_01:
		if (global.game_level_opening_type == 0){
			spawn_x = 1146;
			spawn_y = 426;
		}else if (global.game_level_opening_type == 1){
			spawn_x = 157;
			spawn_y = 432;
		}
		break;
	
	case rm_level_5_02:
		if (global.game_level_opening_type == 0){
			spawn_x = 940;
			spawn_y = 253;
		}else if (global.game_level_opening_type == 1){
			spawn_x = 270;
			spawn_y = 252;
		}
		break;
	
	case rm_level_5_03:
		if (global.game_level_opening_type == 0){
			spawn_x = 940;
			spawn_y = 258;
		}else if (global.game_level_opening_type == 1){
			spawn_x = 154;
			spawn_y = 688;
		}
		break;
	
	case rm_level_5_04:
		if (global.game_level_opening_type == 0){
			spawn_x = 940;
			spawn_y = 253;
		}else if (global.game_level_opening_type == 1){
			spawn_x = 616;
			spawn_y = 626;
		}
}

scr_spawn_setup("underground", 1.4);
spawn_pause_update = false;
global.game_combat_state_time_real = 0;
spawn_rate_real = 1;
spawn_cleared = false;

// Other
global.cutscene_current = 2;
sniper_can_spawn = global.game_firstsniper_killed;
sprite_index = noone;
depth = -5;