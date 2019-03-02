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

global.depth_counter ++;
with(obj_controller_all){
	ds_depth_grid[# 0, global.depth_counter] = inst;
	ds_depth_grid[# 1, global.depth_counter] = yy;
	ds_depth_grid[# 2, global.depth_counter] = script;
	ds_depth_grid[# 3, global.depth_counter] = prescript;
}