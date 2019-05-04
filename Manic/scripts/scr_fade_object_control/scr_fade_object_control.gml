var grouparray = global.fade_object_group;
var height = array_height_2d(grouparray);

for(var group = 0; group < height; group ++){
	var length = array_length_2d(grouparray, group);
	
	for(var index = 0; index < length; index ++){
		var inst = grouparray[group, index];
		
		if (instance_exists(inst)){
			if (inst.fade){ // If pawn is detected on any ceiling of the house
				scr_fade_object_control_set(group, true); // Hide the entire ceiling group
				break;
			}
		}
	}
}