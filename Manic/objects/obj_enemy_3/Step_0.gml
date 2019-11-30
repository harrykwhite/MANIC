if (flash_time > 0){
	flash_time--;
}

if (light_brightness < 1){
	light_brightness += 0.025;
}else if (light_brightness > 1){
	light_brightness -= 0.025;
}

if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y, "Lights", obj_enemy_3_light);
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.LutIntensity] = max((1.45 + (clamp(flash_time, 0, 2) / 10)) * light_brightness, 1.2);
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;

var ispaused = false;
if (global.game_pause){
	ispaused = true;
}

if (ispaused){
	if (abs(image_xscale) != scale) || (abs(image_yscale) != scale){
		image_xscale = sign(image_xscale) * scale;
		image_yscale = sign(image_yscale) * scale;
	}
	
	image_speed = 0;
	return;
}

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);

poison = false;
bleed = false;
headless = false;

scr_pawn_status_handler();

if (global.cutscene_current == -1) || (cutscene_prop){
	scr_enemy_3_behaviour();
}else{
	image_speed = 0;
}

scr_pawn_update();

if (abs(image_angle) < 90) || (abs(image_angle) > 270){
	image_yscale = scale;
}else{
	image_yscale = -scale;
}

image_angle = dir;