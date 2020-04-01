if (instance_exists(hitbox)){
	instance_destroy(hitbox);
}

if (instance_exists(mylight)){
	instance_destroy(mylight);
}

if (sound_handler){
	if (!sound_end_played){
		var soundend = scr_sound_play(snd_object_train_ride, false, 1, 1);
	
		audio_sound_gain(soundend, 0, 0);
		audio_sound_gain(soundend, 1 * obj_controller_all.real_sound_volume, 3000);
	
		if (audio_is_playing(sound_loop_inst)){
			audio_sound_gain(sound_loop_inst, 0, 3000);
		}
	
		sound_end_played = true;
	}
}