/// @desc Free the lighting engine

vertex_format_delete(global.lightVertexFormat);

// Remove all lights, if any
if (ds_exists(global.worldLights, ds_type_list)){
	var lights = ds_list_size(global.worldLights);
	for(var i = 0; i < lights; ++i) {
		if (lights[| i] != undefined){
			light_destroy(lights[| i]);
		}
	}
	ds_list_destroy(global.worldLights);
}

ds_map_destroy(global.lightVertexArrayMap);

if(global.worldShadowMap != undefined && surface_exists(global.worldShadowMap)){
	surface_free(global.worldShadowMap);
}

if(global.lightShadowMap != undefined && surface_exists(global.lightShadowMap)){
	surface_free(global.lightShadowMap);
}
	
ds_list_destroy(global.worldDirtyShadowCasters);