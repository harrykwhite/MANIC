if (flicker){
	if (flicker_time > 0){
		flicker_time --;
	}else{
		drawlight = !drawlight;
		flicker_time = random_range(5, 20);
		
		if (drawlight){
			if (random(4) > 1){
				flicker_time *= 8;
			}
		}
	}
}

if (!drawlight){
	mylight.light[| eLight.Range] = 0;
}else{
	mylight.light[| eLight.Range] = 135;
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y - 17;
mylight.light[| eLight.LutIntensity] = 1.55;
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;