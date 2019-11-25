// Companion spawning
if (!companions_spawned){
	scr_room_spawn_companion();
	companions_spawned = true;
}

// Objectives
if (!global.game_objective_set){
	global.game_objective_current = Objectives.LocateTheAnvil;
	
	global.objective_counter[global.game_objective_current] = 0;
	global.objective_counter_max[global.game_objective_current] = 0;
	
	global.game_objective_complete = false;
	global.game_objective_set = true;
}