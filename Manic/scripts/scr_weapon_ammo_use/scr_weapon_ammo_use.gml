///@param  amount
var amount = argument0;

if (scr_player_has_upgrade(PlayerUpgrade.AmmoPack)){
	if (chance(30)){
		return;
	}
}

if (global.weapon_slot_standalone == -1){
	global.weapon_slotammo[global.weapon_slotcurrent] -= amount;
	
	if (global.weapon_ammotype[global.weapon_slot[global.weapon_slotcurrent]] != AmmoType.Fuel) && (global.weapon_ammotype[global.weapon_slot[global.weapon_slotcurrent]] != AmmoType.Explosives) && (global.weapon_ammotype[global.weapon_slot[global.weapon_slotcurrent]] != AmmoType.Arrows) && (global.weapon_ammotype[global.weapon_slot[global.weapon_slotcurrent]] != AmmoType.Darts){
		global.weapon_slotammo[global.weapon_slotcurrent] = clamp(global.weapon_slotammo[global.weapon_slotcurrent], 0, global.weapon_ammomax[global.weapon_slot[global.weapon_slotcurrent]]);
	}
}else{
	global.weapon_slot_standalone_ammo -= amount;
	
	if (global.weapon_ammotype[global.weapon_slot_standalone] != AmmoType.Fuel) && (global.weapon_ammotype[global.weapon_slot_standalone] != AmmoType.Explosives) && (global.weapon_ammotype[global.weapon_slot_standalone] != AmmoType.Arrows) && (global.weapon_ammotype[global.weapon_slot_standalone] != AmmoType.Darts){
		global.weapon_slot_standalone_ammo = clamp(global.weapon_slot_standalone_ammo, 0, global.weapon_ammomax[global.weapon_slot_standalone]);
	}
}

obj_controller_ui.weaponammo_scale = 1.2;
obj_controller_ui.weaponammo_scaleTo = 1;