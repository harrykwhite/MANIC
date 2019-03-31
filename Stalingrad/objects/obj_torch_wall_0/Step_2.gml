// TODO: add bright and flicker states

if (flicker){
	if (random(100) < 2){
		flicker_show = !flicker_show;
	}
}

if (show_light){
	mylight.light[| eLight.Intensity] = start_intensity;
}else{
	mylight.light[| eLight.Intensity] = 0;
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.LutIntensity] = 1.55;
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;