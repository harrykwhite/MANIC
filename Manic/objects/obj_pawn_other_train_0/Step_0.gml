if (dir == 1 && x >= room_width + 500){
	instance_destroy();
}

if (dir == -1 && x < -500){
	instance_destroy();
}

if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	return;
}

image_speed = 0.1;
x += spd * dir;

if (dir == 1){
	image_xscale = 1;
}else{
	image_xscale = -1;
}

// Light
if (instance_exists(mylight)){
	mylight.x = x + (53 * sign(image_xscale));
	mylight.y = y;
	mylight.Light_Intensity = 1.25;
}

// Sound
scr_train_handle_sound();