if (global.game_pause) || (global.cutscene_current != -1){
	return;
}

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

// Picking Up
if (place_meeting(x + 1, y + 1, obj_player)){
    if (global.player_health_current < global.player_health_max){
		obj_player.whiteflash_alpha = 0.7;
        scr_player_heal(3);
		scr_effect_screenshake(1);
		scr_sound_play(snd_object_health_pickup_0, false, 0.9, 1.1);
		
		repeat(8){
			part_particles_create(global.ps_bottom, x + random_range(-8, 8), y + random_range(-6, 6), global.pt_wood_1, 1);
		}
		
		part_type_direction(global.pt_heal_0, 0, 360, 0, 0);
		
		repeat(24){
			part_particles_create(global.ps_front, obj_player.x + random_range(-10, 10), obj_player.y + random_range(-13, 13), global.pt_heal_0, 1);
		}
		
		instance_destroy();
    }
}