if (global.game_pause){
	return;
}

var lvlo = scr_level_get_object();

if (!completed){
	if (part_time > 0){
		part_time --;
	}else{
		part_particles_create(global.ps_front, x + random_range(-9, 13), y + random_range(-16, 16), global.pt_glow_0, 1);
		part_time = part_time_max;
	}
	
	if (!audio_is_playing(post_sound) || post_sound == noone){
		post_sound = scr_sound_play(lvlo.hordepost_loop_sound, true, 1, 1);
	}
	
	scr_sound_set_distance(post_sound, 325);
}else{
	if (audio_is_playing(post_sound)){
		if (!completed_sound_faded){
			audio_sound_gain(post_sound, 0, 2000);
			completed_sound_faded = true;
		}
		
		if (audio_sound_get_gain(post_sound) <= 0){
			audio_stop_sound(post_sound);
		}
	}
}