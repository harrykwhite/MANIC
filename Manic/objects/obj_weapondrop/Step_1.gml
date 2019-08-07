if (!dataset){
	if (global.weapon_type[index] == WeaponType.Ranged){
		ammo = global.weapon_ammomax[index];
	}
	
	canburn = (index == PlayerWeapon.Stick);
	
	if (!place_meeting(x, y, obj_block_persistent)) && (!drop){
		var pers = instance_create(x, y, obj_block_persistent);
		pers.object[0] = object_index;
		pers.object_x[0] = x;
		pers.object_y[0] = y;
		pers.object_weapon[0] = index;
		pers.object_weapon_angle[0] = angle;
		pers.object_weapon_pack[0] = pack;
		pers.object_weapon_quantity[0] = quantity;
		pers.activate = false;
	}
	
	dataset = true;
}