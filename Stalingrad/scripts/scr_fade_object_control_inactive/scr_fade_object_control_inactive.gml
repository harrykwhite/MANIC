///@param group
var group = argument0;
var grouparray = global.fade_object_group;
var length = array_length_2d(grouparray, group);

for(var index = 0; index < length; index ++){
	var inst = grouparray[group, index];
	
	if (inst != noone){
		if (inst.fade){
			return false;
		}
	}
}

return true;