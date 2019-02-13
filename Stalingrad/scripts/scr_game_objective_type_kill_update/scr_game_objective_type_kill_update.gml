var level;
level = scr_get_level_object();

if (instance_exists(level)){
	with(level){
		if (objective_type[global.game_objective_current] == ObjectiveType.Kill){
			objective_type_kill_number[global.game_objective_current]--;
			
			if (global.level_current == 0){
				objective_title[global.game_objective_current] = "Kill the remaining " + string(objective_type_kill_number[global.game_objective_current]) + " enemies";
			}else{
				objective_title[global.game_objective_current] = "Clear the area of " + string(objective_type_kill_number[global.game_objective_current]) + " enemies";
			}
			
			if (instance_exists(obj_controller_ui)){
				var length = string_length(objective_title[global.game_objective_current]);

				obj_controller_ui.objective_text_scale = 1.5;
				obj_controller_ui.objective_text = objective_title[global.game_objective_current];
			}
		}
	}
}