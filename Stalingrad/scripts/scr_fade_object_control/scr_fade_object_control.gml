var height = array_height_2d(global.fade_object_group);

for(var group = 0; group < height; group++){
	
	var length = array_length_2d(global.fade_object_group, group);
	
	if (scr_fade_object_control_inactive(group) == true){
		scr_fade_object_control_set(group, false);
	}
	
	for(var index = 0; index < length; index++){
		
		var inst = global.fade_object_group[group, index];
		
		if (inst != noone){
			if (inst.fade == true){
				scr_fade_object_control_set(group, true);
			}
		}
	}
}