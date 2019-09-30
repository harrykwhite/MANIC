if (!global.game_objective_set){
	global.game_objective_current = Objectives.CollectAllArtifacts;
	
	global.objective_counter[global.game_objective_current] = 0;
	global.objective_counter_max[global.game_objective_current] = global.level_collectable_number[global.level_current];
	
	global.game_objective_complete = false;
	global.game_objective_set = true;
}