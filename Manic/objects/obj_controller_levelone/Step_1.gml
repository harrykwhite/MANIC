if (!global.game_save_started){
	global.game_save_started = true;
}

if (!global.game_objective_set){
	global.game_objective_current = Objectives.TalkToResidents;
	
	global.objective_counter[global.game_objective_current] = 0;
	global.objective_counter_max[global.game_objective_current] = 4;
	
	global.game_objective_complete = false;
	global.game_objective_set = true;
}