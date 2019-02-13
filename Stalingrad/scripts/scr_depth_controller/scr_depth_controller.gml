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
	var yl = ds_depth_count;
	
	if (yl < 1){
		ds_depth_num = 50 + instance_number(obj_p_depth) + instance_number(obj_p_depth_environhit) + instance_number(obj_p_depth_solid_shadow) + instance_number(obj_p_depth_solid_noshadow) + instance_number(obj_p_depth_decorative);
		ds_grid_resize(ds_depth_grid, 4, ds_depth_num + 1);
		
		if (ds_depth_num <= 0){
			exit;
		}
	}
	
	if (yl > ds_depth_num){
		break;
	}
	
	ds_depth_grid[# 0, yl] = inst;
	ds_depth_grid[# 1, yl] = yy;
	ds_depth_grid[# 2, yl] = script;
	ds_depth_grid[# 3, yl] = prescript;

	ds_depth_count++;
}