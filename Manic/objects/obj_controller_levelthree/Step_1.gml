if (!global.game_objective_set){
	global.game_objective_current = Objectives.ExploreUndergroundBunker;
	global.objective_counter[global.game_objective_current] = 0;
	
	global.game_objective_complete = false;
	global.game_objective_set = true;
}