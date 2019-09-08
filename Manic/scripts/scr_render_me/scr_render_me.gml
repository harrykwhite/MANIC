///@param y
///@param skipcheck
var inst = id;
var yy = argument[0];
var skipcheck = false;

if (argument_count == 2){
	skipcheck = argument[1];
}

if (!skipcheck){
	if (!onscreen(x + (sprite_width / 2), y + (sprite_height / 2), -80)){
		return;
	}
}

with(obj_controller_all){
	var grid = ds_depth_grid;
	grid[# 0, ds_depth_counter] = inst;
	grid[# 1, ds_depth_counter] = yy;
	ds_depth_counter ++;
}