if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y + 6, "Lights", obj_minecart_light);
}

mylight.x = x;
mylight.y = y + 6;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y + 6;
mylight.light[| eLight.LutIntensity] = 1.15;
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;