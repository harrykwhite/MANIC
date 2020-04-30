if (weapon != -1){
	instance_destroy(weapon);
	weapon = -1;
}

if (arm != -1){
	instance_destroy(arm);
	arm = -1;
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

arena_x = 198;
arena_y = 460;
arena_width = 534 - arena_x;
arena_height = 630 - arena_y;