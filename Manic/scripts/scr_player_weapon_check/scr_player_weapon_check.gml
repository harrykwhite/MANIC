var weapon, mdir = point_direction(x, y, scr_input_get_mouse_x(), scr_input_get_mouse_y());

if (global.weapon_slot[global.weapon_slotcurrent] != -1){
    weapon = global.weapon_object[global.weapon_slot[global.weapon_slotcurrent]];
    
    if (!instance_exists(weapon)){
        var wep = instance_create(x, y, weapon);
		wep.image_angle = mdir;
		
		with(wep){
			event_perform(ev_step_end, 0);
		}
    }
}else if (global.weapon_default != -1){
	global.weapon_slot[global.weapon_slotcurrent] = global.weapon_default;
	
    if (!instance_exists(global.weapon_object[global.weapon_default])){
        var wep = instance_create(x, y, global.weapon_object[global.weapon_default]);
		wep.image_angle = mdir;
		
		with(wep){
			event_perform(ev_step_end, 0);
		}
	}
}

while(!instance_exists(obj_player_arm)){
    instance_create(x, y, obj_player_arm);
	obj_player_arm.image_angle = mdir;
}