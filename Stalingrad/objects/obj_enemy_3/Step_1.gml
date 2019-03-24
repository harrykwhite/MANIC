if (destroy){
	if (instance_exists(mylight)){
		instance_destroy(mylight);
	}
	
	var feetplace = instance_place(x, y, obj_feetbox_0);
	if (feetplace != noone){
		instance_destroy(feetplace);
	}
	
	x = xstart;
	y = ystart;
	event_perform(ev_create, 0);
	destroy = false;
}