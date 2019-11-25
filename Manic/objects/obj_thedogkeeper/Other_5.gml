if (instance_exists(levelobj)){
	levelobj.dogkeeper = noone;
	levelobj.dogkeeper_failed = true;
}

for(var i = 0; i < 3; i ++){
	if (instance_exists(dog[i])){
		instance_destroy(dog[i]);
	}
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