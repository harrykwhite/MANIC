if (light_brightness < 1){
	light_brightness += 0.05;
}else if (light_brightness > 1){
	light_brightness -= 0.05;
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.LutIntensity] = max((1.25 + (clamp(flash_time, 0, 2) / 10)) * light_brightness, 1);
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;

obj_controller_ui.bosshealth_value_current = health_current;
obj_controller_ui.bosshealth_value_max = health_max;

var ispaused = false;
if (global.game_pause){
	ispaused = true;
}

if (global.cutscene_current == 58) || (cutscene_prop){
	knockback_speed = 0;
	knockback_direction = 0;
	i_time = 0;
	i_blend_time = 0;
	health_scale = 1;
	health_flash = 0;
	whiteflash_alpha = 0;
	
	if (instance_exists(obj_player)){
		move_dir = point_direction(x, y, obj_player.x, obj_player.y);
		weapon.dir = move_dir;
		
		if (obj_player.x > x){
			image_xscale = scale;
		}else{
			image_xscale = -scale;
		}
	}
	
	if (dogs_downed){
		sprite_index = spr_thedogkeeper_idle_1;
	}else{
		sprite_index = spr_thedogkeeper_idle_0;
	}
	
	image_speed = 0.05;
	ispaused = true;
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

scr_pawn_status_handler();

if (dogs_alive < dog_count){
	var counter = 0;
	for(var i = 0; i < dog_count; i ++){
		if (instance_exists(dog[i])){
			if (dogs_alive == 2){
				switch(counter){
					case 0:
						dog[i].leash_offset = 22;
						dog[i].leash_length = 80;
						break;
			
					case 1:
						dog[i].leash_offset = -22;
						dog[i].leash_length = 80;
						break;
				}
			}else if (dogs_alive == 1){
				dog[i].leash_offset = 0;
				dog[i].leash_length = 100;
			}
		
			counter ++;
		}
	}
}

if (!dogs_downed){
	scr_thedogkeeper_behaviour_0();
}else{
	if (!weapon_has){
		weapon_has = true;
		weapon_index = PawnWeapon.HeavyShotgun;
	}
	
	//if (health_current > (health_max / 4)) && (!mid_cutscene_played){
	//	global.cutscene_current = 58;
	//	cutscene_prop = true;
	//	in_cutscene = true;
	//	mid_cutscene_played = true;
	//	return;
	//}
	
	scr_thedogkeeper_behaviour_1();
}

scr_pawn_update();
image_yscale = scale;