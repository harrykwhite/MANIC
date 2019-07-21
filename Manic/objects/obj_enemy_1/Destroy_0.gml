if (audio_is_playing(buzz)){
	audio_sound_gain(buzz, 0, 2000);
}

if (instance_exists(hitbox)){
	instance_destroy(hitbox);
}