mouse_scale = approach(mouse_scale, mouse_scale_to, mouse_scale_speed);

if (global.cutscene_current != -1) && (!obj_controller_ui.teaserend){
	if (mouse_alpha > 0){
		mouse_alpha -= 0.05;
	}
}else{
	if (mouse_alpha < 1){
		mouse_alpha += 0.05;
	}
}

mouse_alpha = clamp(mouse_alpha,  0, 1);

if (mouse_cross > 0.01){
	mouse_cross *= 0.9;
}else{
	mouse_cross = 0;
}

if (instance_exists(obj_player)) && (!global.game_pause) && (!obj_controller_ui.teaserend){
	// Mouse Type
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
	mouse = MouseType.Dot;
}