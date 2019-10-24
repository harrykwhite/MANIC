if (!group_set){
	if (fade_group_x != -1) && (fade_group_y != -1){
		global.fade_object_group[fade_group_x, fade_group_y] = id;
		group_set = true;
	}
}