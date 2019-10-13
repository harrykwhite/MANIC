if (global.game_pause){
	image_speed = 0;
	return;
}else{
	image_speed = 1;
}

if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y - 2, "Lights", obj_torch_wall_1_light);
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;