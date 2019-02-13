if (weapon_has){
	if (weapon == -1){
		weapon_index = PawnWeapon.Flamethrower;
		weapon = instance_create(x, y, obj_pawnweapon_10);
		weapon.owner = self;
	}
	
	if (arm == -1) || (!instance_exists(arm)){
		arm = instance_create(x, y, obj_enemy_0_arm);
		arm.owner = id;
	}
}

if (destroy){
	health_current = health_max;
	weapon_has = false;
	state = 0;
	cutscene_prop = true;
	in_cutscene = false;
	release_count = 0;
	release_time = 45;
	release_offset = 0;
	light_brightness = 0;
	run_x = x;
	run_y = y;
	run_count = 0;
	
	if (weapon != -1){
		instance_destroy(weapon);
		weapon = -1;
	}
	
	if (arm != -1){
		instance_destroy(arm);
		arm = -1;
	}
	
	x = xstart;
	y = ystart;
	destroy = false;
}