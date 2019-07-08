var declist = ds_list_create();
var decnum = collision_rectangle_list(x, y, x + sprite_width, y + sprite_height, obj_p_decorative, false, true, declist, false);

if (decnum > 0){
	for(var i = 0; i < decnum; i ++){
		var inst = declist[| i];
		inst.ceiling = id;
	}
}

ds_list_destroy(declist);