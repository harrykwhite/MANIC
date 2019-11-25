///@param y
///@param skipcheck
var inst = id;
var yy = argument[0];
var skipcheck = false;

if (argument_count == 2){
	skipcheck = argument[1];
}

if (!skipcheck){
	var xorigin = sprite_get_xoffset(sprite_index);
	var yorigin = sprite_get_yoffset(sprite_index);
	
	if (!onscreen(x - xorigin + (sprite_width / 2), y - yorigin + (sprite_height / 2), -80)){
		return;
	}
}

with(obj_controller_all){
	ds_depth_grid[# 0, ds_depth_counter] = inst;
	ds_depth_grid[# 1, ds_depth_counter] = yy;
	ds_depth_counter = ds_depth_counter + 1;
}