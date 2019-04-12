if (ds_exists(global.worldLights, ds_type_list)){
	with(obj_light){
		light_remove_from_world(light);
		light_destroy(light);
	}
}