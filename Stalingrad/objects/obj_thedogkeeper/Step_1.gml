if (arm == -1) || (!instance_exists(arm)){
	arm = instance_create(x, y, obj_enemy_0_arm);
	arm.owner = id;
}else{
	arm.image_angle = move_dir;
}

if (weapon_has){
	if (weapon == -1) || (!instance_exists(weapon)){
		weapon_index = PawnWeapon.Shotgun;
		weapon = instance_create(x, y, obj_pawnweapon_11);
		weapon.owner = self;
	}
}

if (destroy){
	levelobj.dogkeeper_failed = true;
	health_current = health_max;
	weapon_has = false;
	cutscene_prop = true;
	in_cutscene = false;
	light_brightness = 0;
	
	for(var i = 0; i < 3; i++){
		if (instance_exists(dog[i])){
			instance_destroy(dog[i]);
		}
	}
	
	dog_count = 3;
	dogs_downed = false;
	dogs_alive = 3;
	dog[0] = instance_create(x, y, obj_thedogkeeper_dog);
	dog[0].keeper = id;
	dog[0].leash_length = 80;
	dog[0].leash_offset = -25;

	dog[1] = instance_create(x, y, obj_thedogkeeper_dog);
	dog[1].keeper = id;
	dog[1].leash_length = 100;
	dog[1].leash_offset = 0;

	dog[2] = instance_create(x, y, obj_thedogkeeper_dog);
	dog[2].keeper = id;
	dog[2].leash_length = 80;
	dog[2].leash_offset = 25;
	
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