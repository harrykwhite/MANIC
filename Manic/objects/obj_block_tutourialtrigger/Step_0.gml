if (place_meeting(x + 1, y + 1, obj_player)){
	instance_destroy();
	obj_controller_ui.tutourial_stage = stage_to;
	obj_controller_ui.tutourial_scale = 1.3;
}