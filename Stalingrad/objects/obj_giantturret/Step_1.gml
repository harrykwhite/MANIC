if (destroy){
	var fcount = array_length_1d(flamethrower);
	for(var i = 0; i < fcount; i++){
		if (instance_exists(flamethrower[i])){
			instance_destroy(flamethrower[i]);
		}
	}
	
	x = xstart;
	y = ystart;
	event_perform(ev_create, 0);
	destroy = false;
}