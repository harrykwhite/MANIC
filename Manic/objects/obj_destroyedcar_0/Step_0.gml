if (global.game_pause){
	image_speed = 0;
	return;
}else{
	image_speed = 1;
}

if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y, "Lights", obj_destroyedcar_0_light);
}

scr_env_burn_effects(0, 0, 30, 12, 250);

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.LutIntensity] = 1.55;
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;