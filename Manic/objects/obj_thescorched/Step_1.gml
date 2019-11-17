if (weapon_has){
	if (weapon == -1){
		weapon_index = PawnWeapon.Flamethrower;
		weapon = instance_create(x, y, obj_pawnweapon_10);
		weapon.owner = id;
	}else if (!instance_exists(weapon)){
		weapon_index = PawnWeapon.Flamethrower;
		weapon = instance_create(x, y, obj_pawnweapon_10);
		weapon.owner = id;
	}
	
	if (arm == -1){
		arm = instance_create(x, y, obj_enemy_0_arm);
		arm.owner = id;
	}else if (!instance_exists(arm)){
		arm = instance_create(x, y, obj_enemy_0_arm);
		arm.owner = id;
	}
}