instance_activate_all();

while (instance_exists(obj_weapondrop)){
	with(obj_weapondrop){
		instance_destroy();
	}
}