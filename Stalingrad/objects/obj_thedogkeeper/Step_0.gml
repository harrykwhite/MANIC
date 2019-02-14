if (light_brightness < 1){
	light_brightness += 0.05;
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.LutIntensity] = max((1.45 + (clamp(flash_time, 0, 2) / 10)) * light_brightness, 1.2);
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;

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

var counter = 0;
for(var i = 0; i < dog_count; i++){
	if (instance_exists(dog[i])){
		if (dogs_alive == 2){
			switch(counter){
				case 0:
					dog[i].leash_offset = 20;
					dog[i].leash_length = 80;
					break;
			
				case 1:
					dog[i].leash_offset = -20;
					dog[i].leash_length = 80;
					break;
			}
		}else if (dogs_alive == 1){
			dog[i].leash_offset = 0;
			dog[i].leash_length = 100;
		}
		
		counter++;
	}
}

if (!dogs_downed){
	scr_thedogkeeper_behaviour_0();
	weapon_has = false;
}else{
	scr_thedogkeeper_behaviour_1();
	weapon_has = true;
}

scr_pawn_update();
image_yscale = scale;