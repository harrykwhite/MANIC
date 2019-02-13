if (light_brightness < 1){
	light_brightness += 0.05;
}

if (global.game_pause) || ((global.cutscene_current != -1) && ((cutscene_prop) && (!in_cutscene))){
	image_speed = 0;
	if (audio_is_playing(burn_sound)){
		audio_pause_sound(burn_sound);
		burn_sound_paused = true;
	}
	exit;
}else{
	if (burn_sound_paused){
		audio_resume_sound(burn_sound);
		burn_sound_paused = false;
	}
}

livetime++;
burn = true;

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);

scr_pawn_status_handler();

if (health_current <= health_max / 2){
	scr_thescorched_behaviour_1();
	weapon_has = true;
}else{
	scr_thescorched_behaviour_0();
	weapon_has = false;
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.LutIntensity] = max((1.45 + (clamp(flash_time, 0, 2) / 10)) * light_brightness, 1.2);
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;

scr_pawn_update();
image_yscale = scale;