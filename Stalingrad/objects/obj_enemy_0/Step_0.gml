if (light_brightness < 1){
	light_brightness += 0.05;
}

if (type == EnemyOneType.Grenadier) || (type == EnemyOneType.Sniper) || (type == EnemyOneType.SniperBoss){
	if (instance_exists(mylight)) && (mylight != noone){
		mylight.x = x;
		mylight.y = y - (9 * scale);
		mylight.light[| eLight.X] = x;
		mylight.light[| eLight.Y] = y - (9 * scale);
		mylight.light[| eLight.LutIntensity] = max((1.45 + (clamp(flash_time, 0, 2) / 10)) * light_brightness, 1.2);
		mylight.light[| eLight.Flags] |= eLightFlags.Dirty;
	
		if (type == EnemyOneType.SniperBoss){
			mylight.y -= scale;
			mylight.light[| eLight.Y] -= scale;
		}
	}
}

if (global.game_pause) || ((global.cutscene_current != -1) && (type != EnemyOneType.SniperBoss) &&
((global.cutscene_current != 33) && (!grenadier_cutscene_prop))
&& ((global.cutscene_current != 34) && (!crazy_cutscene_prop))
&& ((global.cutscene_current != 35) && (!sniper_cutscene_prop))
&& ((global.cutscene_current != 36) && (!fly_cutscene_prop))
&& ((global.cutscene_current != 38) && (!healer_cutscene_prop))){
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

if (grenadier_cutscene_prop){
	if (grenadier_in_cutscene){
		if (burn) || (burn_time > 0){
			scr_draw_burn_die(6, 18, x, y, 5);
			burn = false;
			burn_time = 0;
		}
	}
}

if (crazy_cutscene_prop){
	if (crazy_in_cutscene){
		if (burn) || (burn_time > 0){
			scr_draw_burn_die(6, 18, x, y, 5);
			burn = false;
			burn_time = 0;
		}
	}
}

if (sniper_cutscene_prop){
	if (sniper_in_cutscene){
		if (burn) || (burn_time > 0){
			scr_draw_burn_die(6, 18, x, y, 5);
			burn = false;
			burn_time = 0;
		}
	}
}

if (fly_cutscene_prop){
	if (fly_in_cutscene){
		if (burn) || (burn_time > 0){
			scr_draw_burn_die(6, 18, x, y, 5);
			burn = false;
			burn_time = 0;
		}
	}
}

if (healer_cutscene_prop){
	if (healer_in_cutscene){
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
	if (type == EnemyOneType.Crazy){
		scr_enemy_0_behaviour_crazy();
	}else if (type == EnemyOneType.SniperBoss){
		scr_enemy_0_behaviour_sniperboss();
	}else{
		scr_enemy_0_behaviour();
	}
}

scr_pawn_update();
image_yscale = scale;