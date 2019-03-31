/// @param  amount
var amount = argument0;

global.weapon_slotammo[global.weapon_slotcurrent] += amount;
if (global.weapon_ammotype[global.weapon_slot[global.weapon_slotcurrent]] != AmmoType.Fuel) && (global.weapon_ammotype[global.weapon_slot[global.weapon_slotcurrent]] != AmmoType.Explosives) && (global.weapon_ammotype[global.weapon_slot[global.weapon_slotcurrent]] != AmmoType.Arrows) && (global.weapon_ammotype[global.weapon_slot[global.weapon_slotcurrent]] != AmmoType.Darts){
	global.weapon_slotammo[global.weapon_slotcurrent] = clamp(global.weapon_slotammo[global.weapon_slotcurrent], 0, global.weapon_ammomax[global.weapon_slot[global.weapon_slotcurrent]]);
}

obj_controller_ui.weaponammo_scale = 1.2;
obj_controller_ui.weaponammo_scaleTo = 1;