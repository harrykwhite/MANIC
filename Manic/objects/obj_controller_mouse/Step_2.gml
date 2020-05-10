var fade = global.cutscene_current != -1;

mouse_scale = approach(mouse_scale, mouse_scale_to, mouse_scale_speed);

if (global.game_input_type == InputType.Gamepad){
	fade |= global.game_pause;
	fade |= !instance_exists(obj_player);
}

if (fade){
	if (mouse_alpha > 0){
		mouse_alpha -= 0.1;
	}
}else{
	if (mouse_alpha < 1){
		mouse_alpha += 0.1;
	}
}

mouse_alpha = clamp(mouse_alpha, 0, 1);

if (mouse_cross > 0.01){
	mouse_cross *= 0.9;
}else{
	mouse_cross = 0;
}

if (instance_exists(obj_player)) && (!global.game_pause){
	var index = global.weapon_slot[global.weapon_slotcurrent];
	
	if (global.weapon_slot_standalone != -1){
		index = global.weapon_slot_standalone;
		mouse = global.weapon_mouse[index];
	}
	
	if (index != -1){
		if (instance_exists(global.weapon_object[index])){
			mouse = global.weapon_mouse[index];
			
			if (global.weapon_type[index] == WeaponType.Ranged){
				if (global.weapon_slot_standalone == -1){
					if (global.weapon_slotammo[global.weapon_slotcurrent] <= 0){
						mouse = MouseType.NoAmmo;
					}
				}else{
					if (global.weapon_slot_standalone_ammo <= 0){
						mouse = MouseType.NoAmmo;
					}
				}
			}
		}
	}else{
		mouse = global.weapon_default == -1 ? MouseType.Dot : global.weapon_mouse[global.weapon_default];
	}
}else{
	if (global.game_input_type != InputType.Gamepad){
		mouse = MouseType.Dot;
	}
}

if (global.game_input_type == InputType.Gamepad){
	if (!global.game_pause && instance_exists(obj_player)){
		if (!steam_is_overlay_activated()) && (obj_controller_all.input_break <= 0){
			var axisx = gamepad_axis_value(global.game_input_gamepad_current, gp_axisrh);
			var axisy = gamepad_axis_value(global.game_input_gamepad_current, gp_axisrv);
		
			var hyp = scr_get_hyp(axisx, axisy);
		
			var dir = point_direction(0, 0, axisx, axisy);
			var length = 70;
		
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