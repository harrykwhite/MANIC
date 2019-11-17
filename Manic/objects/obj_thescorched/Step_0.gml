if (light_brightness < 1){
	light_brightness += 0.05;
}else if (light_brightness > 1){
	light_brightness -= 0.05;
}

if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y, "Lights", obj_thescorched_light);
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.LutIntensity] = max((1.45 + (clamp(flash_time, 0, 2) / 10)) * light_brightness, 1.2);
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;

obj_controller_ui.bosshealth_value_current = health_current;
obj_controller_ui.bosshealth_value_max = health_max;

var ispaused = false;

if (global.game_pause){
	ispaused = true;
}

if (global.cutscene_current == 58){
	knockback_speed = 0;
	knockback_direction = 0;
	i_time = 0;
	i_blend_time = 0;
	health_scale = 1;
	health_flash = 0;
	whiteflash_alpha = 0;
	run_count = 0;
	cutscene_prop = false;
	in_cutscene = true;
	
	if (instance_exists(obj_player)){
		if (obj_player.x > x){
			image_xscale = scale;
		}else{
			image_xscale = -scale;
		}
	}
	
	sprite_index = spr_thescorched_idle_1;
	image_speed = 0.05;
	
	ispaused = true;
}

if (global.cutscene_current == -1){
	in_cutscene = false;
}

if (ispaused){
	if (abs(image_xscale) != scale) || (abs(image_yscale) != scale){
		image_xscale = sign(image_xscale) * scale;
		image_yscale = scale;
	}
	
	image_speed = 0;
	return;
}

burn = true;
headless = false;

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);

scr_pawn_status_handler();

if (global.cutscene_current == -1) || (cutscene_prop){
	if (health_current <= health_max / 2){
		if (!mid_cutscene_played){
			global.cutscene_current = 58;
			mid_cutscene_played = true;
			return;
		}
		
		scr_thescorched_behaviour_1();
		weapon_has = true;
	}else{
		scr_thescorched_behaviour_0();
		weapon_has = false;
	}
}else{
	image_speed = 0;
}

scr_pawn_update();
image_yscale = scale;