var flylength = array_length_1d(fly);
for(var i = 0; i < flylength; i ++){
	if (instance_exists(fly[i])){
		instance_destroy(fly[i]);
		fly[i] = noone;
	}
}

if (room == rm_level_10_01){
	if (!instance_exists(obj_giantturret)){
		var giantturret = instance_create(504, 414, obj_giantturret);
		giantturret.cutscene_prop = true;
	}
	
	instance_destroy();
	return;
}

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

if (instance_exists(hitbox)){
	instance_destroy(hitbox);
}

if (instance_exists(mylight)){
	instance_destroy(mylight);
}

event_perform(ev_create, 0);

cutscene_prop = true;
in_cutscene = false;