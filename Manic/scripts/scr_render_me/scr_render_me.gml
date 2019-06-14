/// @param y
var inst = id;
var yy = argument0;

with(obj_controller_all){
	var grid = ds_depth_grid;
	grid[# 0, ds_depth_counter] = inst;
	grid[# 1, ds_depth_counter] = yy;
	ds_depth_counter ++;
}