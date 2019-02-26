if (global.game_pause) || ((cutscene_prop) && (!in_cutscene)) || ((global.cutscene_current != -1) && (!in_cutscene)){
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

global.player_companion_health = health_current;
livetime++;

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);

scr_pawn_status_handler();

if (headless){
	scr_companion_headless(); 
}else if (burn){
	scr_companion_burn();
}else{
	scr_companion_1_behaviour();
}

if (flash_time > 0){
	flash_time--;
}

if (light_brightness < 1){
	light_brightness += 0.05;
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.LutIntensity] = max((1.55 + (clamp(flash_time, 0, 2) / 10)) * light_brightness, 1.2);
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;

scr_pawn_update();
image_yscale = scale;