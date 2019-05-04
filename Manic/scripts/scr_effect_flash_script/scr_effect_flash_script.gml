/// @param increase_speed
/// @param  decrease_speed
/// @param  colour
/// @param  script
var increase = argument0;
var decrease = argument1;
var colour = argument2;
var script = argument3;

f = instance_create_layer(0, 0, "Control", obj_ef_flash);
f.increase_speed = increase;
f.decrease_speed = decrease;
f.colour = colour;
f.script = script;
f.fade = false;
f.alpha = 0;
