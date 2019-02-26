background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;
spawn_time = 60 * 10;

switch(room){
	case rm_level_2_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 188;
			spawn_y = 298;
		}else{
			spawn_x = 566;
			spawn_y = 936;
		}
		
		objective_title[0] = "Locate the farm owner";
		objective_type[0] = noone;
		
		objective_title[1] = "Clear the area of 15 enemies";
		objective_type[1] = ObjectiveType.Kill;
		objective_type_kill_number[1] = 15;
		objective_type_kill_number_max[1] = objective_type_kill_number[1];

		objective_title[2] = "Move south to the next area";
		objective_type[2] = ObjectiveType.Clear;
		break;
	
	case rm_level_2_01:
		if (global.game_level_opening_type == 0){
			spawn_x = 368;
			spawn_y = 160;
		}else{
			spawn_x = 344;
			spawn_y = 819;
		}
		objective_title[0] = "Clear the area of 15 enemies";
		objective_type[0] = ObjectiveType.Kill;
		objective_type_kill_number[0] = 15;
		objective_type_kill_number_max[0] = objective_type_kill_number[0];
		
		objective_title[1] = "Move south to the next area";
		objective_type[1] = ObjectiveType.Clear;
		break;
	
	case rm_level_2_02:
		if (global.game_level_opening_type == 0){
			spawn_x = 358;
			spawn_y = 160;
		}else{
			spawn_x = 358;
			spawn_y = 614;
		}
		
		objective_title[0] = "";
		objective_type[0] = noone;
		
		objective_title[1] = "";
		objective_type[1] = noone;
		
		objective_title[2] = "Move south to leave the area";
		objective_type[2] = ObjectiveType.Clear;
		break;
}

// Spawn System
scr_spawn_setup("main", 1.05);
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