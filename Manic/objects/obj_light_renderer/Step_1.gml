if (!reset){
	if (global.worldShadowMap != undefined){
		if (surface_exists(global.worldShadowMap)){
			surface_free(global.worldShadowMap);
		}
	}
	
	reset = true;
}