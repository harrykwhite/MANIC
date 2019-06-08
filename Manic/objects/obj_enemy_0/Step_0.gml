if (light_brightness < 1){
	light_brightness += 0.05;
}else if (light_brightness > 1){
	light_brightness -= 0.05;
}

if (type == Enemy0_Type.TrainBoss){
	obj_controller_ui.bosshealth_value_current = health_current;
	obj_controller_ui.bosshealth_value_max = health_max + (18 * 6);
}

if (type == Enemy0_Type.Grenadier) || (type == Enemy0_Type.Sniper) || (type == Enemy0_Type.TrainBoss){
	if (instance_exists(mylight)) && (mylight != noone){
		mylight.x = x;
		mylight.y = y - (9 * scale);
		mylight.light[| eLight.X] = x;
		mylight.light[| eLight.Y] = y - (9 * scale);
		mylight.light[| eLight.LutIntensity] = max((1.45 + (clamp(flash_time, 0, 2) / 10)) * light_brightness, 1.2);
		mylight.light[| eLight.Flags] |= eLightFlags.Dirty;
		
		if (type == Enemy0_Type.TrainBoss){
			mylight.y -= scale;
			mylight.light[| eLight.Y] -= scale;
		}
	}
}

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
	
	// Train Boss Dialogue Cutscene Defaults
	if (type == Enemy0_Type.TrainBoss) && (global.cutscene_current == 58){
		if (weapon != -1){
			if (instance_exists(weapon)) && (instance_exists(obj_player)){
				weapon.dir = point_direction(x, y, obj_player.x, obj_player.y);
				weapon.attack = false;
				
				if (obj_player.x > x){
					image_xscale = scale;
				}else{
					image_xscale = -scale;
				}
			}
		}
	}
	return;
}else{
	if (burn_sound_paused){
		audio_resume_sound(burn_sound);
		burn_sound_paused = false;
	}
}

livetime ++;

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);

scr_pawn_status_handler();

if (cutscene_prop){
	if (in_cutscene){
		if (burn) || (burn_time > 0){
			scr_draw_burn_die(6, 18, x, y, 5);
			burn = false;
			burn_time = 0;
		}
	}
}

if (headless){
	scr_enemy_0_behaviour_headless() 
}else if (burn){
	scr_enemy_0_behaviour_burn();
}else{
	if (type == Enemy0_Type.Crazy){
		scr_enemy_0_behaviour_crazy();
	}else if (type == Enemy0_Type.TrainBoss){
		scr_enemy_0_behaviour_sniperboss();
	}else{
		scr_enemy_0_behaviour();
	}
}

scr_pawn_update();
image_yscale = scale;