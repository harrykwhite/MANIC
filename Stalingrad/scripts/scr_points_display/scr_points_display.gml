///@param text
var text = argument0;

if (instance_exists(obj_controller_ui)){
	obj_controller_ui.score_text = text;
	obj_controller_ui.score_text_alpha = 0;
	obj_controller_ui.score_text_offset = 4;
	obj_controller_ui.score_text_time = 60 * 1.5;
}