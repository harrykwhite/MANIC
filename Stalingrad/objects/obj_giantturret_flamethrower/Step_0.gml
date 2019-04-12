var ispaused = false;
if (global.game_pause){
	ispaused = true;
}

if (global.cutscene_current != -1){
	if (!in_cutscene){
		ispaused = true;
	}
}else{
	if (cutscene_prop){
		ispaused = true;
	}
}

if (instance_exists(turret)){
	if (!turret.active){
		ispaused = true;
	}
}

if (ispaused){
	if (abs(image_xscale) != scale) || (abs(image_yscale) != scale){
		image_xscale = sign(image_xscale) * scale;
		image_yscale = scale;
	}
	
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

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);

poison = false;
bleed = false;
headless = false;

scr_pawn_status_handler();
scr_giantturret_flamethrower_0();
scr_pawn_update();