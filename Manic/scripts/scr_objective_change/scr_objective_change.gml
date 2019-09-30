///@param objective_to
///@param objective_counter (-1 for don't set)
///@param objective_counter_max (-1 for don't set)
var objective_to = argument0;
var objective_counter = argument1;
var objective_counter_max = argument2;

global.game_objective_complete = false;
global.game_objective_current = objective_to;

obj_controller_ui.objective_scale = 1.25;

if (objective_counter != -1){
	global.objective_counter[global.game_objective_current] = objective_counter;
}

if (objective_counter_max != -1){
	global.objective_counter_max[global.game_objective_current] = objective_counter_max;
}

global.objective_counter[global.game_objective_current] = clamp(global.objective_counter[global.game_objective_current], 0, global.objective_counter_max[global.game_objective_current]);