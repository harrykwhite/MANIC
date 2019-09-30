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
	mylight.light[| eLight.X] = x + (53 * sign(image_xscale));
	mylight.light[| eLight.Y] = y;
	mylight.light[| eLight.LutIntensity] = 1.25;
	mylight.light[| eLight.Flags] |= eLightFlags.Dirty;
}