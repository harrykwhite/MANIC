mouse_scale = approach(mouse_scale, mouse_scaleTo, mouse_scaleSpeed);

if (global.cutscene_current != -1){
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
		if (global.level_current != Level.Prologue){
			mouse = global.weapon_mouse[4];
		}else{
			mouse = MouseType.Dot;
		}
	}
}else{
	mouse_scale = 1;
	mouse_alpha = 1;
	mouse = MouseType.Dot;
}