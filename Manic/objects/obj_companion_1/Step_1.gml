if (!weapon_destroyed){
    if (weapon == -1){
        weapon = instance_create(x, y, global.pawnweapon_object[weapon_index]);
        weapon.owner = id;
    }else if (!instance_exists(weapon)){
        weapon = instance_create(x, y, global.pawnweapon_object[weapon_index]);
        weapon.owner = id;
    }
}

if (arm == -1){
	arm = instance_create(x, y, obj_companion_arm_0);
	arm.owner = id;
}else if (!instance_exists(arm)){
	arm = instance_create(x, y, obj_companion_arm_0);
	arm.owner = id;
}