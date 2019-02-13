background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;
spawn_time = 60 * 8;

switch(room){
	case rm_level_5_00:
		spawn_x = 982;
		spawn_y = 1308;
		break;
	
	case rm_level_5_01:
		spawn_x = 1146;
		spawn_y = 426;
		break;
	
	case rm_level_5_02:
		spawn_x = 940;
		spawn_y = 253;
		break;
	
	case rm_level_5_03:
		spawn_x = 940;
		spawn_y = 258;
		break;
}

// Spawn System
scr_spawn_setup("underground", 1.2);
spawn_pause_update = false;
spawn_state_time_real = 0;
spawn_rate_real = 1;
spawn_cleared = false;

// Objective System
objective_update = false;

switch(room){
	case rm_level_5_00:
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
		objective_title[0] = "Clear the area of 15 enemies";
		objective_type[0] = ObjectiveType.Kill;
		objective_type_kill_number[0] = 15;
		objective_type_kill_number_max[0] = objective_type_kill_number[0];
		
		objective_title[1] = "Move west to the next area";
		objective_type[1] = ObjectiveType.Clear;
		break;
	
	case rm_level_5_02:
		objective_title[0] = "Clear the area of 20 enemies";
		objective_type[0] = ObjectiveType.Kill;
		objective_type_kill_number[0] = 20;
		objective_type_kill_number_max[0] = objective_type_kill_number[0];
		
		objective_title[1] = "Move west to the next area";
		objective_type[1] = ObjectiveType.Clear;
		break;
	
	case rm_level_5_03:
		objective_title[0] = "Free all prisoners (0 / 3)";
		objective_type[0] = noone;
		
		objective_title[1] = "Free all prisoners (1 / 3)";
		objective_type[1] = noone;
		
		objective_title[2] = "Free all prisoners (2 / 3)";
		objective_type[2] = noone;
		
		objective_title[3] = "Move west to leave the area";
		objective_type[3] = ObjectiveType.Clear;
		break;
}

global.game_objective_current = 0;

// Other
global.cutscene_current = 2;
sniper_can_spawn = true;
sprite_index = noone;
depth = -5;

if (room == rm_level_5_00){
	sniper_can_spawn = false;
}