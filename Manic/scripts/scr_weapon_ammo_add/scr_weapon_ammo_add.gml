///@param amount
///@param type
var amount = argument[0];
var type = argument[1];

var slotcount = global.weapon_slotmax;
var slotcurrent = global.weapon_slotcurrent;

var keepgoing = false;

var startamount = amount;

for(var i = -1; i < slotcount; i ++){
	var ri = i;
	
	if (ri == slotcurrent){
		continue;
	}
	
	if (i == -1){
		ri = slotcurrent;
	}
	
	var slot = global.weapon_slot[ri];
	
	if (slot != -1){
		if (global.weapon_type[slot] == WeaponType.Ranged){
			var slotammo = global.weapon_slotammo[ri];
			var slotammomax = global.weapon_ammomax[slot];
			
			if (global.weapon_ammotype[slot] == type){
				if (slotammo < slotammomax){
					if (slotammo + amount <= slotammomax){
						global.weapon_slotammo[ri] += amount;
						amount = 0;
					}else{
						amount = slotammo + amount - slotammomax;
					
						if (amount == 0){
							continue;
						}
					
						global.weapon_slotammo[ri] += slotammomax - slotammo;
					
						keepgoing = true;
					}
				
					obj_controller_ui.weaponslot_ammoscale[ri] = 1.2;
					break;
				}
			}
		}
	}
}

if (startamount == amount){
	return false;
}

if (keepgoing){
	scr_weapon_ammo_add(amount, type, true);
}

return true;