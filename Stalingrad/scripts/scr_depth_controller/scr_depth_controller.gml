/// @param y
/// @param script
/// @param prescript
var inst = id;
var yy = argument[0];
var script = argument[1];
var prescript = -1;

if (argument_count > 2){
	prescript = argument[2];
}

with(obj_controller_all){
	ds_depth_count ++;
	ds_depth_grid[# 0, ds_depth_count] = inst;
	ds_depth_grid[# 1, ds_depth_count] = yy;
	ds_depth_grid[# 2, ds_depth_count] = script;
	ds_depth_grid[# 3, ds_depth_count] = prescript;
}