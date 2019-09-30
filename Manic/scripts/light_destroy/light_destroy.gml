///@desc Destroy the light
///@arg light The light to destroy

var light = argument0;

// Destroy the vertex buffer
var buffer = light[| eLight.VertexBuffer];
if (buffer != noone) vertex_delete_buffer(buffer);

// Destroy the shadow map
var shadowMap = light[| eLight.ShadowMap];
if (shadowMap != noone && surface_exists(shadowMap)) surface_free(shadowMap);

// Destroy static storage
var static_storage = light[| eLight.StaticStorage];
if (static_storage != noone) ds_map_destroy(static_storage);

// Destroy out of range shadow casters map
var out_of_range_list = light[| eLight.ShadowCastersOutOfRange];
if (out_of_range_list != noone) ds_map_destroy(out_of_range_list);
if (static_storage != noone) ds_map_destroy(static_storage);

// Destroy culled shadow casters map
var culled_shadow_casters = light[| eLight.CulledShadowCasters];
if (culled_shadow_casters != noone) ds_map_destroy(culled_shadow_casters);

// Destroy extension modules list
var ext_modules = light[| eLight.ExtensionModules];
if (ext_modules != noone) ds_list_destroy(ext_modules);

// Destroy ignore set
var map = light[| eLight.IgnoreSet];
if (map != noone) ds_map_destroy(map);

// Destroy the light
ds_list_destroy(light);