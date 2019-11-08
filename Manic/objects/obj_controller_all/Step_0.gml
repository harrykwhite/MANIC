// Room persistent
if (window_get_fullscreen()){
	window_set_size(display_get_width(), display_get_height());
}

if (room_pers_clear){
	global.pers_runthrough = true;
	
	if (room_pers_clear_original == noone){
		room_pers_clear_original = room;
	}
	
	room_pers_clear_at = clamp(room_pers_clear_at, room_pers_clear_min, room_pers_clear_max);
	
	if (room != room_pers_clear_original){
		room_persistent = false;
		show_debug_message("Persistence reset: " + room_get_name(room));
	}
	
	if (room_pers_clear_at < room_pers_clear_max){
		room_goto(room_pers_clear_at);
		room_pers_clear_at ++;
	}else{
		room_goto(room_pers_clear_original);
		
		global.pers_runthrough = false;
		
		room_pers_clear_original = noone;
		room_pers_clear = false;
		room_pers_clear_at = 0;
	}
	
	return;
}else{
	global.pers_runthrough = false;
}

// Show ui
if (keyboard_check_pressed(vk_f1)){
	show_ui = !show_ui;
}

// Gamepad
var gcount = gamepad_get_device_count();
var found = false;

if (global.game_input_type == InputType.Gamepad){
	if (window_has_focus()){
		for(var g = 0; g < gcount; g ++){
			if (gamepad_is_connected(g)){
				found = true;
			
				if (global.game_input_gamepad_current == -1){
					global.game_input_gamepad_current = g;
					global.game_input_gamepad_current_type = scr_input_gamepad_get_type();
			
					gamepad_set_axis_deadzone(global.game_input_gamepad_current, 0.1);
					gamepad_set_button_threshold(global.game_input_gamepad_current, 0.5);
				}
			
				break;
			}
		}
	
		if (!found){
			if (gamepad_check_disconnected_time < 60){
				gamepad_check_disconnected_time ++;
			}else{
				global.game_input_type = InputType.Keyboard;
				
				if (instance_exists(obj_titlescreen_main)) && (room == rm_title_0){
					obj_titlescreen_main.option_setting_controls_value[0] = InputType.Keyboard;
				}
				
				scr_options_refresh();
				gamepad_check_disconnected_time = 0;
			}
		}else{
			gamepad_check_disconnected_time = 0;
		}
	}
}

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
surface_resize(application_surface, basewidth, baseheight);

if (full <= 0){
	if (scr_input_is_pressed(InputBinding.FullscreenToggle) || full_autoswitch){
		global.game_option[| Options.Fullscreen] = !global.game_option[| Options.Fullscreen];
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
		instance_create(scr_input_get_mouse_x(), scr_input_get_mouse_y(), obj_controller_mouse);
	}
}