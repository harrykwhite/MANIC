if (arm == -1){
	arm = instance_create(x, y, obj_enemy_0_arm);
	arm.owner = id;
}else if (!instance_exists(arm)){
	arm = instance_create(x, y, obj_enemy_0_arm);
	arm.owner = id;
}else{
	arm.image_angle = move_dir;
}

if (weapon_has){
	if (weapon == -1) || (!instance_exists(weapon)){
		weapon = instance_create(x, y, global.pawnweapon_object[weapon_index]);
		weapon.owner = id;
	}
}