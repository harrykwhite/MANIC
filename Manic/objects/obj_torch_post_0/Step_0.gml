if (global.game_pause){
	image_speed = 0;
	return;
}else{
	image_speed = 1;
}

if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y - 16, "Lights", obj_torch_post_0_light);
}

scr_env_burn_effects(0, -16, 4, 4, 55);

mylight.x = x;
mylight.y = y - 16;