///@param ammotype
///@param fullcheck
var ammotype = argument0;
var fullcheck = argument1;

var slotcount = global.weapon_slotmax;

for(var s = 0; s < slotcount; s ++){
	var slot = global.weapon_slot[s];
	
	if (slot != -1){
		if (global.weapon_type[slot] == WeaponType.Ranged){
			if (global.weapon_ammotype[slot] == ammotype){
				if (fullcheck){
					if (global.weapon_slotammo[s] >= global.weapon_ammomax[slot]){
						continue;
					}
				}
				
				return true;
			}
		}
	}
}

return false;