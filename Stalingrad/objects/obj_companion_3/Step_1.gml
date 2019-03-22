if (mylight == noone){
	mylight = instance_create(x, y + 5, obj_companion_light);
}

if (instance_exists(mylight)){
	instance_destroy(mylight);
}