///@desc Gets the static buffer for a light and shadow caster pair
///@arg light The light
///@arg shadow_caster The shadow caster
///@returns The stored buffer, || noone

var light = argument0;
var shadow_caster = argument1;

var static_storage = light[| eLight.StaticStorage];
if (static_storage == noone) return noone;

return static_storage[? shadow_caster];