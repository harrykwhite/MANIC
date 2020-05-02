if (global.game_input_type == InputType.Gamepad){
	if (!global.game_pause && instance_exists(obj_player)){
		if (!steam_is_overlay_activated()) && (obj_controller_all.input_break <= 0){
			var axisx = gamepad_axis_value(global.game_input_gamepad_current, gp_axisrh);
			var axisy = gamepad_axis_value(global.game_input_gamepad_current, gp_axisrv);
		
			var hyp = scr_get_hyp(axisx, axisy);
		
			var dir = point_direction(0, 0, axisx, axisy);
			var length = 70// + (70 * hyp);
		
			var playerx = obj_player.x;
			var playery = obj_player.y;
		
			mouse_gamepad_dist = length;
			mouse_gamepad_alpha = clamp(0.4 + hyp, 0, 1);
		
			if (abs(axisx) > 0.15) || (abs(axisy) > 0.15){
				mouse_gamepad_dir = dir;
			}else{
				mouse_gamepad_dist = 70;
			}
		
			mouse_gamepad_x_to = playerx + lengthdir_x(mouse_gamepad_dist, mouse_gamepad_dir) + (70 * axisx);
			mouse_gamepad_y_to = playery + lengthdir_y(mouse_gamepad_dist, mouse_gamepad_dir) + (70 * axisy);
		}
	
		x = approach(x, mouse_gamepad_x_to, 15);
		y = approach(y, mouse_gamepad_y_to, 15);
	}
}else{
	x = mouse_x;
	y = mouse_y;
	
	mouse_gamepad_dir = 0;
	mouse_gamepad_dist = 0;
	
	mouse_gamepad_x_to = x;
	mouse_gamepad_y_to = y;
	
	mouse_gamepad_alpha = 1;
}