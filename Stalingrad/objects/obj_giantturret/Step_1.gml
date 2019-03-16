if (destroy){
	health_current = health_max;
	weapon_has = false;
	shoot_time = 30;
	shoot_dir = 0;
	flamethrower_angle = 0;
	flamethrower_angle_sign = 1;
	flamethrower_angle_wait = 80;
	flamethrower_time = 30;
	state = 0;
	active = false;
	cutscene_prop = true;
	in_cutscene = false;
	light_brightness = 0;
	
	x = xstart;
	y = ystart;
	destroy = false;
}