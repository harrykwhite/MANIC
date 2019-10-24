if (weapon_has){
	if (state != 2){
	    if (weapon == -1){
	        weapon = instance_create(x, y, global.pawnweapon_object[weapon_index]);
	        weapon.owner = id;
	    }else if (!instance_exists(weapon)){
	        weapon = instance_create(x, y, global.pawnweapon_object[weapon_index]);
	        weapon.owner = id;
	    }
	}
	
	if (arm == -1){
		arm = instance_create(x, y, obj_enemy_0_arm);
		arm.owner = id;
	}else if (!instance_exists(arm)){
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
	
	if (room == rm_level_6_pre_00){
		cutscene_prop = true;
		in_cutscene = false;
		
		if (global.game_boss_firstantag_killed){
			instance_destroy();
		}
	}
	
	x = xstart;
	y = ystart;
	event_perform(ev_create, 0);
	destroy = false;
}