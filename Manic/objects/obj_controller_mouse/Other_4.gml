if (global.pers_runthrough){
	instance_deactivate_object(object_index);
	return;
}

mouse = MouseType.Dot;
mouse_scale = 1;
mouse_scale_to = 1;
mouse_scale_speed = 20;
mouse_alpha = 0;
mouse_cross = 0;

mouse_gamepad_dist = 0;
mouse_gamepad_dir = 0;
mouse_gamepad_alpha = 0;
mouse_gamepad_x_to = x;
mouse_gamepad_y_to = y;

x = scr_input_get_mouse_x();
y = scr_input_get_mouse_y();