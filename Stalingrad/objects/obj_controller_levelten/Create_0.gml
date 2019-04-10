// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

// Spawn
spawn_pause_update = false;

switch(room){
	case rm_level_10_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 502;
			spawn_y = 788;
		}else{
			spawn_x = 502;
			spawn_y = 188;
		}
		break;
	
	case rm_level_10_01:
		spawn_x = 502;
		spawn_y = 932;
		break;
}

// Other
weaponstart_set = false;

global.cutscene_current = 2;
sprite_index = noone;
depth = -5;

scr_save_game();