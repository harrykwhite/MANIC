///@param increase_speed
///@param decrease_speed
///@param colour
///@param script
///@param flash_option
var increase = argument[0];
var decrease = argument[1];
var colour = argument[2];
var script = argument[3];
var flash_option = false;

if (argument_count > 4){
	flash_option = argument[4];
}

f = instance_create_layer(0, 0, "Control", obj_ef_flash);
f.increase_speed = increase;
f.decrease_speed = decrease;
f.colour = colour;
f.script = script;
f.fade = false;
f.alpha = 0;
f.flash_option = flash_option;