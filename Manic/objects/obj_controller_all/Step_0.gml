// Center window
if (center_window_time != -1){
	if (center_window_time > 0){
		center_window_time --;
	}else{
		if (!window_get_fullscreen()){
			window_center();
		}
		
		center_window_time = -1;
	}
}

scr_position_view();
scr_update_real_volumes();

// Debug
if (keyboard_check_pressed(vk_tab)){
	debug = !debug;
}

// Fullscreen
if (full <= 0){
	if (keyboard_check_pressed(ord("F")) || full_autoswitch){
		var isfull = window_get_fullscreen();
		global.game_option[| Options.Fullscreen] = !isfull;
		full = 50;
		full_autoswitch = false;
		
		scr_options_refresh(true);
	}
}else{
	full --;
}

// Mouse
if (room != rm_title_0){
	while(!instance_exists(obj_controller_mouse)){
		instance_create(mouse_x, mouse_y, obj_controller_mouse);
	}
}