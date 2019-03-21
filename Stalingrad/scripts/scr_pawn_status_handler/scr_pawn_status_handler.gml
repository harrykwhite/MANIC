// Burn control
if (burn){
	if (!burn_start){
		burn_x = x;
		burn_y = y;
		burn_time = 45;
		burn_cycle = 4;
		burn_start = true;
		move_xTo = x;
		move_yTo = y;
		burn_sound = scr_sound_play(snd_character_burn_0, true, 1, 1);
	}
	
	scr_sound_set_distance(burn_sound, 110);
	
	if (burn_time > 0){
		burn_time--;
	}else{
		if (burn_start) && (object_index != obj_thescorched){
			if (burn_cycle > 0){
				burn_cycle--;
				burn_time = 55;
				scr_pawn_damage(1, 0, 0, 5);
				scr_sound_play_distance(choose(snd_character_hit_0, snd_character_hit_1), false, 200);
			}else{
				scr_draw_burn_die(6, 18, x, y, 5);
				burn_time = -1;
				burn_start = false;
				burn = false;
				move_xTo = x;
				move_yTo = y;
				audio_stop_sound(burn_sound);
				burn_sound = noone;
			}
		}
	}
}else{
	if (burn_sound != noone){
		while (audio_is_playing(burn_sound)){
			audio_stop_sound(burn_sound);
		}
		
		burn_sound = noone;
	}
}

// Poison control
if (poison){
	if (!poison_start){
		poison_time = 80;
		poison_start = true;
	}

	if (poison_time > 0){
		poison_time--;
	}else{
		poison_time = 80;
		scr_pawn_damage(1, 0, 0, 5);
		scr_sound_play(choose(snd_character_hit_0, snd_character_hit_1), false, 0.8, 1.2);
	}
}

// Bleed
if (bleed){
	if (bleed_time < 50){
		bleed_time ++;
	}else{
		scr_pawn_damage(1, 0, 0, 5);
		scr_sound_play(choose(snd_character_hit_0, snd_character_hit_1), false, 0.8, 1.2);
		bleed_time = 0;
	}
}