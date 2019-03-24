if (weapon_has){
	if (state != 2){
	    if (weapon == -1){
	        weapon = instance_create(x, y, global.pawnweapon_object[weapon_index]);
	        weapon.owner = id;
	        weapon.alphaTo = 0;
	    }else if (!instance_exists(weapon)){
	        weapon = instance_create(x, y, global.pawnweapon_object[weapon_index]);
	        weapon.owner = id;
	        weapon.alphaTo = 0;
	    }
	}
	
	if (arm == -1) || (!instance_exists(arm)){
		arm = instance_create(x, y, obj_enemy_0_arm);
		arm.owner = id;
	}
}

if (destroy){
	if (weapon != -1){
		instance_destroy(weapon);
		weapon = -1;
	}
	
	if (arm != -1){
		instance_destroy(arm);
		arm = -1;
	}
	
	if (instance_exists(mylight)){
		instance_destroy(mylight);
	}
	
	x = xstart;
	y = ystart;
	event_perform(ev_create, 0);
	destroy = false;
}