if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	return;
}

image_speed = 1;

// Life
if (is_dropped){
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
}

image_alpha = (flicker ? 0.2 : 1);

// Picking Up
if (place_meeting(x + 1, y + 1, obj_player)){
    if (global.player_health_current < global.player_health_max){
        scr_player_heal(1);
		scr_effect_screenshake(1);
		scr_sound_play(snd_object_health_pickup_0, false, 0.9, 1.1);
		
		repeat(5){
			part_particles_create(global.ps_bottom, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_wood_1, 1);
		}
		
		part_type_direction(global.pt_heal_0, 0, 360, 0, 0);
		
		repeat(14){
			part_particles_create(global.ps_front, obj_player.x + random_range(-6, 6), obj_player.y + random_range(-13, 13), global.pt_heal_0, 1);
		}
		
		instance_destroy();
    }
}

// Motion
var has_target = false;
if (instance_exists(obj_player)){
	if (point_distance(x, y, obj_player.x, obj_player.y + 6) < 30) && (global.player_health_current < global.player_health_max){
		dir = point_direction(x, y, obj_player.x, obj_player.y + 6);
		
		if (spd < 3){
			spd += 0.2;
		}
		
		has_target = true;
	}
}

if (!has_target){
	spd *= 0.9;
}

if (spd > 0.02){
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
}else{
	spd = 0;
}