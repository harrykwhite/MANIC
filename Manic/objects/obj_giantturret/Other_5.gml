if (instance_exists(hitbox)){
	instance_destroy(hitbox);
}

if (instance_exists(mylight)){
	instance_destroy(mylight);
}

for(var i = 0; i < 4; i ++){
	if (instance_exists(flamethrower[i])){
		instance_destroy(flamethrower[i]);
	}
}

x = xstart;
y = ystart;

event_perform(ev_create, 0);

cutscene_prop = true;
in_cutscene = false;