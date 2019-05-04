if (destroy){
	if (!cutscene_prop){
		instance_destroy();
	}
	
	destroy = false;
}else{
	var pack = instance_place(x, y, obj_health_pack_1);
	if (pack != noone){
		instance_destroy(pack);
	}
}