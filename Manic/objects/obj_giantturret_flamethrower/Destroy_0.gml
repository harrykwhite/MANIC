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

var flylength = array_length_1d(fly);
for(var i = 0; i < flylength; i ++){
	if (instance_exists(fly[i])){
		instance_destroy(fly[i]);
		fly[i] = noone;
	}
}