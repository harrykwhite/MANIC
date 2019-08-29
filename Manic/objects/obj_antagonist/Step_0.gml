if (light_brightness < 1){
	light_brightness += 0.005;
}else if (light_brightness > 1){
	light_brightness -= 0.005;
}

if (global.cutscene_current == 58){
	in_cutscene = true;
	
	if (!walk_off){
		active = false;
		
		if (distance_to_object(obj_player) > 90){
			var dirto = point_direction(x, y, obj_player.x, obj_player.y);
			obj_player.move_x_to = x + lengthdir_x(30, dirto);
			obj_player.move_y_to = y + lengthdir_y(30, dirto);
			obj_player.move_extSpd = 1.5;
		}else{
			if (obj_player.x > x){
				obj_player.move_x_to = obj_player.x - 5;
			}else{
				obj_player.move_x_to = obj_player.x + 5;
			}
		
			obj_player.move_y_to = obj_player.y;
			obj_player.move_extSpd = 0;
		}
	}else{
		active = true;
	}
}else if (global.cutscene_current == -1){
	if (in_cutscene){
		obj_player.move_x_to = -1;
		obj_player.move_y_to = -1;
		obj_player.move_extSpd = 0;
		in_cutscene = false;
	}
	
	if (!cutscene_prop){
		active = true;
	}
}

if (instance_exists(mylight)){
	mylight.x = x;
	mylight.y = y;
	mylight.light[| eLight.X] = x;
	mylight.light[| eLight.Y] = y;
	mylight.light[| eLight.LutIntensity] = max((1.15 + (clamp(flash_time, 0, 2) / 10)) + light_brightness, 1.15);
	mylight.light[| eLight.Flags] |= eLightFlags.Dirty;
}

obj_controller_ui.bosshealth_value_current = health_current;
obj_controller_ui.bosshealth_value_max = health_max;

var ispaused = false;
if (global.game_pause){
	ispaused = true;
}

if (!active){
	ispaused = true;
	i_blend_time = 0;
	whiteflash_alpha = 0;
	i_time = 0;
	
	sprite_index = spr_antagonist_idle_0;
	image_speed = 0;
	image_index = 0;
	
	if (instance_exists(obj_player)){
		if (weapon != -1){
			if (instance_exists(weapon) && weapon != -1){
				weapon.attack = false;
				weapon.dir = point_direction(x, y, obj_player.x, obj_player.y);
			}
		}
		
		if (obj_player.x > x){
			image_xscale = scale;
		}else{
			image_xscale = -scale;
		}
	}
}

if (global.cutscene_current != -1){
	if (!cutscene_prop) && (!in_cutscene){
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

scr_pawn_status_handler();

if (room == rm_level_6_pre_00){
	scr_antagonist_behaviour_1();
	
	if (health_current <= 10){
		health_current = 10;
		
		if (!near_dead){
			audio_sound_gain(global.boss_music[global.boss_current], 0, 5000);
			audio_play_sound(global.boss_stinger[global.boss_current], 3, false);
			global.boss_current = -1;
			
			near_dead = true;
			global.game_boss_firstantag_killed = true;
			global.cutscene_current = 58;
		}
	}
}else{
	scr_antagonist_behaviour_0();
}

scr_pawn_update();
image_yscale = scale;