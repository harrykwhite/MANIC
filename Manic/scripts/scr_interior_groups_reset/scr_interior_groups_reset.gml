var width = array_height_2d(global.fade_object_group);
var height = array_length_2d(global.fade_object_group, 0);

for(var yy = 0; yy < height; yy ++){
	for(var xx = 0; xx < width; xx ++){
		global.fade_object_group[xx, yy] = noone;
	}
}