if (!weaponstart_set){
	if (room == rm_level_10_01){
		for(var i = 0; i < 2; i ++){
			if (global.weapon_slot[i] == -1){
				weaponstart[i] = -1;
				weaponstart_ammo[i] = -1;
				weaponstart_quantity[i] = -1;
			}else{
				weaponstart[i] = global.weapon_slot[i];
				weaponstart_ammo[i] = global.weapon_slotammo[i];
			
				if (global.weapon_type[weaponstart[i]] == WeaponType.Throwing){
					weaponstart_quantity[i] = global.weapon_quantity[weaponstart[i]];
				}else{
					weaponstart_quantity[i] = -1;
				}
			}
		}
	}
	
	weaponstart_set = true;
}