if (!instance_exists(obj_ef_freeze)){
	game_set_speed(60, gamespeed_fps);
	room_speed = 60;
}

scr_position_view();
scr_update_real_volumes();

// Debug
if (keyboard_check_pressed(vk_tab)){
	debug = !debug;
}

// Fullscreen
if (full <= 0){
	if (keyboard_check_pressed(ord("F"))){
		window_set_fullscreen(!window_get_fullscreen());
		global.game_option[| Options.Fullscreen] = window_get_fullscreen();
		full = 40;
		
		window_set_fullscreen(global.game_option[| Options.Fullscreen]);
		scr_options_refresh();
	}
}else{
	full--;
}

/*if (wsize_time <= 0){
	if (keyboard_check_pressed(ord("G"))){
		if (wsize < wsize_max){
			wsize ++;
		}else{
			wsize = 1;
		}
		
		window_set_size(720 * wsize, 405 * wsize);
		window_set_position((display_get_width() / 2) - ((720 * wsize) / 2), (display_get_height() / 2) - ((405 * wsize) / 2))
		display_set_gui_size(1920, 1080);
		wsize_time = 30;
	}
}else{
	wsize_time--;
}*/

// Mouse
if (room != rm_title_0){
	while(!instance_exists(obj_controller_mouse)){
		instance_create(mouse_x, mouse_y, obj_controller_mouse);
	}
}