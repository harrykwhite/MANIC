///@param amount
///@param xrange
///@param yrange
///@param x
///@param y
var amount = argument[0];
var xrange = 5, xx = x;
var yrange = 5, yy = y;

if (argument_count > 1){
	xrange = argument[1];
	yrange = argument[2];
	
	if (argument_count > 3){
		xx = argument[3];
		yy = argument[4];
	}
}

var slotcount = global.weapon_slotmax;

var ammo;
var ammolist = ds_list_create();
var ammocount = 0;

var spawned = false;
var arena = scr_level_is_arena();

for(var i = 0; i < slotcount; i ++){
	if (global.weapon_slot[i] != -1){
		if (global.weapon_type[global.weapon_slot[i]] != WeaponType.Ranged){
			continue;
		}
		
		var add = noone;
		
		switch(global.weapon_ammotype[global.weapon_slot[i]]){
			case AmmoType.Bullets:
				add = obj_ammo_0;
				break;
			
			case AmmoType.Fuel:
				add = obj_ammo_1;
				break;
			
			case AmmoType.Explosives:
				add = obj_ammo_2;
				break;
			
			case AmmoType.Arrows:
				add = obj_ammo_3;
				break;
			
			case AmmoType.Darts:
				add = obj_ammo_4;
				break;
				
			case AmmoType.Shells:
				add = obj_ammo_5;
				break;
		}
		
		if (add != noone){
			ds_list_add(ammolist, add);
			ammocount ++;
		}
	}
}

repeat(amount){
	var tobject = obj_ammo_0;
	
	if (ammocount > 0){
		tobject = ammolist[| random(ammocount)];
	}
	
	if (spawned){
		if (!arena){
			if (random(100) < 15){
				continue;
			}
		}
	
		switch(tobject){
			case obj_ammo_2:
				if (random(100) < 75){
					continue;
				}
				break;
		
			case obj_ammo_3:
				if (random(100) < 20){
					continue;
				}
				break;
		
			case obj_ammo_4:
				if (random(100) < 20){
					continue;
				}
				break;
		
			case obj_ammo_5:
				if (random(100) < 70){
					continue;
				}
				break;
		}
	}
	
	ammo = instance_create(xx + random_range(-xrange, xrange), yy + random_range(-yrange, yrange), tobject);
    ammo.spd = random_range(0.8, 2.2);
    ammo.dir = random(360);
	
	spawned = true;
}

ds_list_destroy(ammolist);