///@param amount
///@param xrange
///@param yrange
///@param x
///@param y
var amount = argument[0];
var xrange = 5, xx = x;
var yrange = 5, yy = y;
var object = obj_ammo_0;

if (argument_count > 1){
	xrange = argument[1];
	yrange = argument[2];
	
	if (argument_count > 3){
		xx = argument[3];
		yy = argument[4];
	}
}

if (global.weapon_slot[global.weapon_slotcurrent] != -1){
	switch(global.weapon_ammotype[global.weapon_slot[global.weapon_slotcurrent]]){
		case AmmoType.Bullets:
			object = obj_ammo_0;
			break;
		
		case AmmoType.Fuel:
			object = obj_ammo_1;
			break;
		
		case AmmoType.Explosives:
			object = obj_ammo_2;
			break;
		
		case AmmoType.Arrows:
			object = obj_ammo_3;
			break;
			
		case AmmoType.Darts:
			object = obj_ammo_4;
			break;
	}
}

repeat(amount){
	var ammo;
	var tobject = object;
	var slotcount = global.weapon_slotmax;
	
	for(var i = 0; i < slotcount; i ++){
		if (global.weapon_slotcurrent == i){
			continue;
		}
		
		if (global.weapon_slot[i] != -1){
			if (global.weapon_ammotype[global.weapon_slot[i]]){
				if (random(4) < 1){
					switch(global.weapon_ammotype[global.weapon_slot[i]]){
						case AmmoType.Bullets:
							tobject = obj_ammo_0;
							break;
		
						case AmmoType.Fuel:
							tobject = obj_ammo_1;
							break;
		
						case AmmoType.Explosives:
							tobject = obj_ammo_2;
							break;
				
						case AmmoType.Arrows:
							tobject = obj_ammo_3;
							break;
				
						case AmmoType.Darts:
							tobject = obj_ammo_4;
							break;
					}
					
					break;
				}
			}
		}
	}
	
	ammo = instance_create(xx + random_range(-xrange, xrange), yy + random_range(-yrange, yrange), tobject);
    ammo.spd = random_range(0.8, 2.2);
    ammo.dir = random(360);
}