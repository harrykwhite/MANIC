if (destroy){
	health_current = health_max;
	weapon_has = false;
	state = 0;
	active = false;
	cutscene_prop = true;
	in_cutscene = false;
	light_brightness = 0;
	
	x = xstart;
	y = ystart;
	destroy = false;
}