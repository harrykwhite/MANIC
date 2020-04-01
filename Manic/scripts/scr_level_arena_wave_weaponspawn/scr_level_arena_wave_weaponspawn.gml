var winst;
var wnum = instance_number(obj_block_arena_weapon);

for(var w = 0; w < wnum; w ++){
	winst = instance_find(obj_block_arena_weapon, w);
	
	with(winst){
		switch(room){
			case rm_arena_1_00:
				index = choose(PlayerWeapon.Revolver, PlayerWeapon.MachineGun, PlayerWeapon.Shotgun);
				break;
		}
		
		if (global.weapon_type[index] == WeaponType.Throwing){
			pack = true;
			quantity = irandom_range(2, 3);
		}
		
		event_user(0);
	}
}