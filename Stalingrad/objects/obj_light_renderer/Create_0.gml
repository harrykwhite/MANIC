/// @desc Setup renderer

tick = 0;
dirty = false;

if (global.worldShadowMap != undefined){
	surface_free(global.worldShadowMap);
}