if (weapon_has){
	if (weapon == -1){
		weapon_index = PawnWeapon.Spear;
		weapon = instance_create(x, y, obj_pawnweapon_10);
		weapon.owner = self;
	}
	
	if (arm == -1) || (!instance_exists(arm)){
		arm = instance_create(x, y, obj_enemy_0_arm);
		arm.owner = id;
	}
}

if (destroy){
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
	event_perform(ev_create, 0);
	destroy = false;
}