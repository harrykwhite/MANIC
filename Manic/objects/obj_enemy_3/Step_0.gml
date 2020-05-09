if (flash_time > 0){
	flash_time--;
}

if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y, "Lights", obj_enemy_3_light);
}

mylight.x = x;
mylight.y = y;
mylight.Light_Intensity = max(1.45 + (clamp(flash_time, 0, 2) / 10), 1.2);
mylight.Light_Intensity *= light_brightness;

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
	image_index = 0;
	return;
}

poison = false;
bleed = false;
headless = false;

scr_pawn_status_handler();

if (global.cutscene_current == -1) || (cutscene_prop){
	scr_enemy_3_behaviour();
}else{
	image_speed = 0;
	image_index = 0;
}

scr_pawn_update();

image_angle = dir;

if (abs(image_angle) < 90) || (abs(image_angle) > 270){
	image_yscale = scale;
}else{
	image_yscale = -scale;
}