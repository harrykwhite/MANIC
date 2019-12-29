if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y + 6, "Lights", obj_minecart_light);
}

mylight.x = x;
mylight.y = y + 6;
mylight.Light_Intensity = 1.15;