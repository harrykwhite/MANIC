if (burn){
	if (burn_sound != noone){
		audio_stop_sound(burn_sound);
		burn_sound = noone;
	}
}

if (health_current > 0){
	for(var i = 0; i < dog_count; i ++){
		if (instance_exists(dog[i])){
			instance_destroy(dog[i]);
		}
	}
}

if (instance_exists(mylight)){
	instance_destroy(mylight);
}