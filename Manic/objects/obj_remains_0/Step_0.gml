if (global.game_pause){
	image_speed = 0;
	return;
}else{
	image_speed = 1;
}

if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y, "Lights", obj_remains_light);
}

scr_env_burn_effects(0, 0, 8, 4, 115);

mylight.x = x;
mylight.y = y;
mylight.Light_Intensity = 1.55;