if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y + 6, "Lights", obj_minecart_light);
}

mylight.x = x;
mylight.y = y + 6;
mylight.Light_Intensity = 1.15;

if (global.game_pause){
	return;
}

if (global.cutscene_current != -1){
	if (audio_is_playing(minecart_sound) && minecart_sound != noone){
		if (!audio_is_paused(minecart_sound)){
			audio_pause_sound(minecart_sound);
		}
	}
	return;
}

if (audio_is_paused(minecart_sound)){
	audio_resume_sound(minecart_sound);
}

if (!audio_is_playing(minecart_sound) || minecart_sound == noone){
	minecart_sound = scr_sound_play_distance(snd_object_minecart_0, true, 300);
}

scr_sound_set_distance(minecart_sound, 300);
audio_sound_gain(minecart_sound, audio_sound_get_gain(minecart_sound) * (abs(minecart_speed) / 4), 0);