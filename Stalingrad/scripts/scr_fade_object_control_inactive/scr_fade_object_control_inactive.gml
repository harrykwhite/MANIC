///@param group
var group = argument0;
var inactive = true;
var length = array_length_2d(global.fade_object_group, group);

for(var index = 0; index < length; index++){
	
	var inst = global.fade_object_group[group, index];
	
	if (inst != noone){
		if (inst.fade == true){
			inactive = false;
			break;
		}
	}
}

return inactive;