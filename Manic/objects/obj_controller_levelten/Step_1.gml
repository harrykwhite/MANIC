// Companion spawning
if (!companions_spawned){
	scr_room_spawn_companion();
	companions_spawned = true;
}

// Weapon drops
if (!weapondrops_set){
	if (room == rm_level_10_00){
		var drop, droptype, dropcount;
		
		drop[0] = inst_99560B2; droptype[0] = PlayerWeapon.Grenade;
		drop[1] = inst_598D9F40; droptype[1] = PlayerWeapon.Katana;
		drop[2] = inst_2FE8F0B3; droptype[2] = PlayerWeapon.Spear;
		drop[3] = inst_6A66A1A1; droptype[3] = PlayerWeapon.MachineGun;
		drop[4] = inst_5D159B67; droptype[4] = PlayerWeapon.GrenadeLauncher;
		drop[5] = inst_CD20CD9; droptype[5] = PlayerWeapon.MP5;
		
		dropcount = array_length_1d(drop);
		
		for(var i = 0; i < dropcount; i ++){
			if (instance_exists(drop[i])){
				if (droptype[i] == PlayerWeapon.Grenade){
					drop[i].pack = true;
					drop[i].quantity = irandom_range(7, 9);
				}
				
				drop[i].index = droptype[i];
				drop[i].angle = random_range(-30, 30);
				drop[i].ammo = -1;
				drop[i].dataset = false;
			}
		}
	}
	
	weapondrops_set = true;
}