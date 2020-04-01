///@param ammotype
///@param speed
///@param maxspeed
var ammotype = argument0;
var ammospeed = argument1;
var ammomaxspeed = argument2;

// Life
if (life < life_max){
	life ++;
}else{
	instance_destroy();
}

if (life > life_max * 0.85){
	if (flicker_time > 0){
		flicker_time --;
	}else{
		flicker = !flicker;
		flicker_time = flicker_time_max;
	}
}

// Finding Player
var windex = global.weapon_slot[global.weapon_slotcurrent];
var player = obj_player;
var playerexists = instance_exists(player);

attract = false;

if (playerexists){
    if (distance_to_object(player) < 30){
		if (scr_ammo_find_matching_type(ammotype, true)){
	        attract = true;
			enemy = false;
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
            scr_weapon_ammo_add(1, ammotype);
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
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
}