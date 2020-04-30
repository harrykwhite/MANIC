for(var i = 0; i < 4; i ++){
	if (instance_exists(flamethrower[i])){
		instance_destroy(flamethrower[i]);
	}
}

var flylength = array_length_1d(fly);
for(var i = 0; i < flylength; i ++){
	if (instance_exists(fly[i])){
		instance_destroy(fly[i]);
		fly[i] = noone;
	}
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
active = false;