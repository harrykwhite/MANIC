var grouparray = global.fade_object_group;
var height = array_height_2d(grouparray);

for(var group = 0; group < height; group ++){
	var length = array_length_2d(grouparray, group);
	if (scr_fade_object_control_inactive(group)){
		scr_fade_object_control_set(group, false);
	}
	
	for(var index = 0; index < length; index ++){
		var inst = grouparray[group, index];
		
		if (inst != noone){
			if (inst.fade){
				scr_fade_object_control_set(group, true);
			}
		}
	}
}