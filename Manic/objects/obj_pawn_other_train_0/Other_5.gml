if (sound_handler){
	if (audio_is_playing(sound_loop_inst)){
		audio_sound_gain(sound_loop_inst, 0, 3000);
	}
	
	sound_end_played = true;
}

instance_destroy();