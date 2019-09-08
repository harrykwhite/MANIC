///@desc Destroy light
if (ds_exists(global.worldLights, ds_type_list)){
	light_remove_from_world(light);
	light_destroy(light);
}