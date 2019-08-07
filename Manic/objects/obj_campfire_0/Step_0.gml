if (global.game_pause){
	image_speed = 0;
	if (audio_is_playing(burn_sound)){
		audio_pause_sound(burn_sound);
		burn_sound_paused = true;
	}
	return;
}else{
	if (burn_sound_paused){
		audio_resume_sound(burn_sound);
		burn_sound_paused = false;
	}
}

if (random(7) < 1){
	part_particles_create(global.ps_front, x, y - 16, global.pt_smoke_3, 1);
}

if (burn_sound == noone){
	burn_sound = scr_sound_play(snd_character_burn_0, true, 1, 1);
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.LutIntensity] = 1.45;
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;

scr_sound_set_distance(burn_sound, 110);
image_speed = 1.5;