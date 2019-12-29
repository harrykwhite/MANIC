// Burn control
if (global.cutscene_current != -1) || (!instance_exists(obj_player)){
	return;
}

var is_fly = object_index == obj_enemy_1;
var hurt_sound = choose(snd_character_hit_0, snd_character_hit_1);

if (object_index == obj_enemy_3 || object_index == obj_giantturret || object_index == obj_giantturret_flamethrower){
	hurt_sound = snd_object_metal_hit_0;
}

if (!is_fly){
	if (cutscene_prop){
		return;
	}
}

if (burn){
	if (!burn_start){
		burn_x = x;
		burn_y = y;
		burn_time = 65;
		burn_cycle = 4;
		burn_start = true;
		move_x_to = x;
		move_y_to = y;
		
		if (!is_fly){
			burn_sound = scr_sound_play(snd_character_burn_0, true, 1, 1);
		}
	}
	
	if (!is_fly){
		scr_sound_set_distance(burn_sound, 110);
	}
	
	if (burn_time > 0){
		burn_time--;
	}else{
		if (burn_start) && (object_index != obj_thescorched){
			if (burn_cycle > 0){
				burn_cycle--;
				burn_time = 55;
				
				if (health_current > 1) || (object_get_parent(object_index) != obj_p_player){
					scr_pawn_damage(1, 0, 0, 5);
					scr_sound_play_distance(hurt_sound, false, 200);
				}
			}else{
				scr_draw_burn_die(6, 18, x, y, 5);
				burn_time = -1;
				burn_start = false;
				burn = false;
				move_x_to = x;
				move_y_to = y;
				
				if (!is_fly){
					audio_stop_sound(burn_sound);
				}
				
				burn_sound = noone;
			}
		}
	}
}else{
	if (!is_fly){
		if (burn_sound != noone){
			while (audio_is_playing(burn_sound)){
				audio_stop_sound(burn_sound);
			}
		
			burn_sound = noone;
		}
	}
}

// Poison control
if (poison){
	if (!poison_start){
		poison_time = 90;
		poison_start = true;
	}

	if (poison_time > 0){
		poison_time--;
	}else{
		poison_time = 80;
		
		if (health_current > 1) || (object_get_parent(object_index) != obj_p_player){
			scr_pawn_damage(1, 0, 0, 5);
			scr_sound_play(hurt_sound, false, 0.8, 1.2);
		}
	}
}

// Bleed
if (bleed){
	if (bleed_cycle > 0){
		if (bleed_time < 30){
			bleed_time ++;
		}else{
			if (health_current > 1) || (object_get_parent(object_index) != obj_p_player){
				scr_pawn_damage(1, 0, 0, 5);
				scr_sound_play(hurt_sound, false, 0.8, 1.2);
			}
			
			bleed_time = 0;
			bleed_cycle --;
		}
	}else{
		bleed = false;
		bleed_cycle = 3;
		bleed_time = 0;
	}
}