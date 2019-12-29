if (global.game_pause){
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