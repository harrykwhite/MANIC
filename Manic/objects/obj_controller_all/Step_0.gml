if (!global.pers_runthrough){
	// Minimise
	if (minimise_time != -1){
		if (minimise_time > 0){
			minimise_time --;
		}else{
			window_command_run(window_command_minimize);
			maximise_time = 2;
			minimise_time = -1;
		}
	}

	// Minimise
	if (maximise_time != -1){
		if (maximise_time > 0){
			maximise_time --;
		}else{
			window_command_run(window_command_maximize);
			game_set_speed(60, gamespeed_fps);
			maximise_time = -1;
		}
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
	
	window_set_fullscreen(global.game_option[| Options.Fullscreen]);
}

// Steam
if (steam_initialised()){
	if (steam_is_overlay_activated()){
		if (room != rm_ini) && (room != rm_title_0){
			if (!global.game_pause){
				scr_toggle_pause(true);
			}
		}
	}
}

// Gamepad
var gcount = gamepad_get_device_count();
var found = false;

if (gamepad_check_break > 0){
	gamepad_check_break --;
}else{
	if (window_has_focus()){
		if (global.game_input_type == InputType.Keyboard){
			var button_matrix = scr_input_gamepad_any();
	
			if (button_matrix[# 0, 0] != -1){
				if (gamepad_input_check_disconnected_time < 30){
					gamepad_input_check_disconnected_time += 5;
				}else{
					global.game_input_type = InputType.Gamepad;
		
					global.game_input_gamepad_current = button_matrix[# 0, 0];
					global.game_input_gamepad_current_type = scr_input_gamepad_get_type();
		
					gamepad_set_axis_deadzone(global.game_input_gamepad_current, 0.1);
					gamepad_set_button_threshold(global.game_input_gamepad_current, 0.5);
		
					if (instance_exists(obj_titlescreen_main)) && (room == rm_title_0){
						with(obj_titlescreen_main){
							option_setting_controls_value[0] = global.game_input_type;
							selected = -1;
						}
					}
		
					gamepad_check_break += 20;
					gamepad_input_check_disconnected_time = 0;
		
					scr_options_refresh();
					scr_tutourial_names_set();
				}
			}else{
				if (gamepad_input_check_disconnected_time > 0){
					gamepad_input_check_disconnected_time -= 0.5;
				}
			}
	
			ds_grid_destroy(button_matrix);
		}else{
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
		
			// Input disconnect
			var mpressed = mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right);
			var kpressed = keyboard_check_pressed(vk_anykey);
		
			if (mpressed) || (kpressed){
				if (gamepad_input_check_disconnected_time < 30){
					gamepad_input_check_disconnected_time += 10;
				
					if (mpressed){
						gamepad_input_check_disconnected_time += 5;
					}
				}else{
					found = false;
					gamepad_input_check_disconnected_time = 0;
				}
			}else{
				if (gamepad_input_check_disconnected_time > 0){
					gamepad_input_check_disconnected_time -= 0.5;
				}
			}
		
			if (!found){
				global.game_input_type = InputType.Keyboard;
			
				if (instance_exists(obj_titlescreen_main)) && (room == rm_title_0){
					obj_titlescreen_main.option_setting_controls_value[0] = InputType.Keyboard;
					obj_titlescreen_main.selected = -1;
				}
			
				scr_tutourial_names_set();
				scr_options_refresh();
				
				gamepad_check_break += 20;
			
				if (room != rm_ini) && (room != rm_title_0){
					scr_toggle_pause(true);
				}
			}
		}
	}
}

// Lighting
if (!global.game_pause){
	global.game_lighting = clamp(global.game_lighting, 0, 1);
	
	var lto = global.game_lighting;
	var ljump = 0.005;
	
	if (room == rm_prologue_00) && (global.game_objective_complete){
		ljump *= 0.25;
	}
	
	if (global.ambientShadowIntensity != lto){
		global.ambientShadowIntensity += min(ljump, abs(lto - global.ambientShadowIntensity)) * sign(lto - global.ambientShadowIntensity);
	}
}

// Cutscene previous
if (cutscene_previous != -1) && (global.cutscene_current == -1){
	if (instance_exists(obj_player)){
		obj_player.i_time = 30;
	}
}

cutscene_previous = global.cutscene_current;

// Room persistent
if (window_get_fullscreen()){
	//window_set_size(display_get_width(), display_get_height());
}

if (room_pers_clear){
	global.pers_runthrough = true;
	global.pers_runthrough_pre = false;
	
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
		
		room_pers_runthrough_turnoff = true;
		
		room_pers_clear_original = noone;
		room_pers_clear = false;
		room_pers_clear_at = 0;
	}
	
	return;
}else{
	global.pers_runthrough = false;
	global.pers_runthrough_pre = false;
}

/* Show ui
if (devmode){
	if (keyboard_check_pressed(vk_f1)){
		show_ui = !show_ui;
	}
}*/

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

// Mouse
if (room != rm_title_0){
	while(!instance_exists(obj_controller_mouse)){
		instance_create(scr_input_get_mouse_x(), scr_input_get_mouse_y(), obj_controller_mouse);
	}
}