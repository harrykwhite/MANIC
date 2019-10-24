// Companion spawning
scr_room_spawn_companion();
companions_spawned = true;

// Objectives
if (!global.game_objective_set){
	if (room == rm_level_6_01) || (room == rm_level_6_02) || (global.game_boss_trainhorde_killed){
		global.game_objective_complete = true;
	}else{
		global.game_objective_current = Objectives.WaitForTrain;
	}
	
	global.objective_counter[global.game_objective_current] = 0;
	global.objective_counter_max[global.game_objective_current] = 0;
	
	global.game_objective_complete = false;
	global.game_objective_set = true;
}