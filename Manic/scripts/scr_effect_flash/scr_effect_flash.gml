///@function scr_effect_flash
///@param increase_speed
///@param  decrease_speed
///@param  colour
var increase = argument[0];
var decrease = argument[1];
var colour = argument[2];
var fade = false;

if (argument_count > 3){
	fade = argument[3];
}

f = instance_create_layer(0, 0, "Control", obj_ef_flash);
f.increase_speed = increase;
f.decrease_speed = decrease;
f.colour = colour;
f.script = -1;
f.fade = fade;
f.alpha = increase;