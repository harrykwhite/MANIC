var ispaused = false;
var stillsprite = spr_companion_3_idle_0;

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
	
	if (room == rm_level_8_01){
		image_xscale = scale;
	}
	
	if (global.cutscene_current != -1){
		if (instance_exists(obj_player)){
			if (!collision_line(x, y, obj_player.x, obj_player.y, obj_p_solid, false, true)){
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
	in_cutscene = false;
	
	// Register companion
	if (!registered){
		global.game_companion_dog_found = true;
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
	
	scr_companion_3_behaviour();
}else{
	image_speed = 0.05;
	sprite_index = stillsprite;
	
	cutscene_break_time = 50;
}

if (flash_time > 0){
	flash_time--;
}

if (light_brightness < 1){
	light_brightness += 0.025;
}else if (light_brightness > 1){
	light_brightness -= 0.025;
}

if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y + 5, "Lights", obj_companion_light);
}

mylight.x = x;
mylight.y = y + 5;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y + 5;
mylight.light[| eLight.LutIntensity] = max((1.15 + (clamp(flash_time, 0, 2) / 10)) * light_brightness, 1.2);
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;

health_current = max(health_current, 1);

scr_pawn_update();

if (room == rm_level_10_01){
	if (y <= finalboss_ymin + 2){
		finalboss_ymin_meeting = true;
	}
	
	y = max(y, finalboss_ymin);
}

image_yscale = scale;