if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y - 17, "Lights", obj_streetlight_0_light);
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y - 17;
mylight.light[| eLight.LutIntensity] = 1.55;
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;