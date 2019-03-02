///@param group
///@param fade
var group = argument0;
var fade = argument1;
var length = array_length_2d(global.fade_object_group, group);

for(var index = 0; index < length; index++){
	var inst = global.fade_object_group[group, index];
	
	if (inst != noone){
		inst.fade = fade;
	}
}