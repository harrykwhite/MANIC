if (weapon != -1){
	instance_destroy(weapon);
	weapon = -1;
}

if (arm != -1){
	instance_destroy(arm);
	arm = -1;
}

if (instance_exists(hitbox)){
	instance_destroy(hitbox);
}

if (instance_exists(mylight)){
	instance_destroy(mylight);
}

x = xstart;
y = ystart;

event_perform(ev_create, 0);

cutscene_prop = true;
in_cutscene = false;