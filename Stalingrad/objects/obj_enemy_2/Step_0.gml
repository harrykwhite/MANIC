if (light_brightness < 1){
	light_brightness += 0.05;
}

if (instance_exists(mylight)){
	mylight.x = x + (6 * scale);
	mylight.y = y + (4 * scale);
	mylight.light[| eLight.X] = x + (8 * scale * image_xscale);
	mylight.light[| eLight.Y] = y + (4 * scale);
	mylight.light[| eLight.LutIntensity] = max(1.3 * light_brightness, 1);
	mylight.light[| eLight.Flags] |= eLightFlags.Dirty;
}

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

livetime++;

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);

scr_pawn_status_handler();

if (headless){
	scr_enemy_2_behaviour_headless() 
}else if (burn){
	scr_enemy_2_behaviour_burn();
}else{
	scr_enemy_2_behaviour();
}

scr_pawn_update();
image_yscale = scale;