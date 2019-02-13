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

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);

scr_pawn_status_handler();
scr_thedogkeeper_dog_behaviour_0();

scr_pawn_update();
image_yscale = scale;