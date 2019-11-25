if (global.game_boss_firstantag_killed) || (walk_off){
	if (room == rm_level_6_pre_00){
		if (instance_exists(inst_364BB55F)){
			instance_destroy(inst_364BB55F);
		}
	}
	
	instance_destroy();
	return;
}

if (weapon != -1){
	instance_destroy(weapon);
	weapon = -1;
}

if (arm != -1){
	instance_destroy(arm);
	arm = -1;
}

x = xstart;
y = ystart;

event_perform(ev_create, 0);

if (instance_exists(hitbox)){
	instance_destroy(hitbox);
}

if (instance_exists(mylight)){
	instance_destroy(mylight);
}

cutscene_prop = true;
in_cutscene = false;