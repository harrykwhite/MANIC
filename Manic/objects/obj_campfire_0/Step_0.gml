if (global.game_pause){
	image_speed = 0;
	return;
}else{
	image_speed = 1.5;
}

if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y, "Lights", obj_campfire_0_light);
}

scr_env_burn_effects(0, 0, 4, 4, 115);

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.LutIntensity] = 1.45;
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;