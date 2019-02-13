var height = array_height_2d(global.fade_object_group);

for(var group = 0; group < height; group++){
	var length = array_length_2d(global.fade_object_group, group);
	
	for(var index = 0; index < length; index++){
		global.fade_object_group[group, index] = noone;
	}
}