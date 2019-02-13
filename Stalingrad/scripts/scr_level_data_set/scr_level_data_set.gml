var ammo, wind;
ammo[0] = noone; ammo[1] = noone;
wind = global.weapon_slot[global.weapon_slotcurrent];

for(var am = 0; am < 1; am++){
	if (global.weapon_type[wind] == WeaponType.Melee) || (global.weapon_type[wind] == WeaponType.Throwing){
		ammo[am] = -1;
		continue;
	}
	
	if (instance_exists(global.weapon_object[wind])){
		ammo[am] = global.weapon_slotammo[global.weapon_slotcurrent];
	}
}

global.leveldata_weapon_ammo[0] = ammo[0];
global.leveldata_weapon_ammo[1] = ammo[1];