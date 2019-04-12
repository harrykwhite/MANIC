var ispaused = false;
if (global.game_pause){
	ispaused = true;
}

if (global.cutscene_current != -1){
	if (global.cutscene_current == 2){
		if (cutscene_prop){
			ispaused = true;
		}
	}
	
	if (!in_cutscene) && (global.cutscene_current != 52){
		if (global.cutscene_current != 2) || (cutscene_prop){
			ispaused = true;
		}
	}
}else{
	if (cutscene_prop){
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

if (!registered){
	global.game_companion_farmer_found = true;
	scr_companion_register_me();
	registered = true;
}else{
	global.player_companions[# 1, order] = health_current;
}

order = scr_companion_get_order();

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);



scr_pawn_status_handler();

if (headless){
	scr_companion_headless(); 
}else if (burn){
	scr_companion_burn();
}else{
	scr_companion_0_behaviour();
}

if (flash_time > 0){
	flash_time--;
}

if (light_brightness < 1){
	light_brightness += 0.05;
}else if (light_brightness > 1){
	light_brightness -= 0.05;
}

if (instance_exists(mylight)){
	mylight.x = x;
	mylight.y = y;
	mylight.light[| eLight.X] = x;
	mylight.light[| eLight.Y] = y;
	mylight.light[| eLight.LutIntensity] = max((1.15 + (clamp(flash_time, 0, 2) / 10)) * light_brightness, 1.2);
	mylight.light[| eLight.Flags] |= eLightFlags.Dirty;
}

scr_pawn_update();
image_yscale = scale;