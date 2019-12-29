if (global.game_pause){
	image_speed = 0;
	return;
}else{
	image_speed = 1;
}

if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y - 2, "Lights", obj_torch_wall_0_light);
}

scr_env_burn_effects(0, -2, 4, 4, 55);

mylight.x = x;
mylight.y = y - 2;