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
	levelobj.dogkeeper = noone;
	levelobj.dogkeeper_failed = true;
	
	for(var i = 0; i < 3; i ++){
		if (instance_exists(dog[i])){
			instance_destroy(dog[i]);
		}
	}
	
	if (weapon != -1){
		instance_destroy(weapon);
		weapon = -1;
	}
	
	if (arm != -1){
		instance_destroy(arm);
		arm = -1;
	}
	
	instance_destroy();
}