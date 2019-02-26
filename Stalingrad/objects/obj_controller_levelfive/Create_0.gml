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
	
		objective_title[0] = "Free all prisoners (0 / 4)";
		objective_type[0] = noone;
		
		objective_title[1] = "Free all prisoners (1 / 4)";
		objective_type[1] = noone;
		
		objective_title[2] = "Free all prisoners (2 / 4)";
		objective_type[2] = noone;
		
		objective_title[3] = "Free all prisoners (3 / 4)";
		objective_type[3] = noone;
		
		objective_title[4] = "Move north to the next area";
		objective_type[4] = ObjectiveType.Clear;
		break;
	
	case rm_level_5_01:
		if (global.game_level_opening_type == 0){
			spawn_x = 1146;
			spawn_y = 426;
		}else if (global.game_level_opening_type == 1){
			spawn_x = 157;
			spawn_y = 432;
		}
		
		objective_title[0] = "Clear the area of 10 enemies";
		objective_type[0] = ObjectiveType.Kill;
		objective_type_kill_number[0] = 10;
		objective_type_kill_number_max[0] = objective_type_kill_number[0];
		
		objective_title[1] = "Move west to the next area";
		objective_type[1] = ObjectiveType.Clear;
		break;
	
	case rm_level_5_02:
		if (global.game_level_opening_type == 0){
			spawn_x = 940;
			spawn_y = 253;
		}else if (global.game_level_opening_type == 1){
			spawn_x = 270;
			spawn_y = 252;
		}
		
		objective_title[0] = "Clear the area of 20 enemies";
		objective_type[0] = ObjectiveType.Kill;
		objective_type_kill_number[0] = 20;
		objective_type_kill_number_max[0] = objective_type_kill_number[0];
		
		objective_title[1] = "Move west to the next area";
		objective_type[1] = ObjectiveType.Clear;
		break;
	
	case rm_level_5_03:
		if (global.game_level_opening_type == 0){
			spawn_x = 940;
			spawn_y = 258;
		}else if (global.game_level_opening_type == 1){
			spawn_x = 154;
			spawn_y = 688;
		}
		
		objective_title[0] = "Free all prisoners (0 / 3)";
		objective_type[0] = noone;
		
		objective_title[1] = "Free all prisoners (1 / 3)";
		objective_type[1] = noone;
		
		objective_title[2] = "Free all prisoners (2 / 3)";
		objective_type[2] = noone;
		
		objective_title[3] = "Move west to the next area";
		objective_type[3] = ObjectiveType.Clear;
		break;
	
	case rm_level_5_04:
		if (global.game_level_opening_type == 0){
			spawn_x = 940;
			spawn_y = 253;
		}else if (global.game_level_opening_type == 1){
			spawn_x = 616;
			spawn_y = 626;
		}
		
		objective_title[0] = "Clear the area of 20 enemies";
		objective_type[0] = ObjectiveType.Kill;
		objective_type_kill_number[0] = 20;
		objective_type_kill_number_max[0] = objective_type_kill_number[0];
		
		objective_title[1] = "Move south to leave the area";
		objective_type[1] = ObjectiveType.Clear;
}

scr_spawn_setup("underground", 1.2);
spawn_pause_update = false;
spawn_state_time_real = 0;
spawn_rate_real = 1;
spawn_cleared = false;

// Objective System
objective_update = false;
global.game_objective_current = 0;

// Other
global.cutscene_current = 2;
sniper_can_spawn = global.game_firstsniper_killed;
sprite_index = noone;
depth = -5;