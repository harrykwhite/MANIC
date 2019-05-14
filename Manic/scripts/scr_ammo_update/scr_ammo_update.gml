///@param ammotype
///@param speed
///@param maxspeed
var ammotype = argument0;
var ammospeed = argument1;
var ammomaxspeed = argument2;

// Finding Player
var windex = global.weapon_slot[global.weapon_slotcurrent];
var player = obj_player;
var playerexists = instance_exists(player);

attract = false;

if (playerexists){
    if (windex != -1){
		if (global.weapon_type[windex] == WeaponType.Ranged){
	        if (instance_exists(global.weapon_object[windex])){
	            if (distance_to_object(player) < 30) && (!collision_line(x, y, player.x, player.y, obj_p_solid, false, true)){
	                if (global.weapon_slotammo[global.weapon_slotcurrent] < global.weapon_ammomax[windex]){
	                    if (global.weapon_ammotype[windex] == ammotype){
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
if (playerexists) && (windex != -1){
    if (attract){
        dir = point_direction(x, y, player.x, player.y + 6);
        spd += ammospeed;
		
        if (place_meeting(x + 1, y + 1, player)){
            instance_destroy();
            scr_weapon_ammo_add(1);
            scr_effect_screenshake(1);
			scr_sound_play(snd_weapon_ammo_pickup_0, false, 0.8, 1.2);
		}
        
    }else{
        spd -= ammospeed;
    }
}else{
    spd -= ammospeed;
}

// Motion
spd = clamp(spd, 0, ammomaxspeed);

if (spd > 0){
	if (!place_meeting(x + lengthdir_x(spd + 3, dir), y + lengthdir_y(spd + 3, dir), obj_p_solid)){
		x += lengthdir_x(spd, dir);
		y += lengthdir_y(spd, dir);
	}else{
		spd = 0;
	}
}