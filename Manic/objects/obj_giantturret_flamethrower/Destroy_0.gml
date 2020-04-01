if (burn){
	if (burn_sound != noone){
		audio_stop_sound(burn_sound);
		burn_sound = noone;
	}
}

if (audio_is_playing(shoot_sound)){
	audio_stop_sound(shoot_sound);
}

if (instance_exists(mylight)){
	instance_destroy(mylight);
}

if (instance_exists(hitbox)){
	instance_destroy(hitbox);
}