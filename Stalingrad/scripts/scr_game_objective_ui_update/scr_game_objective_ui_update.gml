
var level = scr_get_level_object();
var length = string_length(level.objective_title[global.game_objective_current]);

if (obj_controller_ui.objective_text_set == false){
	obj_controller_ui.objective_text_scale = 1.5;
	obj_controller_ui.objective_text = level.objective_title[global.game_objective_current];
	obj_controller_ui.objective_text_set = true;
	obj_controller_ui.objective_text_red_alpha = 1;
}