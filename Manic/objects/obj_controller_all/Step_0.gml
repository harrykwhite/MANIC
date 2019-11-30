var iskeyboard = (global.game_input_type == InputType.Keyboard);

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

// Input
if (input_break > 0){
	input_break --;
}

// Steam
var steam_overlay = steam_is_overlay_activated();

// Gamepad
var gcount = gamepad_get_device_count();
var found = false;

if (gamepad_check_break > 0){
	gamepad_check_break --;
}else{
	if (window_has_focus()) && (!steam_overlay) && (input_break <= 0){
		if (iskeyboard){
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
							selected = 0;
						}
					}
		
					gamepad_check_break += 20;
					gamepad_input_check_disconnected_time = 0;
					input_break = 20;
					
					indicate_text = "Gamepad connected at slot " + string(global.game_input_gamepad_current);
					indicate_text_time = indicate_text_time_max;
					indicate_text_alpha = 1;
					
					if (room != rm_ini) && (room != rm_title_0){
						if (global.cutscene_current == -1){
							scr_toggle_pause(true);
						}
					}
		
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
					gamepad_input_check_disconnected_time += 8;
				
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
					with(obj_titlescreen_main){
						selected = -1;
					}
				}
			
				scr_tutourial_names_set();
				scr_options_refresh();
				
				gamepad_check_break += 20;
				input_break = 20;
				
				indicate_text = "Gamepad connection lost";
				indicate_text_time = indicate_text_time_max;
				indicate_text_alpha = 1;
				
				if (room != rm_ini) && (room != rm_title_0){
					if (global.cutscene_current == -1){
						scr_toggle_pause(true);
					}
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
	window_set_size(display_get_width(), display_get_height());
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
		if (!macbuild){
			if (!window_get_fullscreen()){
				window_center();
			}
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

// Warning Prompt
if (warning_prompt){
	if (!iskeyboard){
		warning_prompt_selected = max(warning_prompt_selected, 0);
	}
	
	if (warning_prompt_selected_break > 0){
		warning_prompt_selected_break --;
	}else{
		if (!iskeyboard){
			var down_pressed = scr_input_is_pressed(InputBinding.Down, 0.275);
			var up_pressed = scr_input_is_pressed(InputBinding.Up, 0.275);
			var right_pressed = scr_input_is_pressed(InputBinding.Right, 0.275);
			var left_pressed = scr_input_is_pressed(InputBinding.Left, 0.275);
			
			if (up_pressed || down_pressed || right_pressed || left_pressed){
				warning_prompt_selected = !warning_prompt_selected;
				warning_prompt_selected_break = 12;
			}
		}
	}
	
	if (warning_prompt_selected != -1){
		if (scr_input_is_pressed(iskeyboard ? InputBinding.Attack : InputBinding.Interact)){
			if (warning_prompt_selected == 0){
				switch(warning_prompt_type){
					case 0:
						with(obj_titlescreen_main){
							scr_clear_save_data();
						}
						break;
					
					case 1:
						with(obj_controller_ui){
							pause_has_selected = true;
							pause_has_selected_index = 1;
							pause_has_selected_time = 0;
						}
						break;
					
					case 2:
						with(obj_controller_ui){
							pause_has_selected = true;
							pause_has_selected_index = 2;
							pause_has_selected_time = 0;
						}
						break;
				}
			}
			
			warning_prompt = false;
			return;
		}
	}
}

// Mouse
if (room != rm_title_0){
	while(!instance_exists(obj_controller_mouse)){
		instance_create(scr_input_get_mouse_x(), scr_input_get_mouse_y(), obj_controller_mouse);
		show_debug_message("Mouse created.");
	}
}