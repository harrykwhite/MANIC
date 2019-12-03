var ispaused = false;
var stillsprite = spr_companion_2_idle_2;

if (light_brightness < 1){
	light_brightness += 0.025;
}else if (light_brightness > 1){
	light_brightness -= 0.025;
}

if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y, "Lights", obj_companion_light);
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.LutIntensity] = max((1.15 + (clamp(flash_time, 0, 2) / 10)) * light_brightness, 1.2);
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;

if (global.game_pause){
	ispaused = true;
}

if (ispaused){
	if (abs(image_xscale) != scale) || (abs(image_yscale) != scale){
		image_xscale = sign(image_xscale) * scale;
		image_yscale = scale;
	}
	
	image_speed = 0;
	return;
}

if (cutscene_prop){
	image_speed = 0.05;
	sprite_index = stillsprite;
	
	if (room == rm_level_5_01){
		image_xscale = scale;
		weapon.dir = 325;
	}
	
	if (global.cutscene_current != -1) && (!depart){
		if (instance_exists(obj_player)){
			if (!collision_line(x, y, obj_player.x, obj_player.y, obj_p_solid, false, true)){
				if (obj_player.x > x){
					image_xscale = scale;
					weapon.dir = 270 + 55;
				}else{
					image_xscale = -scale;
					weapon.dir = 270 - 55;
				}
			}
		}
	}
	
	return;
}else{
	in_cutscene = false;
	
	// Register companion
	if (!registered){
		global.game_companion_prisoner_found = true;
		scr_companion_register(object_index);
		registered = true;
	}else{
		global.player_companions[# 1, order] = health_current;
	}
	
	order = scr_companion_get_order();
}

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);

burn = false;
poison = false;
headless = false;

scr_pawn_status_handler();

if ((global.cutscene_current == -1) || (global.cutscene_current == 2) || (global.cutscene_current == 52) || (global.cutscene_current == 58)){
	if (cutscene_break_time > 0){
		cutscene_break_time --;
	}
	
	scr_companion_2_behaviour();
}else{
	image_speed = 0.05;
	sprite_index = stillsprite;
	
	cutscene_break_time = 50;
}

if (flash_time > 0){
	flash_time--;
}

health_current = max(health_current, 1);

scr_pawn_update();
image_yscale = scale;