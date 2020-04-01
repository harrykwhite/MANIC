///@param  amount
var amount = argument0;

if (scr_player_has_upgrade(PlayerUpgrade.AmmoPack)){
	if (chance(25)){
		return;
	}
}

if (global.weapon_slot_standalone == -1){
	obj_controller_ui.weaponslot_ammoscale[global.weapon_slotcurrent] = 1.2;
	
	global.weapon_slotammo[global.weapon_slotcurrent] -= amount;
	global.weapon_slotammo[global.weapon_slotcurrent] = clamp(global.weapon_slotammo[global.weapon_slotcurrent], 0, global.weapon_ammomax[global.weapon_slot[global.weapon_slotcurrent]]);
}else{
	obj_controller_ui.weapon_standalone_ammoscale = 1.05;
	
	global.weapon_slot_standalone_ammo -= amount;
	global.weapon_slot_standalone_ammo = clamp(global.weapon_slot_standalone_ammo, 0, global.weapon_ammomax[global.weapon_slot_standalone]);
}