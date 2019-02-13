if (burn_sound != noone){
	audio_stop_sound(burn_sound);
	burn_sound = noone;
}

instance_destroy(mylight);