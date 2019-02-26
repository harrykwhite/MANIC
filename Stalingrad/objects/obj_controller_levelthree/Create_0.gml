background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;
spawn_time = 60 * 8;

switch(room){
	case rm_level_3_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 295;
			spawn_y = 170;
		}else{
			spawn_x = 1600;
			spawn_y = 1218;
		}
		
		objective_title[0] = "Clear the area of 20 enemies";
		objective_type[0] = ObjectiveType.Kill;
		objective_type_kill_number[0] = 20;
		objective_type_kill_number_max[0] = objective_type_kill_number[0];

		objective_title[1] = "Move south to the next area";
		objective_type[1] = ObjectiveType.Clear;
		break;
	
	case rm_level_3_01:
		if (global.game_level_opening_type == 0){
			spawn_x = 467;
			spawn_y = 160;
		}else{
			spawn_x = 924;
			spawn_y = 760;
		}
		
		objective_title[0] = "Clear the area of 10 enemies";
		objective_type[0] = ObjectiveType.Kill;
		objective_type_kill_number[0] = 10;
		objective_type_kill_number_max[0] = objective_type_kill_number[0];

		objective_title[1] = "Move east to the next area";
		objective_type[1] = ObjectiveType.Clear;
		break;
	
	case rm_level_3_02:
		if (global.game_level_opening_type == 0){
			spawn_x = 220;
			spawn_y = 308;
		}else{
			spawn_x = 2167;
			spawn_y = 640;
		}
		
		objective_title[0] = "Clear the area of 20 enemies";
		objective_type[0] = ObjectiveType.Kill;
		objective_type_kill_number[0] = 20;
		objective_type_kill_number_max[0] = objective_type_kill_number[0];

		objective_title[1] = "Move east to leave the area";
		objective_type[1] = ObjectiveType.Clear;
		break;
}

// Spawn System
scr_spawn_setup("underground", 1.1);
spawn_pause_update = false;
spawn_state_time_real = 0;
spawn_rate_real = 1;
spawn_cleared = false;

// Objective System
objective_update = false;
global.game_objective_current = 0;

// Other
global.cutscene_current = 2;
sprite_index = noone;
depth = -5;