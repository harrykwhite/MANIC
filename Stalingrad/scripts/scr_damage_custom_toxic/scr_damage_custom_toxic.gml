/// @param  width
/// @param  height
/// @param  time
/// @param damage_companion
var width = argument0;
var height = argument1;
var time = argument2;
var damage_companion = argument3;

var d = instance_create(x, y, obj_damage_poison);
d.width = width;
d.height = height;
d.time = time;
d.damage_companion = damage_companion;