if (!reset){
	if (global.worldShadowMap != noone){
		if (surface_exists(global.worldShadowMap)){
			surface_free(global.worldShadowMap);
		}
	}
	
	reset = true;
}