/// @desc Destroy light
if (!ds_exists(global.worldLights, ds_type_list)){
	return;
}

light_remove_from_world(light);
light_destroy(light);