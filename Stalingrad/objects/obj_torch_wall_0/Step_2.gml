if (flicker){
	if (flicker_time > 0){
		flicker_time --;
	}else{
		show_light = !show_light;
		flicker_time = random_range(180, 420);
		
		if (!show_light){
			flicker_time *= 0.25;
		}
	}
}

if (show_light){
	mylight.light[| eLight.Intensity] = start_intensity;
	image_index = 0;
}else{
	mylight.light[| eLight.Intensity] = 0;
	image_index = 1;
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;