// Companion spawning
scr_room_spawn_companion();
companions_spawned = true;

// Objectives
if (!global.game_objective_set){
	global.game_objective_current = Objectives.TalkToFarmer;
	global.objective_counter[global.game_objective_current] = 0;
	
	global.game_objective_complete = false;
	global.game_objective_set = true;
}