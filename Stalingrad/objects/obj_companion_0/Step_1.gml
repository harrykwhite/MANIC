if (!weapon_destroyed){
    if (weapon == -1){
        weapon = instance_create(x, y, global.pawnweapon_object[weapon_index]);
        weapon.owner = id;
        weapon.alphaTo = 0;
    }else if (!instance_exists(weapon)){
        weapon = instance_create(x, y, global.pawnweapon_object[weapon_index]);
        weapon.owner = id;
        weapon.alphaTo = 0;
    }
}

if (arm == -1){
	arm = instance_create(x, y, obj_companion_arm_0);
	arm.owner = id;
}