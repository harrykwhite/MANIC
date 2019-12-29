if (place_meeting(x, y, obj_player)){
	fade = true;
}

if (fade){
	layer_set_visible(layer_get_id("InteriorFloorWallSideTop"), false);
	instance_destroy();
}