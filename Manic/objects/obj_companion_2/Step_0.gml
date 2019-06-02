var ispaused = false;
var freezeanim = false;
if (global.game_pause){
	ispaused = true;
	freezeanim = true;
}

if (global.cutscene_current != -1){
	if (global.cutscene_current == 2) || (global.cutscene_current == 52){
		if (cutscene_prop) || (in_cutscene){
			ispaused = true;
		}
	}else if (!in_cutscene){
		ispaused = true;
	}
}else{
	if (cutscene_prop){
		ispaused = true;
		
		if (instance_exists(obj_player)){
			if (!collision_line(x, y, obj_player.x, obj_player.y, obj_p_solid, false, true)){
				if (obj_player.x > x){
					image_xscale = scale;
					weapon.dir = 360;
				}else{
					image_xscale = -scale;
					weapon.dir = 180;
				}
			}
		}
	}
}

if (ispaused){
	if (abs(image_xscale) != scale) || (abs(image_yscale) != scale){
		image_xscale = sign(image_xscale) * scale;
		image_yscale = scale;
	}
	
	if (freezeanim){
		image_speed = 0;
	}else{
		image_speed = 0.05;
		sprite_index = spr_companion_2_idle_0;
	}
	
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
	global.game_companion_prisoner_found = true;
	scr_companion_register(object_index);
	registered = true;
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
	scr_companion_2_behaviour();
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