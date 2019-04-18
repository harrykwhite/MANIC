/// @desc Setup renderer

tick = 0;
dirty = false;

if (global.worldShadowMap != undefined){
	if (surface_exists(global.worldShadowMap)){
		surface_free(global.worldShadowMap);
	}
}