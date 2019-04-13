/// @desc Free the lighting engine

vertex_format_delete(global.lightVertexFormat);

// Remove all lights, if any
if (ds_exists(global.worldLights, ds_type_list)){
	var lights = global.worldLights;
	var lightcount = ds_list_size(lights);
	
	for(var i = 0; i < lightcount; ++i) {
		if (lights[| i] != undefined){
			light_destroy(lights[| i]);
		}
	}
	
	ds_list_destroy(lights);
}

ds_map_destroy(global.lightVertexArrayMap);

if(global.worldShadowMap != undefined && surface_exists(global.worldShadowMap)){
	surface_free(global.worldShadowMap);
}

if(global.lightShadowMap != undefined && surface_exists(global.lightShadowMap)){
	surface_free(global.lightShadowMap);
}
	
ds_list_destroy(global.worldDirtyShadowCasters);