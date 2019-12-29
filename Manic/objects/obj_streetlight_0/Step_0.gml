if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y - 17, "Lights", obj_streetlight_0_light);
}

mylight.x = x;
mylight.y = y - 17;
mylight.Light_Intensity = 1.55;