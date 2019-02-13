// ** MUST BE CALLED WITHIN obj_controller_gameplay **
var old_weapon;

if (global.weapon_slot_standalone == -1){
	if (global.weapon_slot[global.weapon_slotcurrent] != -1) {
	    old_weapon = global.weapon_object[global.weapon_slot[global.weapon_slotcurrent]].id;
	}

	global.weapon_slotcurrent = !global.weapon_slotcurrent; // Change the current slot to the other one.

	// New Weapon Setup
	var new_weaponslot = global.weapon_slot[global.weapon_slotcurrent]; // Get the new weapon that has just been switched to.

	if (new_weaponslot != -1) {
	    if (!instance_exists(global.weapon_object[new_weaponslot])) {
	        var new_weapon = instance_create(global.player.x, global.player.y, global.weapon_object[new_weaponslot]); // Create the new weapon object.
	    }
	}
	
}else{
	old_weapon = global.weapon_object[global.weapon_slot[global.weapon_slotcurrent]];
}

// Replacing Old Weapon
var old_weaponslot = global.weapon_slot[!global.weapon_slotcurrent]; // Get the weapon that was previously selected.

if (global.weapon_slot_standalone != -1){
	old_weaponslot = global.weapon_slot[global.weapon_slotcurrent];
}

if (old_weaponslot != -1) {
    if (instance_exists(old_weapon)) {
        with(global.weapon_object[old_weaponslot]) instance_destroy();
    }
}