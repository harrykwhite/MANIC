if (global.game_pause){
	image_speed = 0;
	return;
}else{
	image_speed = 1;
}

if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y - 19, "Lights", obj_spear_ground_fire_0_light);
}

scr_env_burn_effects(0, -17, 4, 4, 55);

mylight.x = x;
mylight.y = y - 17;
mylight.Light_Range = 125 + light_radius_offset;