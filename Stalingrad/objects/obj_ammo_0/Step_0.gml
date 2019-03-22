if (global.game_pause){
	exit;
}

// Finding Player
var w_index = global.weapon_slot[global.weapon_slotcurrent];
var player = obj_player;

attract = false;

if (instance_exists(player)){
    if (w_index != -1){
		if (global.weapon_type[w_index] == WeaponType.Ranged){
	        if (instance_exists(global.weapon_object[w_index])){
	            if (distance_to_object(player) < 30) && (!collision_line(x, y, player.x, player.y, obj_p_solid, false, true)){
	                if (global.weapon_slotammo[global.weapon_slotcurrent] < global.weapon_ammomax[global.weapon_slot[global.weapon_slotcurrent]]){
	                    if (global.weapon_ammotype[global.weapon_slot[global.weapon_slotcurrent]] == AmmoType.Bullets){
							attract = true;
							enemy = false;
						}
	                }
	            }
	        }
		}
    }
}

// Moving to Player
if (instance_exists(player)) && (global.weapon_slot[global.weapon_slotcurrent]!= -1){
    if (attract){
        dir = point_direction(x, y, player.x, player.y);
        spd += 0.2;
		
        if (place_meeting(x + 1, y + 1, player)){
            instance_destroy();
            scr_weapon_ammo_add(global.weapon_slot[global.weapon_slotcurrent], 1);
            scr_effect_screenshake(1);
			scr_sound_play(snd_weapon_ammo_pickup_0, false, 0.8, 1.2);
		}
        
    }else{
        spd -= 0.2;
    }
}else{
    spd -= 0.2;
}

// Motion
spd = clamp(spd, 0, 4);

if (spd > 0){
	if (!place_meeting(x + lengthdir_x(spd + 3, dir), y + lengthdir_y(spd + 3, dir), obj_p_solid)){
		x += lengthdir_x(spd, dir);
		y += lengthdir_y(spd, dir);
	}else{
		spd = 0;
	}
}